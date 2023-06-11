import 'package:flutter/material.dart';
import 'package:time_pickerr/time_pickerr.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  FocusNode tasktitlecontroller = FocusNode();
  FocusNode taskcontentcontroller = FocusNode();
  @override
  void initState() {
    super.initState();
    tasktitlecontroller.addListener(() {
      setState(() {});
    });
    taskcontentcontroller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Add Task',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              height: 600,
              child: SingleChildScrollView(
                controller: ScrollController(),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    TextField(
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      focusNode: tasktitlecontroller,
                      decoration: InputDecoration(
                        label: const Text(
                          'Task title',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextField(
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      keyboardType: TextInputType.text,
                      maxLines: 2,
                      focusNode: taskcontentcontroller,
                      decoration: InputDecoration(
                        label: const Text(
                          'Task content',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomHourPicker(
                      elevation: 2,
                      onPositivePressed: (context, time) {
                        print('onPositive');
                      },
                      onNegativePressed: (context) {
                        print('onNegative');
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(300, 50),
                        foregroundColor: Colors.red,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Add task',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
