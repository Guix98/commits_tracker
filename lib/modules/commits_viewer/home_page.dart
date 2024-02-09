import 'package:commit_tracker/services/api_rest/github_api.dart';
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
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Commit List'),
              Tab(text: 'Timeline'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GestureDetector(
              child: Container(color: Colors.red),
              onTap: () {
                GitHubApi.getAllCommits();
              },
            ),
            Container(color: Colors.green),
          ],
        ),
      ),
    );
  }
}
