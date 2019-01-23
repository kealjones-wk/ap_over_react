@TestOn('browser')
import 'package:over_react_test/over_react_test.dart';
import 'package:test/test.dart';
import 'package:over_react/over_react.dart';
import './utils.dart';

import 'package:ap_over_react/src/exercises-final/02_usage.dart'; // comment out this line when you want to test your implementation
// import 'package:ap_over_react/src/exercises/02.dart'; // uncomment this line when you want to test your implementation


main(){
  setClientConfiguration();
  ValidationUtil.WARNINGS_ENABLED = false;
  enableTestMode();

  test('renders a toggle component', () {
    TestCallback testCB = TestCallback();
    TestJacket container = renderToggle((Usage()..onToggle = testCB.callback)());

    expect(toggleButton, hasClasses('toggle-btn-off')); // toBeOff
    expect(container.getNode().text, 'The button is off');
    expect(container.getNode().text, isNot('The button is on'));
    toggle();
    expect(toggleButton, hasClasses('toggle-btn-on')); // toBeOn
    expect(container.getNode().text, 'The button is on');
    expect(container.getNode().text, isNot('The button is off'));
    expect(testCB.count, 1);
    expect(testCB.returnValue, true);
  });
}
