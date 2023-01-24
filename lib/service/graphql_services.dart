import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  Link link = HttpLink('https://swapi-graphql.netlify.app/');

  Future<QueryResult> performQuery(
    String query, {
    required Map<String, dynamic> variables,
    bool retry = true,
  }) async {
    final client = GraphQLClient(
      link: link,
      cache: GraphQLCache(),
      defaultPolicies: DefaultPolicies(
        watchQuery: Policies.safe(
          FetchPolicy.cacheAndNetwork,
          ErrorPolicy.none,
          CacheRereadPolicy.ignoreAll,
        ),
        query: Policies.safe(
          FetchPolicy.cacheAndNetwork,
          ErrorPolicy.none,
          CacheRereadPolicy.ignoreAll,
        ),
        mutate: Policies.safe(
          FetchPolicy.cacheAndNetwork,
          ErrorPolicy.none,
          CacheRereadPolicy.ignoreAll,
        ),
      ),
    );

    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: variables,
    );

    final result = await client.query(options);

    return result;
  }
}
