import 'package:flutter_test/flutter_test.dart';
import 'package:window_to_front/window_to_front.dart';
import 'package:window_to_front/window_to_front_platform_interface.dart';
import 'package:window_to_front/window_to_front_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWindowToFrontPlatform
    with MockPlatformInterfaceMixin
    implements WindowToFrontPlatform {

  @override
  Future<void> activate() => Future.value();
}

void main() {
  final WindowToFrontPlatform initialPlatform = WindowToFrontPlatform.instance;

  test('$MethodChannelWindowToFront is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWindowToFront>());
  });

  test('activate', () async {
    MockWindowToFrontPlatform fakePlatform = MockWindowToFrontPlatform();
    WindowToFrontPlatform.instance = fakePlatform;

    await WindowToFront.activate();
    // Since activate returns void, we just verify it completes without error
  });
}
