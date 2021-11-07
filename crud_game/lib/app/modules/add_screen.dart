import 'package:crud_game/app/modules/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddGameScreen extends StatelessWidget {
  const AddGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameController gameController = Get.put(GameController());
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Column(
            children: [
              const Text(
                'Tambah Data',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: gameController.addTitleController,
                decoration: const InputDecoration(hintText: 'Title'),
              ),
              TextField(
                controller: gameController.addDescController,
                decoration: const InputDecoration(hintText: 'Desc'),
              ),
              TextField(
                controller: gameController.addIconController,
                decoration: const InputDecoration(hintText: 'Icon'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Colors.blue,
                  minimumSize: const Size(88, 36),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                ),
                onPressed: () {
                  gameController.addGame();
                },
                child: const Text('Save'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
