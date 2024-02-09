import 'package:commit_tracker/services/schema/remote_commit.dart';
import 'package:commit_tracker/shared/helpers/helpers.dart';
import 'package:flutter/material.dart';

class CommitsListView extends StatelessWidget {
  const CommitsListView({
    super.key,
    required this.commitsList,
  });

  final List<RemoteCommit> commitsList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: commitsList.length,
            itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: Text(
                      formatNewLines(
                        commitsList[index].commit.message,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(commitsList[index].commit.author.name),
                        const Spacer(),
                        Text(
                          formatDateTime(commitsList[index].commit.author.date),
                          style: const TextStyle(fontSize: 8),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(commitsList[index].author.avatarUrl)),
                  ),
                )));
  }
}
