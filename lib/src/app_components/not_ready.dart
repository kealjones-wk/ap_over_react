import 'package:over_react/over_react.dart';

// ignore: uri_has_not_been_generated
part 'not_ready.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<NotReadyProps> NotReady = _$NotReady;

@Props()
class _$NotReadyProps extends UiProps {}

@Component()
class NotReadyComponent extends UiComponent<NotReadyProps> {
  @override
  render() {
    return Dom.div()(
      'Something is wrong. Edit the code and try again.',
    );
  }
}
