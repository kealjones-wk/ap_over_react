@TestOn('browser')
import 'package:over_react_test/over_react_test.dart';
import 'package:test/test.dart';
import 'package:over_react/over_react.dart';

import 'package:ap_over_react/src/exercises-final/ap_01.dart'; // comment out this line when you want to test your implementation
// import 'package:ap_over_react/src/exercises/ap_01.dart'; // uncomment this line when you want to test your implementation

import '../utils.dart';

main() {
  ValidationUtil.WARNINGS_ENABLED = false;
  enableTestMode();

  test('renders a toggle component', () {
    final testCB = TestCallback();
    renderToggle((Usage()..onToggle = testCB.callback)());

    expect(toggleButton, hasClasses('toggle-btn-off')); // is Off
    toggle();
    expect(toggleButton, hasClasses('toggle-btn-on')); // is On
    expect(testCB.count, 1);
    expect(testCB.returnValue, true);
  });
}
