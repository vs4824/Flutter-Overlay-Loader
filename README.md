# Flutter Overlay Loader

A simple Flutter package for managing loader when fetching remote data or any long running async task. Flutter overlay loader is easy to use. You can show loader using only write two lines of code.

## Installing

   `dependencies:
   flutter_overlay_loader: ^2.0.0`

### Import

   `import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';`

## How To Use

When start network call then call this line of code..

   `Loader.show(context,progressIndicator:LinearProgressIndicator());`

After finished network call then call :

   `Loader.hide();`

You can customize this loader..

   `Loader.show(context,
   isSafeAreaOverlay: false,
   isBottomBarOverlay: false,
   overlayFromBottom: 80,
   overlayColor: Colors.black26,
   progressIndicator: CircularProgressIndicator(backgroundColor: Colors.red),
   themeData: Theme.of(context)
   .copyWith(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.green))
   );`

You can also check loader is showing or not using the property : Loader.isShown and you can prevent back pressed like this snippet:

   `WillPopScope(
   child: //TODO ,
   onWillPop:()async => !Loader.isShown
   )`

Finally dispose call hide method on dispose method :

   `@override
   void dispose() {
   Loader.hide();
   super.dispose();
   }`


