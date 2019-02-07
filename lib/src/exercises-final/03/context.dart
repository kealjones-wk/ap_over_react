import 'package:ap_over_react/src/polyfills/context.dart';
import 'package:ap_over_react/src/shared/shared_props.dart'
    as sharedToggleProps;

sharedToggleProps.BaseToggleProps tDefaultValue =
    sharedToggleProps.BaseToggleProps()
      ..isOn = false
      ..toggle = (_) {
        print('context default onClick');
      };
Context ToggleContext = createContext(tDefaultValue);
