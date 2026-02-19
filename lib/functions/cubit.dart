import 'package:args/args.dart';

import '../generators/feature_generator.dart';
import '../templates/cubit_templates.dart';
import '../utils/directory.dart';
import '../utils/logs.dart';

/// The generateCubit function generates the folder structure according
/// to feature by folder pattern for Cubit state management.
///
/// [dryRun] is a dev-only boolean to generate example folders
void generateCubit(
  ArgResults argResults, {
  bool dryRun = false,
}) {
  final customPath = argResults['path'] != null;
  var dir = argResults['path'] ?? 'feature';
  if (dryRun) {
    dir = 'example';
  }

  try {
    final name = argResults['name'].toString().toLowerCase();
    final basePath = customPath
        ? DirectoryService.replaceAsExpected(path: 'lib/$dir')
        : DirectoryService.paths[dir]!;

    final generator = FeatureGenerator(name: name, basePath: basePath);

    // Create feature index
    generator.createFile('$name/index.dart', CubitTemplates.featureIndex(name));

    // Create domain structure
    generator.createFile(
        '$name/domain/index.dart', CubitTemplates.domainIndex(name));
    generator.createFile('$name/domain/models/${name}_model.dart',
        CubitTemplates.modelFile(name));
    generator.createFile('$name/domain/models/index.dart',
        CubitTemplates.simpleIndex('${name}_model'));
    generator.createFile('$name/domain/repository/${name}_repository.dart',
        CubitTemplates.repositoryFile(name));
    generator.createFile('$name/domain/repository/index.dart',
        CubitTemplates.simpleIndex('${name}_repository'));
    generator.createFile('$name/domain/services/${name}_service.dart',
        CubitTemplates.serviceFile(name));
    generator.createFile('$name/domain/services/index.dart',
        CubitTemplates.simpleIndex('${name}_service'));

    // Create logic/cubit structure
    generator.createFile('$name/logic/index.dart',
        "export '${name}_cubit/${name}_cubit.dart';\n");
    generator.createFile('$name/logic/${name}_cubit/${name}_cubit.dart',
        CubitTemplates.cubitFile(name));
    generator.createFile('$name/logic/${name}_cubit/${name}_state.dart',
        CubitTemplates.stateFile(name));

    // Create screens
    generator.createFile(
        '$name/screens/${name}_screen.dart', CubitTemplates.screenFile(name));
    generator.createFile('$name/screens/index.dart',
        CubitTemplates.simpleIndex('${name}_screen'));

    // Create widgets
    generator.createFile('$name/widgets/${name}_component.dart',
        CubitTemplates.widgetFile(name));
    generator.createFile('$name/widgets/index.dart',
        CubitTemplates.simpleIndex('${name}_component'));
  } on Exception catch (e) {
    LogService.error(e.toString());
  }
}
