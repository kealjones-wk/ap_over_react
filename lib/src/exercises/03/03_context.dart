import 'package:ap_over_react/src/polyfill/context.dart';

class TypedValue {
  TypedValue({this.isOn, this.onClick});

  TypedValue.fromList(List<dynamic> list) {
    this.isOn = list[0];
    this.onClick = list[1];
  }

  bool isOn;
  Function onClick;

  List<dynamic> toList() {
    return [this.isOn, this.onClick];
  }
}

TypedValue tDefaultValue = TypedValue(
    isOn: false,
    onClick: (_) {
      print('default OnClick');
    });
Context ToggleContext = createContext(tDefaultValue.toList());
