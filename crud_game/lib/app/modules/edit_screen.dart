import 'package:crud_game/app/modules/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditGameScreen extends StatelessWidget {
  const EditGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameController gameController = Get.put(GameController());
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Column(
            children: [
              const Text(
                'Edit Data',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: gameController.titleController,
                decoration: const InputDecoration(hintText: 'Title'),
              ),
              TextField(
                controller: gameController.descController,
                decoration: const InputDecoration(hintText: 'Desc'),
              ),
              TextField(
                controller: gameController.iconController,
                decoration: const InputDecoration(hintText: 'Icon'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Colors.green,
                  minimumSize: const Size(88, 36),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                ),
                onPressed: () {
                  gameController.editGame(gameController.id.value);
                },
                child: const Text('Edit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
