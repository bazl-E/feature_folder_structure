part '{{name.pascalCase()}}_bloc.dart';

sealed class {{name.pascalCase()}}State extends Equatable {
  const {{name.pascalCase()}}State();
  
  @override
  List<Object> get props => [];
}

final class {{name.pascalCase()}}Initial extends {{name.pascalCase()}}State {}
