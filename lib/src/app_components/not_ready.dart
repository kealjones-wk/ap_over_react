import 'package:over_react/over_react.dart';

part 'not_ready.over_react.g.dart';

// ignore: undefined_identifier
UiFactory<NotReadyProps> NotReady = castUiFactory(_$NotReady);

mixin NotReadyProps on UiProps {}

class NotReadyComponent extends UiComponent2<NotReadyProps> {
  @override
  render() {
    return Dom.div()(
      'Something is wrong. Edit the code and try again.',
    );
  }
}
