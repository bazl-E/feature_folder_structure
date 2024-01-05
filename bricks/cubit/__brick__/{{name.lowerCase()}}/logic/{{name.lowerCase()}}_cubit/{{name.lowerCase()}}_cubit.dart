import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part '{{name.lowerCase()}}_state.dart';

class {{name.pascalCase()}}Bloc extends Cubit<{{name.pascalCase()}}State> {
  {{name.pascalCase()}}Cubit() : super({{name.pascalCase()}}Initial()) ;
}
