# Salava Mobile App

## Getting Started

This project is a being developed with Google's Flutter UI toolkit.
It is designed to be used closely with [Open Badge Passport]. https://github.com/discendum/salava

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
The writer of this documentation uses the combination of Android Studio and Android Emulator.(atleast atm...)

## Current State of the Application

Currently, the backend of the Salava project is in development to properly work with the mobile app,
which limits the development of the mobile application a lot. The writer of this documentation uses
his own (crappy) version of the salava server to enable some initial features of the app.

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

- Badge sharing
- Enabling SVG images
- and A LOT more...






