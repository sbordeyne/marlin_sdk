# Marlin SDK

A dart SDK to send gcode over a socket for the Marlin firmware.

## Example

```dart
import 'package:marlin_sdk/marlin_sdk.dart';
import 'package:marlin_sdk/commands.dart';

void main() async {
    final client = MarlinClient('192.168.0.1', 8899);

    final result = await client.send(UnconditionalStopCommand());
}

```
