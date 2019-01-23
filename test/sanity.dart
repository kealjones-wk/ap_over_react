@TestOn('browser')
import 'package:over_react_test/over_react_test.dart';
import 'package:test/test.dart';
import 'package:over_react/over_react.dart';
import 'package:ap_over_react/switch.dart';
import 'package:ap_over_react/src/exercises-final/01_usage.dart';
import './utils.dart';
// TODO: Remove this file
main() {
  setClientConfiguration();
  ValidationUtil.WARNINGS_ENABLED = false;
  enableTestMode();
  TestJacket<UiComponent> jacket;

  test('Switch Sanity Check', () {
      jacket = mount(Switch()());

      expect(jacket.getDartInstance(), TypeMatcher<SwitchComponent>());
      var switchNode = queryByTestId(jacket.getNode().parentNode, 'switch');
      var inputNode = queryByTestId(jacket.getInstance(), 'switch.input');
      var buttonNode = queryByTestId(jacket.getInstance(), 'switch.button');

      expect(switchNode, isNotNull);
      expect(inputNode, isNotNull);
      expect(buttonNode, isNotNull);
  });
}
