# Biometrics vs Branch example
Test for Branch integration with biometrics

## Steps
1. Launch project on device
2. Press "Nuke" - this clears the keychain of everything
3. Press "Save" - this saves the word "password" in the keychain, behind biometric auth
4. Relaunch the application

Expected:
The application should launch to the homepage uninterupted

Observe:
The FaceID/ TouchID prompt is shown to the user on launch.

Device tested:
iOS 13.4.1
iPhone 11 Pro Max
