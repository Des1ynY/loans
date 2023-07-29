# Взаймы

Loans application.

### Project setup

1. Configure development environment with FVM: `fvm use`

2. Get project dependencies: `fvm flutter pub get`

3. Generate missing files with *build_runner*: `fvm dart run build_runner build --delete-conflicting-outputs`

4. Generate missing localization files with *gen-l10n*: `fvm flutter gen-l10n`

5. Set your editor Dart line length property to **100** to avoid formatting issues.

### Platforms configuration

**Android**:

1. Generate project keystore with *keytool* and place it into [/android/app](/android/app) folder

2. Create *key.properties* file into [/android](/android) folder and fill all necessary fields.

You can find more information about android configuration [on this article](https://docs.flutter.dev/deployment/android#signing-the-app).

**IOS**

1. Open [/ios](/ios) folder with XCode application

2. Select *Runner* project and go to *Signing* category

3. Select your Apple Developer account as owner

You're all set now.

### Licensing

This project is provided under [MIT license](LICENSE).
