import 'dart:io';
import 'dart:convert';

import 'package:marlin_sdk/commands/base.dart';

class MarlinClient {
  final String hostName;
  final int port;
  late final Socket socket;

  MarlinClient(this.hostName, this.port);

  Future<void> connect() async {
    socket = await Socket.connect(hostName, port);
  }

  Future<Result> send(Command command) async {
    socket.add(utf8.encode('~${command.cmd} ${await command.parameters}\r\n'));
    await socket.done;
    final data = utf8.decode(await socket.first).split('\r\n');
    final result = await command.handle(data.skip(1).take(data.length - 1));
    return result;
  }
}
