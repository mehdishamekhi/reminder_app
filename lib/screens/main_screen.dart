import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:reminder_app/screens/add_task_screen.dart';
import 'package:reminder_app/task.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var taskbox = Hive.box<Task>('taskbox');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tasks',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            ListView.builder(
              itemCount: taskbox.length,
              itemBuilder: (BuildContext context, int index) {
                var tasks = taskbox.values.toList()[index];
                return _taskitem(task: tasks);
              },
            ),
            Positioned(
              right: 40,
              bottom: 80,
              child: FloatingActionButton(
                backgroundColor: Colors.amber,
                splashColor: Colors.red,
                onPressed: () {
                  Navigator.of(context).push(_createRoute());
                },
                child: const Icon(
                  Icons.add,
                  size: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _taskitem extends StatelessWidget {
  _taskitem({
    required this.task,
    super.key,
  });
  Task task;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        height: 150,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 100),
                          child: RoundCheckBox(
                            checkedColor: Colors.black,
                            onTap: (ontap) {},
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: SizedBox(
                                width: 130,
                                height: 30,
                                child: Text(
                                  task.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 130,
                              height: 30,
                              child: Text(
                                task.subtitle,
                                style: const TextStyle(fontSize: 20),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 25),
                          height: 30,
                          width: 110,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                Text(
                                  '${task.time.hour} : ${task.time.minute}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.schedule,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 25),
                          height: 30,
                          width: 110,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 71, 69, 69),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              children: [
                                Text(
                                  'Edit',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                      height: 60,
                      width: 60,
                      child: Image.asset('assets/images/sport.gif')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
      transitionDuration: const Duration(seconds: 1),
      pageBuilder: (context, animation, secondaryAnimation) =>
          const AddTaskScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        final tween = Tween(begin: begin, end: end);
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      });
}
