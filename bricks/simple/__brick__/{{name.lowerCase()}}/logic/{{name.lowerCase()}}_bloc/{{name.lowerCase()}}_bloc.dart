import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part '{{name.lowerCase()}}_event.dart';
part '{{name.lowerCase()}}_state.dart';

class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  {{name.pascalCase()}}Bloc() : super({{name.pascalCase()}}Initial()) {
    on<{{name.pascalCase()}}Event>((event, emit) {
      // TODO: implement event handler
    });
  }
}
