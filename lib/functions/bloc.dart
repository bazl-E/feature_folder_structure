import 'package:args/args.dart';

import '../generators/feature_generator.dart';
import '../templates/bloc_templates.dart';
import '../utils/directory.dart';
import '../utils/logs.dart';

/// The generateBloc function generates the folder structure according
/// to feature by folder pattern for Bloc state management.
///
/// [dryRun] is a dev-only boolean to generate example folders
void generateBloc(
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
    generator.createFile('$name/index.dart', BlocTemplates.featureIndex(name));

    // Create domain structure
    generator.createFile(
        '$name/domain/index.dart', BlocTemplates.domainIndex(name));
    generator.createFile('$name/domain/models/${name}_model.dart',
        BlocTemplates.modelFile(name));
    generator.createFile('$name/domain/models/index.dart',
        BlocTemplates.simpleIndex('${name}_model'));
    generator.createFile('$name/domain/repository/${name}_repository.dart',
        BlocTemplates.repositoryFile(name));
    generator.createFile('$name/domain/repository/index.dart',
        BlocTemplates.simpleIndex('${name}_repository'));
    generator.createFile('$name/domain/services/${name}_service.dart',
        BlocTemplates.serviceFile(name));
    generator.createFile('$name/domain/services/index.dart',
        BlocTemplates.simpleIndex('${name}_service'));

    // Create logic/bloc structure
    generator.createFile(
        '$name/logic/index.dart', "export '${name}_bloc/${name}_bloc.dart';\n");
    generator.createFile('$name/logic/${name}_bloc/${name}_bloc.dart',
        BlocTemplates.blocFile(name));
    generator.createFile('$name/logic/${name}_bloc/${name}_event.dart',
        BlocTemplates.eventFile(name));
    generator.createFile('$name/logic/${name}_bloc/${name}_state.dart',
        BlocTemplates.stateFile(name));

    // Create screens
    generator.createFile(
        '$name/screens/${name}_screen.dart', BlocTemplates.screenFile(name));
    generator.createFile('$name/screens/index.dart',
        BlocTemplates.simpleIndex('${name}_screen'));

    // Create widgets
    generator.createFile(
        '$name/widgets/${name}_component.dart', BlocTemplates.widgetFile(name));
    generator.createFile('$name/widgets/index.dart',
        BlocTemplates.simpleIndex('${name}_component'));
  } on Exception catch (e) {
    LogService.error(e.toString());
  }
}
