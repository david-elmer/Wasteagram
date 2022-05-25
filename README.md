# Wasteagram

Cross-platform mobile app for Android and iOS built with the Flutter framework

## Introduction

The fictitious client Ms. Mitchell owns a small chain of coffee shops. She envisions a mobile app inspired by Instagram called Wasteagram which will allow her to track how much unsold food is wasted every day. Every night, the person closing the shop can take out their phone and create a post consisting of a photo of the wasted food item and the number of leftover items--date and location are automatically added to each post. Ms. Mitchell can use the same app to review the posts and adjust her inventory accordingly throughout the chain.

## Details

Upon opening the app, a list of recent posts including food item, quantity left over, and the date of the post is displayed with the newest post on top.

![Main screen](readme_assets/main_screen.png)
Main Screen


The user can tap on any item in the list to view the details for that post. The post detail screen displays the date, photo, item name, quantity wasted, and the GPS coordinates where the post was created.

![Post detail screen](readme_assets/post_detail_screen.png)
Post Detail Screen


Tapping the back button on the top left of the post detail screen brings the user back to the main screen. On the bottom of that screen is a button to add a new post. Tapping on that button brings the user through a dialogue to choose between taking a photo with the camera or choosing a photo from the gallery. Once chosen, the user is brought to the new post screen.

![Select camera or gallery](readme_assets/image_source_selection.png)
Image Source Selection Dialog

![Selecting from gallery](readme_assets/gallery_selection.png)
Photo Selection
(Camera functionality is not available in the iOS Simulator, so gallery selection is shown here. However, Android Emulator provides a simulated camera.)

The new post screen displays the selected photo 



## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.