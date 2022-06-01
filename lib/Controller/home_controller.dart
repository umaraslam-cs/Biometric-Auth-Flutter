import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class HomeController extends GetxController {
  final LocalAuthentication _auth = LocalAuthentication();
  bool isAuthenticated = false;
  bool showBiometric = false;

  isBiometricsAvailable() async {
    showBiometric = await hasEnrolledBiometrics();
    update();
  }

  Future<bool> hasEnrolledBiometrics() async {
    final List<BiometricType> availableBiometrics =
        await _auth.getAvailableBiometrics();

    if (availableBiometrics.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<bool> authenticate() async {
    final bool didAuthenticate = await _auth.authenticate(
        localizedReason: 'Please authenticate to proceed',
        options: const AuthenticationOptions(biometricOnly: true));
    return didAuthenticate;
  }
}
