import 'dart:io';

import 'package:args/args.dart';
import 'package:mason/mason.dart';

import '../utils/directory.dart';
import '../utils/logs.dart';

/// The _generateGetXItems function generates the folder structure according
/// GetX imports and usage. You have to import the `get` library manually in
/// your pubspec.yaml file
///
/// [dryRun] is a dev-only boolean to generate example folders
Future<void> generateGetX(
  ArgResults argResults, {
  bool dryRun = false,
}) async {
  final customPath = argResults['path'] != null ? true : false;
  var dir = argResults['path'] ?? 'feature';
  if (dryRun) {
    dir = 'example';
  }
  try {
    final brick = Brick.git(
      GitPath(
        'https://github.com/bazl-E/feature_folder_structure',
        path: 'bricks/getx',
      ),
    );
    final generator = await MasonGenerator.fromBrick(brick);
    final target = DirectoryGeneratorTarget(
      Directory(customPath
          ? DirectoryService.replaceAsExpected(path: 'lib/features/$dir')
          : DirectoryService.paths[dir]!),
    );
    await generator.generate(
      target,
      vars: <String, dynamic>{'name': argResults['name'].toString()},
    );
  } on Exception catch (e) {
    LogService.error(e.toString());
  }
}
