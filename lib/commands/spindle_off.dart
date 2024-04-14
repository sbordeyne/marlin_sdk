import 'package:marlin_sdk/commands/base.dart';

class SpindleOffCommand extends Command {
  SpindleOffCommand();

  @override
  String get name => 'spindle_off';

  @override
  String get cmd => 'M5';

  @override
  Future<String> get parameters async {
    return '';
  }

  @override
  Future<Result> handle(Iterable<String> data) async {
    return Result.none;
  }
}
