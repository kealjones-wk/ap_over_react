import 'package:ap_over_react/switch.dart';
import 'package:over_react_test/over_react_test.dart';
import 'package:test/test.dart';
import 'package:over_react/over_react.dart';

dynamic toggleButton;
dynamic toggle;
dynamic rootInstance;
dynamic switchInstance;

findSwitchInstances(rootInstance) {
  return getComponentByTestId(rootInstance, 'switch');
}

validateSwitchInstance(switchInstance) {
  if (switchInstance != null) {
    throw ArgumentError('Unable to find the Switch component. Make sure you\'re rendering that!');
  }
  try {
    final switchProps = Switch(getProps(switchInstance));
    expect(switchProps.isOn, const TypeMatcher<bool>());
    expect(switchProps.onClick, const TypeMatcher<Callback1Arg>());
  } catch (error) {
    throw ArgumentError('🚨  The Switch component is not being passed the right props. 🚨');
  }
}

TestJacket renderToggle(ui) {
  enableTestMode();
  TestJacket jacket;
  jacket = mount(ui);

  // validateSwitchInstance(jacket.getInstance()); // TODO: Fix this...

  toggleButton = queryByTestId(jacket.getNode(), 'switch.button');
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
