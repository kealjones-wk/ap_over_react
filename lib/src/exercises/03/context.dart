import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';

SharedTogglePropsMixin tDefaultValue = SharedTogglePropsMapView()
  ..isOn = false
  ..toggle = (_) {
    print('default OnClick');
  };

Context ToggleContext = createContext(tDefaultValue);
