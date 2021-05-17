import 'package:over_react/over_react.dart';

part 'not_ready.over_react.g.dart';

mixin NotReadyProps on UiProps {}

UiFactory<NotReadyProps> NotReady = uiFunction(
  (props) {
    return Dom.div()(
      'Something is wrong. Edit the code and try again.',
    );
  },
  _$NotReadyConfig, // ignore: undefined_identifier
);
