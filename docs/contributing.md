# Halen Contribution Guide <!-- omit in toc -->

Thank you for investing your time in the Halen project!

In this guide you will get an overview of the contribution workflow from
- [opening an issue](https://gitlab.com/gsedan-users/MVP/-/issues/new)
- [creating a Merge Request](https://gitlab.com/gsedan-users/MVP/-/merge_requests/new)
- [code reviews](https://gitlab.com/gsedan-users/MVP/-/merge_requests)
- merging the Merge Request - this requires 2 approvals and authors cannot merge their own request

## Getting started

- Setup Local Machine for Development
    - [setup Linux](/bin/setupLinux.sh)
    - [setup MacOs Intel](/bin/setupMacOsIntel.sh)
    - [setup MacOs Silicon](/bin/setupMacOSSilicon.sh)
    - [setup Windows](/bin/setupWindows.ps1)
- Launch an Emulator
    ```Shell
    flutter emulators
    flutter emulators --launch <EMULATOR_ID>
    ```
- Launch the application `flutter run`

## Naming Convention

### Branching

- Use lowercase names for branches
- Use descriptive names - does the branch name convey the work it contains?
- prefix branch names with categories
    - dev/<issue_id>-<issue_title> e.g. `dev/1-signup-flow`
    - feature/<issue_id>-<issue_title> e.g. `feature/1-add-buy-button`
    - bugfix/<issue_id>-<issue_title> e.g. `bugfix/1-remove-broken-feature`
    - docs/<issue_id>-<issue_title> e.g. `docs/1-add-onboarding`

### [Style Guide](https://dart.dev/effective-dart/style)

- UpperCamelCase
    - Classes e.g.
    - enums
    - typedefs
    - type parameters
    - name extensions
    - e.g.
        ```dart
        class ClassName { ... }
        typedef TypeName<T> = bool Name(T value);

        @Annotation(anArg)
        class ClassName { ... }

        extension MyIterable<T> on Iterable<T> { ... }
        ```
- lowerCamelCase
    - class members
    - top level definitions
    - variables
    - parameters
    - e.g.
        ```dart
        var variableName1 = 1;
        const variableName2 = 2;
        final variableName3 = 3;
        HttpRequest anHttpRequest;
        void functionName(bool parameterName) {
            // ...
        }
        ```
- lowercase_with_underscores
    - packages
    - directories
    - file_names
    - imports
        ```dart
        import 'dart:math' as math;
        import 'package:js/js.dart' as javascript;
        ```
    - e.g.
        ```shell
        my_package
        └─ lib
            └─ file_system.dart
            └─ slider_menu.dart
        ```
For more details read https://dart.dev/effective-dart/style

## Development Guide

### Always be merging main

To ensure your branch has the most recent changes always merge main, this minimizes conflicts
```shell
git checkout main
git pull
git checkout <BRANCH_NAME>
git merge main
git push
```

### Always be testing

- Do the changes you are making break any existing functionality?
- [Do you have widget tests?](https://docs.flutter.dev/cookbook/testing/widget/introduction)
- [Do you have/need unit tests?](https://docs.flutter.dev/cookbook/testing#unit)
- Does the app run on iOS and Android from your branch?
- When reviewing a Merge Request does the app run on iOS and Android from that branch on your local machine/devices?

### Commit messages

- Run the following after cloning the main branch
    ```shell
    git config user.name "FIRST_NAME LAST_NAME"
    git config user.email "YOUR_GITLAB_EMAIL"
    ```

- use lowercase
- be descriptive
- imperative present tense messages - `add functionality` instead of `added functionality`