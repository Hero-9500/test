class GQLQueries {
  static const String allVehicles = r'''
query (
$first: Int
) {
  allVehicles(after: "",first:1, before:"",last:100)
   {
    totalCount,
    vehicles{
      name
    }
  }
}
''';
}
