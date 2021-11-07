import 'package:crud_game/app/modules/add_screen.dart';
import 'package:crud_game/app/modules/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameController gameController = Get.put(GameController());

    Future<void> showMyDialog(BuildContext context, int id) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Delete Data'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const [
                  Text('Would you like to remove data ?'),
                ],
              ),
            ),
            actions: [
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  overlayColor:
                      MaterialStateProperty.all<Color>(Colors.red.shade100),
                ),
                child: const Text('Remove'),
                onPressed: () {
                  gameController.deleteGame(id);
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    Future<void> pullRefresh() async {
      gameController.readGame();
    }

    // Future<void> onDeleteData(BuildContext context, int id) async {
    //   gameController.deleteGame(id);
    //   Navigator.of(context).pop();
    // }

    Future<void> _onEdit(int id) async {
      gameController.id.value = id;
      gameController.toEditPage();
    }

    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => RefreshIndicator(
            onRefresh: pullRefresh,
            child: Stack(
              children: [
                Column(
                  children: [
                    const Text(
                      'Data Game',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      child: Expanded(
                        child: ListView(
                          children: gameController.dataGame.map((e) {
                            var index = gameController.dataGame.indexOf(e);
                            index++;
                            return Container(
                              height: 50,
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(child: Text(index.toString())),
                                      const SizedBox(width: 10),
                                      SizedBox(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [Text(e.title.toString())],
                                        ),
                                      ),
                                      const Spacer(),
                                      GestureDetector(
                                          onTap: () =>
                                              _onEdit(gameController.id.value),
                                          child: const Icon(Icons.edit,
                                              color: Colors.green)),
                                      const SizedBox(width: 5),
                                      GestureDetector(
                                          onTap: () => showMyDialog(
                                              context, gameController.id.value),
                                          child: const Icon(Icons.delete,
                                              color: Colors.red)),
                                    ],
                                  ),
                                  const Divider(
                                    thickness: 1,
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: FloatingActionButton(
                      backgroundColor: Colors.blue,
                      child: const Icon(Icons.add),
                      onPressed: () {
                        Get.to(() => const AddGameScreen());
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
