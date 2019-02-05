import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises-final/01/toggle.dart';

// ignore: uri_has_not_been_generated
part 'usage.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<UsageProps> Usage = _$Usage;

@Props()
class _$UsageProps extends UiProps {
  Callback1Arg onToggle;
}

@Component()
class UsageComponent extends UiComponent<UsageProps> {
  void onToggle(args) => print('onToggle $args');

  @override
  render() {
    return (Toggle()..onToggle = onToggle)();
  }
}
