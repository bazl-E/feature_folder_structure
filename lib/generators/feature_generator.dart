import 'dart:io';

import '../utils/directory.dart';
import '../utils/logs.dart';

/// [FeatureGenerator] creates feature folder structure
/// without external dependencies
class FeatureGenerator {
  final String name;
  final String basePath;

  FeatureGenerator({
    required this.name,
    required this.basePath,
  });

  /// Create a file with content
  void createFile(String relativePath, String content) {
    try {
      final fullPath = DirectoryService.replaceAsExpected(
        path: '$basePath/$relativePath',
      );
      final file = File(fullPath);
      file.createSync(recursive: true);
      file.writeAsStringSync(content);
      LogService.success('Created $relativePath');
    } on FileSystemException catch (err) {
      LogService.error('${err.message} -> $relativePath');
    }
  }

  /// Create an empty index.dart file
  void createIndexFile(String relativePath, String content) {
    createFile('$relativePath/index.dart', content);
  }

  /// Create directory structure
  void createDirectory(String relativePath) {
    try {
      final fullPath = DirectoryService.replaceAsExpected(
        path: '$basePath/$relativePath',
      );
      Directory(fullPath).createSync(recursive: true);
    } on FileSystemException catch (err) {
      LogService.error('${err.message} -> $relativePath');
    }
  }
}
