# DoE

Doe is a mobile app developed in [Flutter](https://flutter.dev/).

DoE is a middlware that help people share and give their things to someone who really need the help.
DoE make it stupid easy by connecting people around the world to share and donate.
It's totally free and available on [Google Store](https://play.google.com/) and [Apple Store](https://apps.apple.com/). 
Just download it and be happy by donating or being blessed.





## Learn more about flutter and we will appreciate your PRs

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Setup your Environment

- We use Visual Studio Code as the IDE for develpment. If you prefer another one as (Android Studio, Xcode, IntelliJ, etc), please check-out [Set up an editor](https://flutter.dev/docs/get-started/editor)
- Otherwise:

1- Downalod visual studio code clicking [here](https://code.visualstudio.com/)

2- Set your classpath, so you can use **code .** everywhere to open it (Optional)

3- Once opened, go to View -> Command Palette -> Install Extensions

4- In the search field, type: Flutter

5- Select the first one. Currently the version is Flutter 3.8.1

6- Click on Install button and then accept all the dependencies shown including Dart

7- Restart visual studio code if you prefer (Optinal)


## Downalod doe-mobile flutter project on github
1- Access [DoE-Mobile](https://github.com/simeaol/doe-mobile) github page

2- Download the project. You can just downalod zip project file or use git clone command to clone it into your local machine. We strongly recomend you to follow the second option.

3- Git command to clone boe-mobile project: git clone https://github.com/simeaol/doe-mobile.git or using SSH: git clone git@github.com:simeaol/doe-mobile.git

4- Once downloaded, open/import doe-mobile project to you IDE.Using Visual Studio Code you can:

4.1- Go to directory when doe-mobile was downloaded in using terminal open the project using **code .** (if you have configured your path) or

4.2-Open your IDE and go to: File -> Open Folder -> Go to doe-mobile project directory -> Ok (to open it)



## Optional steps before run your project
1- Using terminal, type **flutter doctor** or **flutter doctor -v** and check the summary

2- If you intent to run it in your physical device the following items should be marked as checked: Flutter (Channel stable, VX.XX.XX ...)

3- Otherwise (If you intent to run flutter project in simulator), Android Toolchain must be configured. Visit [Android SDK manager](https://flutter.dev/setup/#android-setup) for detailed instructions.


## Run Project
1- On Your IDE, select the device target (physical or simulated) then click on **Run**

## Build and Install bundle in your real device
In the project directory, type:

1- **flutter clean** to clean and remove old artifact, then

2- **flutter build {target}**. for android change {target} to **apk** . In IOS change {target} to **ios**

3- Plug your device and typee: **flutter install** to install artifact in your device


## Install flutter -  For more information
Follow Flutter install Doc [Install](https://flutter.dev/docs/get-started/install) to install and configure flutter sdk in your favorite OS (Operating System).
