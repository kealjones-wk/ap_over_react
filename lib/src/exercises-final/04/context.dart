import 'package:ap_over_react/src/polyfills/context.dart';
import 'package:ap_over_react/src/shared/typed_value.dart';

TypedValue tDefaultValue = TypedValue(
    isOn: false,
    onClick: (_) {
      print('default OnClick');
    });
Context ToggleContext = createContext(tDefaultValue);
