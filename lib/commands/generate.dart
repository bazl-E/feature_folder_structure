import 'package:args/command_runner.dart';

import '../functions/bloc.dart';
import '../functions/cubit.dart';
import '../functions/index.dart';
import '../utils/logs.dart';

/// [GenerateCommand] is used to generate new files for a feature
class GenerateCommand extends Command {
  final String _name = 'generate';
  final String _description =
      'Generate folders and files according to folder by feature structure.';

  /// Constructor for the generate files command
  ///
  /// [name] is a required argument that represents the name of the feature
  /// to be created
  ///
  /// [type] is a required argument that represents the type of the feature
  /// to be created
  ///
  /// [path] is an optional argument that represents the path of the feature
  /// to be created inside the lib folder
  GenerateCommand() {
    argParser.addOption(
      'name',
      abbr: 'n',
      mandatory: true,
      help: 'Name of the feature to be created',
    );
    argParser.addOption(
      'type',
      abbr: 't',
      mandatory: true,
      help: 'Type of feature:\n[simple] Simple\n[getx] GetX',
    );
    argParser.addOption(
      'path',
      abbr: 'p',
      mandatory: false,
      help: 'Path inside lib folder',
    );
    argParser.addOption(
      'stateManagement',
      abbr: 's',
      mandatory: false,
      help: 'choose state management:\n[bloc] Bloc\n[cubit] Cubit\n[none] None',
    );
  }

  @override
  String get description => _description;

  @override
  String get name => _name;

  @override
  void run() {
    final time = Stopwatch();
    time.start();
    switch (argResults!['type'].toString()) {
      case 'provider':
        generateProvider(argResults!);
        break;
      case 'getx':
        generateGetX(argResults!);
        break;
      case 'cubit':
        generateCubit(argResults!);
        break;
      case 'bloc':
        generateBloc(argResults!);
        break;
      default:
        LogService.error('Invalid Arguments');
        break;
    }
    time.stop();
    LogService.info('Time Taken: ${time.elapsed.inMilliseconds} milliseconds');
    LogService.success('Feature ${argResults!['name']} created successfully');
  }
}
