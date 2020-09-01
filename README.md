# Language App


[//]: # "References"
[contact-albert]: albgarjim1@gmail.com
[flutter-launch]: https://flutter.dev/docs/get-started/test-drive?tab=vscode
[lib-autosize-text]: https://pub.dev/packages/auto_size_text
[lib-rflutter]: https://pub.dev/packages/rflutter_alert
[lib-path_provider]: https://pub.dev/packages/path_provider
[lib-csv]: https://pub.dev/packages/csv
[word-classify]: ./docs/classify.png
[word-visualize]: ./docs/learn.png
[avd-guide]: https://developer.android.com/studio/run/managing-avds

App prototype to learn vocabulary of a language
<!-- description of what the project does  -->

## Table of Contents

- [Project title](#project-title)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Results](#results)
  - [Installation](#installation)
  - [Usage](#usage)
  - [License](#license)
  - [Contact](#contact)

## Introduction

This project is a prototype for a language-learning app. It's made in flutter and consists of 2 main widgets. The first serves as word classifier and aims to build a dictionary of words the user knows and doesn't know. The second serves as a vocabulary-learning app, where it can be seen the word, translation and sentence where it is used.

## Results

Window to classify words between known and not known:
![classify][word-classify]

Window to learn new words
![visualize][word-visualize]

## Installation


Clone this repository with the command:

```sh
git clone https://github.com/albgarjim/language-app.git
```

Navigate into the src file insidie the `language-app` folder:

```sh
cd ./src/language-app
```


This project requires the following flutter libraries; in each link can be found information about how to install them:

- [auto_size_text][lib-autosize-text]
- [rflutter][lib-rflutter]
- [path_provider][lib-path_provider]
- [csv][lib-csv]

<!-- name technologies used and how to build project -->


## Usage

To launch the project follow the [official documentation][flutter-launch] depending of your preferred IDE

If you want to compile the device on android you will need an AVD or android virutal device, you can create one following the official [guide][avd-guide]

## License

Released under MIT license


## Contact

Maintainer: [Alberto Garcia][contact-alberto]
