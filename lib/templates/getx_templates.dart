/// Templates for GetX feature structure
class GetXTemplates {
  static String controllerFile(String name) {
    final pascalName = _toPascalCase(name);
    return '''import 'package:get/get.dart';

class ${pascalName}Controller extends GetxController {
  // TODO: implement controller
}
''';
  }

  static String bindingFile(String name) {
    final pascalName = _toPascalCase(name);
    return '''import 'package:get/get.dart';
import '${name}_controller.dart';

class ${pascalName}Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<${pascalName}Controller>(() => ${pascalName}Controller());
  }
}
''';
  }

  static String screenFile(String name) {
    final pascalName = _toPascalCase(name);
    return '''import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../providers/${name}_controller.dart';

class ${pascalName}Screen extends GetView<${pascalName}Controller> {
  const ${pascalName}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('$pascalName'),
      ),
      body: const Center(
        child: Text('$pascalName Screen'),
      ),
    );
  }
}
''';
  }

  static String widgetFile(String name) {
    final pascalName = _toPascalCase(name);
    return '''import 'package:flutter/material.dart';

class ${pascalName}Component extends StatelessWidget {
  const ${pascalName}Component({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
''';
  }

  static String modelFile(String name) {
    final pascalName = _toPascalCase(name);
    return '''class ${pascalName}Model {
  ${pascalName}Model();

  factory ${pascalName}Model.fromJson(Map<String, dynamic> json) {
    return ${pascalName}Model();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
''';
  }

  static String repositoryFile(String name) {
    final pascalName = _toPascalCase(name);
    return '''abstract class ${pascalName}Repository {
  // TODO: define repository methods
}
''';
  }

  static String serviceFile(String name) {
    final pascalName = _toPascalCase(name);
    return '''import '../repository/${name}_repository.dart';

class ${pascalName}Service implements ${pascalName}Repository {
  ${pascalName}Service();

  // TODO: implement repository methods
}
''';
  }

  static String providerIndex(String name) => '''export '${name}_controller.dart';
export '${name}_binding.dart';
''';

  static String domainIndex(String name) => '''export 'models/index.dart';
export 'repository/index.dart';
export 'services/index.dart';
''';

  static String simpleIndex(String name) => "export '$name.dart';\n";

  static String featureIndex(String name) => '''export 'domain/index.dart';
export 'providers/index.dart';
export 'screens/index.dart';
export 'widgets/index.dart';
''';

  static String _toPascalCase(String text) {
    return text.split('_').map((word) {
      if (word.isEmpty) return '';
      return '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}';
    }).join();
  }
}
