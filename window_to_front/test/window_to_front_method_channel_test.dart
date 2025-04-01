import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:window_to_front/window_to_front_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelWindowToFront platform = MethodChannelWindowToFront();
  const MethodChannel channel = MethodChannel('window_to_front');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return null; // Return null since activate returns void
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('activate', () async {
    // Just verify that the method completes without throwing an error
    await platform.activate();
    expect(true, true); // Dummy assertion to verify test ran
  });
}
