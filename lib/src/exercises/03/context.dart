import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart' as shared_toggle_props;

shared_toggle_props.SharedTogglePropsMapView tDefaultValue = shared_toggle_props.SharedTogglePropsMapView()
  ..isOn = false
  ..toggle = (_) {
    print('default OnClick');
  };

Context ToggleContext = createContext(tDefaultValue);
