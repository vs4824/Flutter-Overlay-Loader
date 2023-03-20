import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({key,  this.title = "Loader"}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  @override
  void dispose() {
    Loader.hide();
    if (kDebugMode) {
      print("Called dispose");
    }
    super.dispose();
  }

  void _onItemTapped(int index) {}

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    if (kDebugMode) {
      print("bottomPadding $bottomPadding");
    }
    return WillPopScope(child:  Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            ElevatedButton(
                child: const Text("Show Loader 1"),
                onPressed: () {
                  if (kDebugMode) {
                    print("Loader is being shown before ${Loader.isShown}");
                  }

                  ///Show default loader here
                  Loader.show(context,
                      progressIndicator: const LinearProgressIndicator());

                  if (kDebugMode) {
                    print("Loader is being shown after ${Loader.isShown}");
                  }

                  ///loader hide after 10 seconds
                  Future.delayed(const Duration(seconds: 10), () {
                    Loader.hide();
                    if (kDebugMode) {
                      print("Loader is being shown after hide ${Loader.isShown}");
                    }
                  });

                }),
            ElevatedButton(
                child: const Text("Show Loader 2"),
                onPressed: () {
                  if (kDebugMode) {
                    print("Loader is being shown before ${Loader.isShown}");
                  }

                  ///Show loader 2 here
                  Loader.show(context,
                      isSafeAreaOverlay: false,
                      isBottomBarOverlay: false,
                      overlayFromBottom: 80,
                      overlayColor: Colors.black26,
                      progressIndicator: const CircularProgressIndicator(
                        backgroundColor: Colors.red,
                      ),
                      themeData: Theme.of(context)
                          .copyWith(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.green))
                  );

                  if (kDebugMode) {
                    print("Loader is being shown after ${Loader.isShown}");
                  }

                  ///loader hide after 3 seconds
                  Future.delayed(const Duration(seconds: 3), () {
                    Loader.hide();

                    if (kDebugMode) {
                      print("Loader is being shown after hide ${Loader.isShown}");
                    }
                  });

                }),
            ElevatedButton(
                child: const Text("Show Loader 3"),
                onPressed: () {
                  ///Show loader 3 here
                  Loader.show(context,
                      isAppbarOverlay: false,
                      overlayFromTop: 100,
                      progressIndicator: const CircularProgressIndicator(),
                      themeData: Theme.of(context)
                          .copyWith(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black38)),
                      overlayColor: const Color(0x99E8EAF6));

                  ///loader hide after 3 seconds
                  Future.delayed(const Duration(seconds: 3), () {
                    Loader.hide();
                  });

                }),
            ElevatedButton(
                child: const Text("Show Loader 4"),
                onPressed: () {
                  ///Show loader 4 here
                  Loader.show(context,
                      isSafeAreaOverlay: false,
                      progressIndicator: const CircularProgressIndicator(),
                      isBottomBarOverlay: false,
                      overlayFromBottom: 80,
                      themeData: Theme.of(context)
                          .copyWith(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black38)),
                      overlayColor: const Color(0x99E8EAF6)
                  );

                  ///loader hide after 3 seconds
                  Future.delayed(const Duration(seconds: 3), () {
                    Loader.hide();
                  });

                }),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    ), onWillPop:() async => !Loader.isShown);
  }
}