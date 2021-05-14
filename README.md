# protxx-gui

## Simulation of the PROTXX Phybrata Sensor Product

## Description
### Objective: 
Construct a mobile app that allows potential customers to get a better understanding of PROTXX product before purchase.

### Application Features: 
Track the movements of the user through mobile phone accelerometer.

Output mock models of the phybrata acceleration time series graph and acceleration spatial scatter plot data.

Access data from past trials.

User interface that outputs sample graph of a neuro condition.

## Getting Started
### Dependencies
Android Studio with Flutter plug-in and Android Emulator
1. Download Flutter using the instructions here.
    Select the option for your Operating System (ex: MacOS, Windows, etc.) 
    Note: For MacOS, make sure to follow the instructions in the Android section, not the iOS sections.
    Follow the instructions listed in the “Get the Flutter SDK” section.
2. Download the Android Studio application using the instructions listed here.
3. Download the Android Emulator as explained in this video tutorial.
    Open Android Studio
    Under the “Configure” menu, click AVD Manager.
    Select the Pixel 2 phone on the lists, then click continue.
    Click the Download button next to “R”
    Click finish.


### Installing
1. In the “Welcome to Android Studio” menu, click “Create New Flutter Project” then choose the “Flutter Application” option.
2. Copy & paste the following on the terminal page at the bottom of your screen:
    cd lib

    rm main.dart

    curl -LO https://raw.githubusercontent.com/gcbrusco/protxx-gui/main/protxx_sim/lib/compare.dart

    curl -LO https://raw.githubusercontent.com/gcbrusco/protxx-gui/main/protxx_sim/lib/compare_menu.dart

    curl -LO https://raw.githubusercontent.com/gcbrusco/protxx-gui/main/protxx_sim/lib/data.dart

    curl -LO https://raw.githubusercontent.com/gcbrusco/protxx-gui/main/protxx_sim/lib/data_page.dart

    curl -LO https://raw.githubusercontent.com/gcbrusco/protxx-gui/main/protxx_sim/lib/graph.dart

    curl -LO https://raw.githubusercontent.com/gcbrusco/protxx-gui/main/protxx_sim/lib/home.dart

    curl -LO https://raw.githubusercontent.com/gcbrusco/protxx-gui/main/protxx_sim/lib/main.dart

    curl -LO https://raw.githubusercontent.com/gcbrusco/protxx-gui/main/protxx_sim/lib/new_test.dart

    curl -LO https://raw.githubusercontent.com/gcbrusco/protxx-gui/main/protxx_sim/lib/power.dart

    curl -LO https://raw.githubusercontent.com/gcbrusco/protxx-gui/main/protxx_sim/lib/test.dart

    curl -LO https://raw.githubusercontent.com/gcbrusco/protxx-gui/main/protxx_sim/lib/time.dart

3. In the pubspec.yaml file, copy and paste the following under the “dependencies” section:
    dependencies:
      flutter:
        sdk: flutter
      sensors: ^2.0.0
      time: ^2.0.0
      syncfusion_flutter_charts: ^19.1.59
      get:
      vibration: ^1.7.3
      flutter_ringtone_player: ^3.0.0
4. Hover over each package (sensors, syncfusion_flutter_charts, time, vibration, flutter_ringtone_player) until the light bulb pops up and select the “Pub get” option. By doing this, you will be able to download all of the packages needed for the code onto your local machine. 


### Executing program
1. In the top right corner, click the AVD Manager.
2. Click on the emulator that you configured beforehand. 
    Note: it may take a while to load the first time. 

## Authors

Zach Anderson
Gina Brusco
Lily Pierson
Jacob Schwartz
