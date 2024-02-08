import 'package:commit_tracker/modules/commits_viewer/models/remote_specific_commit.dart';

class CommitModel {
  String message;
  String author;
  DateTime dateTime;
  Stats changes;
  String avatarUrl;

  CommitModel({
    required this.message,
    required this.author,
    required this.dateTime,
    required this.changes,
    required this.avatarUrl,
  });

  factory CommitModel.fromRemote(RemoteSpecificCommit remoteCommit) {
    return CommitModel(
      message: remoteCommit.commit.message,
      author: remoteCommit.commit.author.name,
      dateTime: remoteCommit.commit.author.date,
      changes: remoteCommit.stats,
      avatarUrl: remoteCommit.author.avatarUrl,
    );
  }
}
