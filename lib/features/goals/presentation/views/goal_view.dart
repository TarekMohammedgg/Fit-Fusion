import 'package:flutter/material.dart';

class GoalsView extends StatelessWidget {
  const GoalsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0F0C13),
      appBar: AppBar(
        backgroundColor: const Color(0xff0F0C13),
        elevation: 0,
        title: const Text("Goals",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add, color: Colors.white),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Active Goals
            const Text("Active Goals",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 16),

            GoalCard(
              icon: Icons.directions_walk,
              title: "Daily Steps",
              subtitle: "10000 steps",
              progress: 0.75,
              value: "75",
            ),
            GoalCard(
              icon: Icons.fitness_center,
              title: "Exercise",
              subtitle: "30 minutes",
              progress: 0.50,
              value: "50",
            ),
            GoalCard(
              icon: Icons.nights_stay,
              title: "Sleep",
              subtitle: "8 hours",
              progress: 0.90,
              value: "90",
            ),

            const SizedBox(height: 24),

            // Completed Goals
            const Text("Completed Goals",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 16),

            CompletedGoalCard(
              icon: Icons.directions_walk,
              title: "Daily Steps",
              subtitle: "10000 steps",
            ),
            CompletedGoalCard(
              icon: Icons.fitness_center,
              title: "Exercise",
              subtitle: "30 minutes",
            ),
          ],
        ),
      ),
    );
  }
}

class GoalCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final double progress;
  final String value;

  const GoalCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.progress,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          // Icon Box
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: const Color(0xff2C2230),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(width: 12),

          // Text & Progress
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Text(subtitle,
                    style: const TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 6,
                    backgroundColor: Colors.white24,
                    color: const Color(0xff7B5B9C),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),
          Text(value,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class CompletedGoalCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const CompletedGoalCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          // Icon Box
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: const Color(0xff2C2230),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(width: 12),

          // Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Text(subtitle,
                    style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),

          const Icon(Icons.check, color: Colors.white),
        ],
      ),
    );
  }
}
