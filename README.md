
# Folder by Feature CLI Utility :open_file_folder:

A Dart CLI tool that generates a folder structure based on the folder-by-feature pattern. This tool simplifies setting up the required directory structure for models, services, repositories, screens, and widgets, reducing the repetitive setup work.

This tool builds on the original [`feature_folder_cli`](https://pub.dev/packages/feature_folder_cli/install), which hasn't been maintained for over 1.5 years. This version introduces enhancements and improvements, making it a more robust and up-to-date solution.

## Folder Structure :file_folder:

The CLI generates the following folder structure for each feature:

```plaintext
feature/
┣ domain/
┃ ┣ models/
┃ ┣ repository/
┃ ┣ services/
┃ ┗ index.dart
┣ screens/
┃ ┣ feature_screen.dart
┃ ┗ index.dart
┣ widgets/
┃ ┣ feature_component.dart
┃ ┗ index.dart
┣ providers/
┃ ┣ feature_provider.dart
┃ ┗ index.dart
┗ index.dart
```

## Command Usage :wrench:

> Make sure you are in the root of your project

```sh
ff generate -n <feature_name> -t <type> -p <path>
```

- `-n <feature_name>`: Specifies the name of the feature.
- `-t <type>`: Specifies the state management type. Supported values are `provider`, `getx`, `cubit`, and `bloc`.
- `-p <path>`: Specifies the path where the feature folder should be created.

### Supported Types
- `provider`
- `getx`
- `cubit`
- `bloc`

## Example Usage :wrench:

```sh
ff generate -n Example -t provider -p features
ff generate -n Example -t getx -p features
ff generate -n Example -t cubit -p features
ff generate -n Example -t bloc -p features
```

Each command will generate the folder structure and initial files for the specified feature.

## Installation :gear:

To install this utility, run the following command:

```sh
dart pub global activate feature_folder_cli_plus
```

Then, ensure that Dart's bin directory is added to your system's PATH to use the `ff` command globally.

## License :scroll:

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
