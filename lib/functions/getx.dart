import 'package:args/args.dart';

import '../generators/feature_generator.dart';
import '../templates/getx_templates.dart';
import '../utils/directory.dart';
import '../utils/logs.dart';

/// The generateGetX function generates the folder structure according
/// to GetX imports and usage. You have to import the `get` library manually in
/// your pubspec.yaml file
///
/// [dryRun] is a dev-only boolean to generate example folders
void generateGetX(
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
    generator.createFile('$name/index.dart', GetXTemplates.featureIndex(name));

    // Create domain structure
    generator.createFile(
        '$name/domain/index.dart', GetXTemplates.domainIndex(name));
    generator.createFile('$name/domain/models/${name}_model.dart',
        GetXTemplates.modelFile(name));
    generator.createFile('$name/domain/models/index.dart',
        GetXTemplates.simpleIndex('${name}_model'));
    generator.createFile('$name/domain/repository/${name}_repository.dart',
        GetXTemplates.repositoryFile(name));
    generator.createFile('$name/domain/repository/index.dart',
        GetXTemplates.simpleIndex('${name}_repository'));
    generator.createFile('$name/domain/services/${name}_service.dart',
        GetXTemplates.serviceFile(name));
    generator.createFile('$name/domain/services/index.dart',
        GetXTemplates.simpleIndex('${name}_service'));

    // Create providers structure
    generator.createFile('$name/providers/${name}_controller.dart',
        GetXTemplates.controllerFile(name));
    generator.createFile('$name/providers/${name}_binding.dart',
        GetXTemplates.bindingFile(name));
    generator.createFile(
        '$name/providers/index.dart', GetXTemplates.providerIndex(name));

    // Create screens
    generator.createFile(
        '$name/screens/${name}_screen.dart', GetXTemplates.screenFile(name));
    generator.createFile('$name/screens/index.dart',
        GetXTemplates.simpleIndex('${name}_screen'));

    // Create widgets
    generator.createFile(
        '$name/widgets/${name}_component.dart', GetXTemplates.widgetFile(name));
    generator.createFile('$name/widgets/index.dart',
        GetXTemplates.simpleIndex('${name}_component'));
  } on Exception catch (e) {
    LogService.error(e.toString());
  }
}
