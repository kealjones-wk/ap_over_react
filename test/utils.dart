import 'package:ap_over_react/switch.dart';
import 'package:over_react_test/over_react_test.dart';
import 'package:test/test.dart';
import 'package:over_react/over_react.dart';
import 'dart:html';
import 'package:ap_over_react/switch.dart';
import 'package:react/react.dart' as react;

var toggleButton;
var toggle;
var rootInstance;
var switchInstance;

findSwitchInstances(rootInstance) {
  return getComponentByTestId(rootInstance, 'switch');
}

validateSwitchInstance(switchInstance) {
  if (switchInstance != null) {
    throw new ArgumentError('Unable to find the Switch component. Make sure you\'re rendering that!');
  }
  try {
    var switchProps = Switch(getProps(switchInstance));
    expect(switchProps.isOn, TypeMatcher<bool>());
    expect(switchProps.onClick, TypeMatcher<Callback1Arg>());
  } catch (error) {
    throw new ArgumentError('🚨  The Switch component is not being passed the right props. 🚨');
  }
}

renderToggle(ui) {
  enableTestMode();
  TestJacket jacket;
  jacket = mount(ui);

  // validateSwitchInstance(jacket.getInstance()); // TODO: Fix this...

  toggleButton = queryByTestId(jacket.getNode(),'switch.button');
  toggle = () => click(toggleButton);

  return jacket;
}

class TestCallback {
  int count = 0;
  dynamic returnValue;
  callback([args]) {
    count++;
    returnValue = args;
  }
  reset() {
    count = 0;
    returnValue = null;
  }
}
