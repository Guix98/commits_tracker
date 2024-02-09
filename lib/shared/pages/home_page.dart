import 'package:commit_tracker/modules/commits_viewer/pages/commits_list.dart';
import 'package:commit_tracker/shared/widgets/theme_switch.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: const [ThemeSwitch()],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Commit List'),
              Tab(text: 'Timeline'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const SimpleStateMachine(),
            Container(color: Colors.green),
          ],
        ),
      ),
    );
  }
}
