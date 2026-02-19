# Changelog

## 2.0.0
**Breaking Change: Removed Mason dependency entirely!**

- Replaced Mason brick templating with pure Dart file generation
- No more external dependency updates needed - templates are now built-in
- Significantly faster execution (no network calls to fetch bricks)
- Zero maintenance burden - no breaking changes from Mason updates
- All features preserved: bloc, cubit, getx, provider support
- Custom path support still works with `-p` flag

## 1.0.2
- Updated dependencies and SDK version.

## 1.0.2
- Updated dependencies and SDK version.
- Added more documentation to improve usability and clarity.

## 1.0.1
- Enhanced project structure to use GitPath for bricks.
- Switched to Mason bricks for a more modular and customizable folder structure.
- Added option to specify a custom path within the `lib` folder for generated features.

## 1.0.0
- Added support for GetX as a state management solution.
- Improved internal structure by incorporating Mason bricks.

## 0.0.4
- Introduced the ability to generate screens and widgets.
- Enabled generation of data models.
- Added functionality to create data repositories, services, and providers.
