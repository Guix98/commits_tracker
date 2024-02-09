import 'dart:convert';

class RemoteSpecificCommit {
  String url;
  String sha;
  String nodeId;
  String htmlUrl;
  String commentsUrl;
  Commit commit;
  SpecificCommitAuthor author;
  SpecificCommitAuthor committer;
  List<Tree> parents;
  Stats stats;
  List<FileElement> files;

  RemoteSpecificCommit({
    required this.url,
    required this.sha,
    required this.nodeId,
    required this.htmlUrl,
    required this.commentsUrl,
    required this.commit,
    required this.author,
    required this.committer,
    required this.parents,
    required this.stats,
    required this.files,
  });

  factory RemoteSpecificCommit.fromRawJson(String str) =>
      RemoteSpecificCommit.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RemoteSpecificCommit.fromJson(Map<String, dynamic> json) =>
      RemoteSpecificCommit(
        url: json["url"],
        sha: json["sha"],
        nodeId: json["node_id"],
        htmlUrl: json["html_url"],
        commentsUrl: json["comments_url"],
        commit: Commit.fromJson(json["commit"]),
        author: SpecificCommitAuthor.fromJson(json["author"]),
        committer: SpecificCommitAuthor.fromJson(json["committer"]),
        parents: List<Tree>.from(json["parents"].map((x) => Tree.fromJson(x))),
        stats: Stats.fromJson(json["stats"]),
        files: List<FileElement>.from(
            json["files"].map((x) => FileElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "sha": sha,
        "node_id": nodeId,
        "html_url": htmlUrl,
        "comments_url": commentsUrl,
        "commit": commit.toJson(),
        "author": author.toJson(),
        "committer": committer.toJson(),
        "parents": List<dynamic>.from(parents.map((x) => x.toJson())),
        "stats": stats.toJson(),
        "files": List<dynamic>.from(files.map((x) => x.toJson())),
      };
}

class SpecificCommitAuthor {
  String login;
  int id;
  String nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String eventsUrl;
  String receivedEventsUrl;
  String type;
  bool siteAdmin;

  SpecificCommitAuthor({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
  });

  factory SpecificCommitAuthor.fromRawJson(String str) =>
      SpecificCommitAuthor.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SpecificCommitAuthor.fromJson(Map<String, dynamic> json) =>
      SpecificCommitAuthor(
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        avatarUrl: json["avatar_url"],
        gravatarId: json["gravatar_id"],
        url: json["url"],
        htmlUrl: json["html_url"],
        followersUrl: json["followers_url"],
        followingUrl: json["following_url"],
        gistsUrl: json["gists_url"],
        starredUrl: json["starred_url"],
        subscriptionsUrl: json["subscriptions_url"],
        organizationsUrl: json["organizations_url"],
        reposUrl: json["repos_url"],
        eventsUrl: json["events_url"],
        receivedEventsUrl: json["received_events_url"],
        type: json["type"],
        siteAdmin: json["site_admin"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "avatar_url": avatarUrl,
        "gravatar_id": gravatarId,
        "url": url,
        "html_url": htmlUrl,
        "followers_url": followersUrl,
        "following_url": followingUrl,
        "gists_url": gistsUrl,
        "starred_url": starredUrl,
        "subscriptions_url": subscriptionsUrl,
        "organizations_url": organizationsUrl,
        "repos_url": reposUrl,
        "events_url": eventsUrl,
        "received_events_url": receivedEventsUrl,
        "type": type,
        "site_admin": siteAdmin,
      };
}

class Commit {
  String url;
  CommitAuthor author;
  CommitAuthor committer;
  String message;
  Tree tree;
  int commentCount;
  Verification verification;

  Commit({
    required this.url,
    required this.author,
    required this.committer,
    required this.message,
    required this.tree,
    required this.commentCount,
    required this.verification,
  });

  factory Commit.fromRawJson(String str) => Commit.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Commit.fromJson(Map<String, dynamic> json) => Commit(
        url: json["url"],
        author: CommitAuthor.fromJson(json["author"]),
        committer: CommitAuthor.fromJson(json["committer"]),
        message: json["message"],
        tree: Tree.fromJson(json["tree"]),
        commentCount: json["comment_count"],
        verification: Verification.fromJson(json["verification"]),
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "author": author.toJson(),
        "committer": committer.toJson(),
        "message": message,
        "tree": tree.toJson(),
        "comment_count": commentCount,
        "verification": verification.toJson(),
      };
}

class CommitAuthor {
  String name;
  String email;
  DateTime date;

  CommitAuthor({
    required this.name,
    required this.email,
    required this.date,
  });

  factory CommitAuthor.fromRawJson(String str) =>
      CommitAuthor.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CommitAuthor.fromJson(Map<String, dynamic> json) => CommitAuthor(
        name: json["name"],
        email: json["email"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "date": date.toIso8601String(),
      };
}

class Tree {
  String url;
  String sha;

  Tree({
    required this.url,
    required this.sha,
  });

  factory Tree.fromRawJson(String str) => Tree.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tree.fromJson(Map<String, dynamic> json) => Tree(
        url: json["url"],
        sha: json["sha"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "sha": sha,
      };
}

class Verification {
  bool verified;
  String reason;
  dynamic signature;
  dynamic payload;

  Verification({
    required this.verified,
    required this.reason,
    required this.signature,
    required this.payload,
  });

  factory Verification.fromRawJson(String str) =>
      Verification.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Verification.fromJson(Map<String, dynamic> json) => Verification(
        verified: json["verified"],
        reason: json["reason"],
        signature: json["signature"],
        payload: json["payload"],
      );

  Map<String, dynamic> toJson() => {
        "verified": verified,
        "reason": reason,
        "signature": signature,
        "payload": payload,
      };
}

class FileElement {
  String filename;
  int additions;
  int deletions;
  int changes;
  String status;
  String rawUrl;
  String blobUrl;
  String patch;

  FileElement({
    required this.filename,
    required this.additions,
    required this.deletions,
    required this.changes,
    required this.status,
    required this.rawUrl,
    required this.blobUrl,
    required this.patch,
  });

  factory FileElement.fromRawJson(String str) =>
      FileElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        filename: json["filename"],
        additions: json["additions"],
        deletions: json["deletions"],
        changes: json["changes"],
        status: json["status"],
        rawUrl: json["raw_url"],
        blobUrl: json["blob_url"],
        patch: json["patch"],
      );

  Map<String, dynamic> toJson() => {
        "filename": filename,
        "additions": additions,
        "deletions": deletions,
        "changes": changes,
        "status": status,
        "raw_url": rawUrl,
        "blob_url": blobUrl,
        "patch": patch,
      };
}

class Stats {
  int additions;
  int deletions;
  int total;

  Stats({
    required this.additions,
    required this.deletions,
    required this.total,
  });

  factory Stats.fromRawJson(String str) => Stats.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        additions: json["additions"],
        deletions: json["deletions"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "additions": additions,
        "deletions": deletions,
        "total": total,
      };
}
