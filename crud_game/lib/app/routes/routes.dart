
 import 'package:get/get.dart';
 routes() => [
        GetPage(name: '/homePage', page: () => HomePage() ),
        GetPage(name: '/addPage', page: () => AddGamePage() ),
        GetPage(name: '/editPage', page: () => EditGamePage() ),
 ];