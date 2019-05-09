import 'package:react/react_client.dart';
import 'package:ap_over_react/src/shared/shared_props.dart'
    as shared_toggle_props;

shared_toggle_props.BaseToggleProps tDefaultValue =
    shared_toggle_props.BaseToggleProps()
      ..isOn = false
      ..toggle = (_) {
        print('default OnClick');
      };

ReactDartContext ToggleContext = createContext(tDefaultValue);
