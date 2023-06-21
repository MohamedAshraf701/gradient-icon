

# Gradient Icon

[![Pub Version](https://img.shields.io/pub/v/gradient_icon.svg)](https://pub.dev/packages/gradient_icon)
![Flutter Platform](https://img.shields.io/badge/platform-flutter-yellow)

A Flutter package that provides gradient icons, allowing you to apply gradient effects to your icons.

## Features

- Easily create icons with customizable gradients.
- Supports various gradient types, including linear, radial, and sweep gradients.
- Highly customizable with control over colors, directions, and more.

## Installation

Add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  gradient_icon: ^1.0.0
```

Then run `flutter pub get` to fetch the package.

## Usage

Import the package into your Dart file:

```dart
import 'package:gradient_icon/gradient_icon.dart';
```

Use the `GradientIcon` widget in your Flutter app:

```dart
GradientIcon(
  icon: Icons.star,
  gradient: LinearGradient(
    colors: [Colors.red, Colors.blue],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  size: 30,
),
```

For more advanced usage and customization options, refer to the package's [API documentation](https://pub.dev/documentation/gradient_icon/latest/gradient_icon/GradientIcon-class.html).

## Examples

You can find more usage examples in the [example](example) folder of this repository.

## License

This project is licensed under the [MIT License](https://zaid.digital).

## Contributing

Contributions are welcome! If you have any suggestions, bug reports, or feature requests, please open an issue or submit a pull request.

## Acknowledgements

This package was inspired by the need for gradient icons in Flutter and aims to provide an easy-to-use solution for applying gradients to icons.

## Get in touch

If you have any questions, feel free to reach out:

- Email: ashrafchauhan567@gmail.com
- Githube: [@MohamedAshraf701](https://github.com/MohamedAshraf701)


