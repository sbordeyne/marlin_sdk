class Result {
  static const none = Result('');
  final String data;
  const Result(this.data);
}

abstract class Command {
  String get name;
  String get cmd;
  Future<String> get parameters async => '';
  Future<Result> handle(Iterable<String> data);
}
