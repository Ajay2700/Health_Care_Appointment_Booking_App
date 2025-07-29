import 'package:cloudinary_api/uploader/cloudinary_uploader.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_1/features/personalization/controllers/user_controller.dart';
import 'package:project_1/utils/http/network_manager.dart';

import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'data/repositories/authentication/autentication_repository.dart';
import 'firebase_options.dart';
// -------Entry points of Flutter App

// var cloudinary=Cloudinary.fromStringUrl('CLOUDINARY_URL=cloudinary://<276542114554522>:<WmWG11jigsAlBig9Cv-CxJXiXAs>@dcpygpsre');

Future<void> main() async {


// Create a Cloudinary instance and set your cloud name.


  // Todo Add Widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Todo Init Local Storage
  await GetStorage.init();
  Get.lazyPut(() => NetworkManager());
  Get.lazyPut(()=>UserController());

  // Todo Await Native Splash

  /// Await Splash until other items Load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Todo Initialize Firebase

  /// Initialize Firebase & Authentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
      (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  // cloudinary.config.urlConfig.secure = true;
  // upload();

  // Todo Initialize Authentication

  runApp(const App());
}
