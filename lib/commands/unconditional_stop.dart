import 'package:marlin_sdk/commands/base.dart';

class UnconditionalStopCommand extends Command {
  final Duration? duration;
  final String? message;
  UnconditionalStopCommand({this.duration, this.message});

  @override
  String get name => 'unconditional_stop';

  @override
  String get cmd => 'M0';

  @override
  Future<String> get parameters async {
    final params = <String>[];
    if (duration != null) {
      params.add('P${duration!.inMilliseconds}');
    }
    if (message != null) {
      params.add(message!);
    }
    return params.join(' ');
  }

  @override
  Future<Result> handle(Iterable<String> data) async {
    return Result.none;
  }
}
