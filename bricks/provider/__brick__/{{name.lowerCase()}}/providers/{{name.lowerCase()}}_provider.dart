import '../domain/index.dart';

class {{name.pascalCase()}}Provider {
  List<int?> data = [];

  Future<void> fetchData({required String n}) async {
    final _data = List.generate(3, ((index) => index + 1));
    data = _data;
    // TODO: Notify Listeners
  }
}