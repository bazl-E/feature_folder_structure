import 'package:flutter/material.dart';

class GetxExampleComponent extends StatelessWidget {
  const GetxExampleComponent({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Replace Provider
    return GetBuilder<MyController>(
      builder: (provider) {
        return Container();
      },
    );
  }
}
