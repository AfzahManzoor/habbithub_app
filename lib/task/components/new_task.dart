import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../screens/Home/home_page.dart';
import '../../widgets/button.dart';
import 'my_cu_container.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  Color selectedColor = Colors.blue;
  String repeatCycle = 'Weekly';
  List<bool> selectedDays = [true, true, true, true, true, false, false];
  List<String> tags = [
    'Daily Routine',
    'Study Routine',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBDE0FE),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: SizedBox(
                    height: 50, child: Image.asset('assets/images/star.png')),
              ),
              const Center(
                child: Text('New Task', style: mtileStyle),
              ),
              const MyNewContainer(),
              const Text('Card Color', style: btnStyle),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var color in [
                    Colors.green,
                    Colors.pinkAccent,
                    Colors.cyan,
                    Colors.orangeAccent,
                    Colors.red,
                    Colors.purpleAccent,
                    Colors.yellowAccent,
                    Colors.indigoAccent,
                    Colors.teal,
                  ])
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColor = color;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(4.0),
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: selectedColor == color
                                ? Colors.white
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 10),
              const Text('Repeat', style: tileStyle),
              const SizedBox(height: 10),
              Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 05,
                    ),
                    const Text(
                      '  Set a cycle for your task',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    const Divider(
                      color: Colors.black,
                      indent: 10,
                      endIndent: 10,
                      thickness: 0.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: ['Daily', 'Weekly', 'Monthly'].map((cycle) {
                        return ChoiceChip(
                            selectedColor: const Color(0xFFFFC09F),
                            disabledColor: const Color(0xFFEDE9E9),
                            label: Text(cycle),
                            selected: repeatCycle == cycle,
                            onSelected: (selected) {
                              setState(() {
                                repeatCycle = cycle;
                              });
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ));
                      }).toList(),
                    ),
                    const Divider(
                      thickness: 0.5,
                      indent: 10,
                      endIndent: 10,
                      color: Colors.black,
                    ),
                    if (repeatCycle == 'Weekly')
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 4.0,
                        children: List.generate(7, (index) {
                          return ChoiceChip(
                            selectedColor: const Color(0xFFFFC09F),
                            disabledColor: const Color(0xFFEDE9E9),
                            label: Text([
                              'Mon',
                              'Tue',
                              'Wed',
                              'Thu',
                              'Fri',
                              'Sat',
                              'Sun'
                            ][index]),
                            selected: selectedDays[index],
                            onSelected: (selected) {
                              setState(() {
                                selectedDays[index] = selected;
                              });
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          );
                        }),
                      ),
                    const Divider(
                      thickness: 0.5,
                      indent: 10,
                      endIndent: 10,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 240,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('   Set a tag for your task'),
                    const Divider(
                      color: Colors.black,
                      thickness: 0.5,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Wrap(
                      spacing: 8.0,
                      children: tags.map((tag) {
                        return Chip(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          label: Text(tag),
                        );
                      }).toList(),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          tags.add('new task');
                        });
                      },
                      child: const Text('Add More +'),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: CustomButton(
                  text: "Add more",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TaskPage()),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
