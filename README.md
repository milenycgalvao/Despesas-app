# Despesas
An app for viewing and organizing expenses

<div align="center">
<img src="https://user-images.githubusercontent.com/58363666/154751947-0823da66-94b6-4992-b22e-bf8d188e3b41.jpg " width="200px">
<img src="https://user-images.githubusercontent.com/58363666/154754299-012afa4a-f6fb-40bf-9a18-ff1820747c9e.jpg" width="200px">
<img src="https://user-images.githubusercontent.com/58363666/154754516-15e016fd-6554-4af4-9169-6e69ab54d115.jpg" width="200px">
</div>

## Overview

This project was developed along sections 4, 5 and 6 of the flutter course "Aprenda Flutter e Desenvolva Apps Para Android e IOS 2021" on the Udemy platform. The main objectives of this app were to understand more about the structure of flutter projects, learn about the functioning of flutter internally, and ways to make the app responsive.



## Project estructure

 `lib/main.dart` : This file is the starting point of the application. In it is all the structuring and calls of the application components. In it is also some functions that assist the state of application.
 
### `assets/`

  This folder contains the image file "zzz" and the source files used. These files have been made available for use by adding them to the pubspec.yaml file.


### `lib/components/`
  
  Folder that contains the application components that are called as you use the application.
  
   `chart.dart` : File where is the main structure of the chart, it divides it into 7 rows referring to the last 7 days.
    
   `chart_bar.dart` : File where is the structure of the bars of the graphic. They show the intensity of last week’s expenses.
    
   `transaction_form.dart` : File where is the structure and design of the bars of the graphic. They show the intensity of last week’s expenses.
    
   `transaction_item.dart` : File containing the expense card structure that will be viewed inside the list.
    
   `transaction_list.dart` : File that creat the expense list structure.


### `lib/src/`
  
  This folder contains the transaction.dart file, it is a class that defines a transaction containing an id, a title, a value and a date.
  
  
  
 Obs.: Other folders and files are not explained above because they were not changed by the developer but by Flutter itself.
 
 
 ## Getting Started

For run a Flutter project you will need to have installed:
* Android Studio
* Dart SDK
* Flutter SDK
* VSCode (optional)

In this link, there is a guide for installing the respective software: https://docs.flutter.dev/get-started/install

To iniciation a new Flutter project on VSCode you can follow the steps below:
1. On a new window: `Control + Shift + P` (commands on Windows system)
2. Look and click on `Flutter: New Project`
3. Write the name you want for project

### Running

To run a Flutter project in VSCode you can press `F5` or write the command `Flutter run` on the terminal. Before run a Flutter project you can choice with which device you will want to run. If you will get run in a Android Studio emulator you will need to be with the emulator running before run the Flutter project and choose it at the bottom right in Vscode or you can run the emulator and write the command `Flutter run -d name-of-your-device` on terminal. 

