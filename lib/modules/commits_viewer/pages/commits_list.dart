import 'package:commit_tracker/modules/commits_viewer/widgets/commit_list_view.dart';
import 'package:commit_tracker/services/api_rest/github_api.dart';
import 'package:commit_tracker/services/schema/remote_commit.dart';
import 'package:flutter/material.dart';

class CommitsList extends StatelessWidget {
  const CommitsList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          const Row(
            children: [
              Icon(
                Icons.lightbulb,
                color: Colors.amber,
              ),
              SizedBox(
                width: 8,
              ),
              Text('Tip: Tap on commits to see details')
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const SizedBox(
            height: 8,
          ),
          FutureBuilder(
            future: GitHubApi
                .getAllCommits(), // Llama al método que obtiene los commits
            builder: (BuildContext context,
                AsyncSnapshot<List<RemoteCommit>> snapshot) {
              if (snapshot.hasData) {
                final commitsList = snapshot.data;
                return CommitsListView(commitsList: commitsList!);
              }
              // Si el snapshot tiene un error, muestra el mensaje de error
              else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }
              // Mientras se está cargando, muestra un CircularProgressIndicator
              else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
