import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Task {
  final String title;
  final String deadline;
  final bool done;
  final String priority;

  Task({
    required this.title,
    required this.deadline,
    required this.done,
    required this.priority,
  });
}

class MyApp extends StatelessWidget {
  final List<Task> tasks = [
    Task(title: "Nauczyć się ListView", deadline: "dzisiaj", done: true, priority: "wysoki"),
    Task(title: "Zrobić zakupy", deadline: "jutro", done: false, priority: "średni"),
    Task(title: "Pójść na siłownię", deadline: "pojutrze", done: false, priority: "niski"),
    Task(title: "Wysłać projekt", deadline: "za tydzień", done: true, priority: "wysoki"),
  ];

  @override
  Widget build(BuildContext context) {
    int completedTasks = tasks.where((task) => task.done).length;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("KrakFlow"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Masz dziś ${tasks.length} zadania (Wykonane: $completedTasks)",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),

              Text(
                "Dzisiejsze zadania",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),


              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];

                    return TaskCard(
                      title: task.title,
                      subtitle: "termin: ${task.deadline} | priorytet: ${task.priority}",
                      icon: task.done ? Icons.check_circle : Icons.radio_button_unchecked,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const TaskCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(
          icon,
          size: 30,
          color: icon == Icons.check_circle ? Colors.green : Colors.grey,
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(subtitle),
      ),
    );
  }
}