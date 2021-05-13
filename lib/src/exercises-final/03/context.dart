import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';

final tDefaultValue = SharedTogglePropsMapView()
  ..isOn = false
  ..toggle = (_) {
    print('context default onClick');
  };
Context ToggleContext = createContext(tDefaultValue);
