# FRC Scouting App

A scouting app designed for FRC Robotics, built with Flutter.

---

## 🚀 For Developers

To debug or contribute to this application, several prerequisites are required.

> 💡 Remember to run `git pull` regularly to stay up to date with the latest code!

---

### ⚙️ Prerequisites

> Condensed version. For full setup instructions, visit the [official Flutter install guide](https://docs.flutter.dev/get-started/install/windows/mobile).

#### 🧑‍💻 Code Editor
- Recommended: [Visual Studio Code](https://code.visualstudio.com/download)
- Install the **Flutter** and **Dart** extensions from the Extensions Marketplace

#### 🧬 Git
- Download from: [https://git-scm.com/downloads](https://git-scm.com/downloads)

#### 🧪 Debugging Options (Optional)
You can debug using any of the following:

- **Chrome / Edge** (default if no other devices are set up)
- **Windows Desktop**:
  - Install [Visual Studio](https://visualstudio.microsoft.com/downloads/) (not VS Code)
  - During installation, select **"Desktop development with C++"**
- **Android**:
  - Install [Android Studio](https://developer.android.com/studio)
  - Open SDK Manager → SDK Tools → Ensure **"Android SDK Command-line Tools"** is installed
  - Accept licenses:
    ```bash
    flutter doctor --android-licenses
    ```
    Press `y` to accept all

#### 🐦 Flutter SDK
1. Open VS Code
2. Ensure the **Flutter** extension is installed
3. Open Command Palette (`Ctrl + Shift + P`) and type `Flutter: New Project`
4. If Flutter SDK is not installed:
   - Click **Download SDK** and choose a folder (avoid paths with spaces or special characters)
   - After download, click **"Add SDK to PATH"**
5. If you already have the SDK:
   - Click **Locate SDK** and select the folder (usually named `flutter`)
6. You can cancel the project creation — we are just installing the SDK

#### ✅ Verify Setup
Run the following in PowerShell or terminal:
```bash
flutter doctor
```
Error related to Visual Studio, Android Studio, and Android Toolchain can be ignored if you are not using them.
