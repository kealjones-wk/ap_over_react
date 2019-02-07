import 'package:ap_over_react/src/polyfills/context.dart';
import 'package:ap_over_react/src/shared/shared_props.dart'
    as SharedToggleProps;

SharedToggleProps.BaseToggleProps tDefaultValue =
    SharedToggleProps.BaseToggleProps()
      ..isOn = false
      ..toggle = (_) {
        print('default OnClick');
      };

Context ToggleContext = createContext(tDefaultValue);
