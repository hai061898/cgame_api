import 'package:crud_game/app/modules/add_screen.dart';
import 'package:crud_game/app/modules/edit_screen.dart';
import 'package:crud_game/app/modules/home_screen.dart';
import 'package:get/get.dart';
 routes() => [
        GetPage(name: '/homePage', page: () =>const HomeScreen() ),
        GetPage(name: '/addPage', page: () =>const AddGameScreen() ),
        GetPage(name: '/editPage', page: () =>const EditGameScreen() ),
 ];