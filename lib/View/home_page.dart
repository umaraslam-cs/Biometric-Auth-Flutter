import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    homeController.isBiometricsAvailable();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              homeController.showBiometric
                  ? MaterialButton(
                      color: Colors.teal,
                      child: const Text(
                        'Biometric Login',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () async {
                        homeController.isAuthenticated =
                            await homeController.authenticate();
                        homeController.update();
                      },
                    )
                  : const Text('Please Enable Biometric Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red, fontSize: 18)),
              if (homeController.isAuthenticated)
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Successfully Authenticated',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 18),
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}
