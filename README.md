# Salava Mobile App

## Getting Started

This project is a being developed with Google's Flutter UI toolkit.
It is designed to be used closely with Open Badge Passport. https://github.com/discendum/salava

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

Currently, all of the testing has been done with an android emulator.
No iOS testing has been made.

There are multiple options on how to get this application working on a phone or an emulator. The above link to
the Lab provides more information on this.
The writer of this documentation uses the combination of Android Studio and Android Emulator.
After the project has opened in your editor make sure to download dependencies.
When creating a new virtual device with Android Emulator, it is recommended that System Image "Pie"
is used (API level 28). System Image Q (API level 29) might not work. Lower API levels have not been tested.

## Current State of the Application

The application is currently in it's very early stages. The backend of the Salava project is in development to
properly work with the mobile app, which limits the development of the mobile application a lot.
To test and develop the mobile app in a meaningful way Salava must first be installed on your computer
and it's API routes modified to allow API calls.

On the mobile app side, all API call routes also need to be modified to suit your version of the Salava
server and database. To start the app, the _helperBool variable in main.dart can be used in the conditional statement to bypass
the login view.

## Current Structure of the Application

The goal of the application is to enable convenient and easy mobile access for a user of the
Open Badge Passport service and to be used with limited access to the internet.

Currently, after the application has started the user is presented with a login view which leads to
a menu if the login was succesful. In the menu, the user has the option of fetching badges from the Salava server
or view downloaded badges. It also has a settings button, which currently has no functionality.

If the badges are fetched from the salava server, the user can press the badge image on the left to view additional
information about the badge (badge info view). The icon button on the left is used to set the badge's visibility to others in the
web app(API calls in development). In the badge info view the user can also download and store the badge for offline use.

## to-dos

- Badge sharing (Badge image can be shared (downloaded and online badges))
- Enabling SVG images
- and A LOT more...






