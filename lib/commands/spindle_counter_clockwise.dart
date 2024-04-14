import 'package:marlin_sdk/commands/base.dart';

class SpindleCounterClockwiseCommand extends Command {
  final int? pwmSpeed;
  final int? rpmSpeed;
  final bool inline;
  SpindleCounterClockwiseCommand({this.pwmSpeed, this.rpmSpeed, this.inline = false});

  @override
  String get name => 'spindle_counter_clockwise';

  @override
  String get cmd => 'M4';

  @override
  Future<String> get parameters async {
    final params = <String>[];
    if (inline) {
      params.add('I');
    }
    if (pwmSpeed != null && (pwmSpeed! >= 0 && pwmSpeed! <= 255)) {
      params.add('O$pwmSpeed');
    }
    if (rpmSpeed != null) {
      params.add('S$rpmSpeed');
    }
    return params.join(' ');
  }

  @override
  Future<Result> handle(Iterable<String> data) async {
    return Result.none;
  }
}
