import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/presentation/splash/vehicle_info.dart';
import 'package:test/provider/general_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GeneralHelper>(
      builder: (context, generalHelper, widget) {
        return generalHelper.vehicles.isEmpty
            ? Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/flutter-logo.jpeg',
                        height: 200,
                      ),
                      const SizedBox(height: 50),
                      const CircularProgressIndicator(),
                    ],
                  ),
                ),
              )
            : SafeArea(
                child: Scaffold(
                  body: ListView.builder(
                    itemCount: generalHelper.vehicles.length,
                    itemBuilder: (context, index) {
                      final vehicle = generalHelper.vehicles[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) => VehicleInfo(
                                vehicle: vehicle,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.yellow[50],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                vehicle['name'],
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                vehicle['model'],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[800],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
      },
    );
  }
}
