import 'package:commit_tracker/modules/commits_viewer/models/remote_commit.dart';

class CommitModel {
  String message;
  String author;
  DateTime dateTime;
  String changes;
  String avatarUrl;

  CommitModel({
    required this.message,
    required this.author,
    required this.dateTime,
    required this.changes,
    required this.avatarUrl,
  });

  factory CommitModel.fromRemote(RemoteCommit remoteCommit) {
    return CommitModel(
      message: remoteCommit.commit.message,
      author: remoteCommit.commit.author.name,
      dateTime: remoteCommit.commit.author.date,
      changes: remoteCommit.commit.message,
      avatarUrl: remoteCommit.author.avatarUrl,
    );
  }
}
