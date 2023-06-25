import 'package:flutter/material.dart';
import 'package:software_kernel/widgets/persistent_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Persistent Navigation Bar',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: const IntrinsicHeight(
                  child: PersistentNavigationBar(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
