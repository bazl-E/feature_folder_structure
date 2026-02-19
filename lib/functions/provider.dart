import 'package:args/args.dart';

import '../generators/feature_generator.dart';
import '../templates/provider_templates.dart';
import '../utils/directory.dart';
import '../utils/logs.dart';

/// The generateProvider function generates the folder structure according
/// to feature by folder pattern for Provider state management.
///
/// [dryRun] is a dev-only boolean to generate example folders
void generateProvider(
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
    generator.createFile(
        '$name/index.dart', ProviderTemplates.featureIndex(name));

    // Create domain structure
    generator.createFile(
        '$name/domain/index.dart', ProviderTemplates.domainIndex(name));
    generator.createFile('$name/domain/models/${name}_model.dart',
        ProviderTemplates.modelFile(name));
    generator.createFile('$name/domain/models/index.dart',
        ProviderTemplates.simpleIndex('${name}_model'));
    generator.createFile('$name/domain/repository/${name}_repository.dart',
        ProviderTemplates.repositoryFile(name));
    generator.createFile('$name/domain/repository/index.dart',
        ProviderTemplates.simpleIndex('${name}_repository'));
    generator.createFile('$name/domain/services/${name}_service.dart',
        ProviderTemplates.serviceFile(name));
    generator.createFile('$name/domain/services/index.dart',
        ProviderTemplates.simpleIndex('${name}_service'));

    // Create providers structure
    generator.createFile('$name/providers/${name}_provider.dart',
        ProviderTemplates.providerFile(name));
    generator.createFile(
        '$name/providers/index.dart', ProviderTemplates.providerIndex(name));

    // Create screens
    generator.createFile('$name/screens/${name}_screen.dart',
        ProviderTemplates.screenFile(name));
    generator.createFile('$name/screens/index.dart',
        ProviderTemplates.simpleIndex('${name}_screen'));

    // Create widgets
    generator.createFile('$name/widgets/${name}_component.dart',
        ProviderTemplates.widgetFile(name));
    generator.createFile('$name/widgets/index.dart',
        ProviderTemplates.simpleIndex('${name}_component'));
  } on Exception catch (e) {
    LogService.error(e.toString());
  }
}
