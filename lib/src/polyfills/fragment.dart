import 'dart:html';
import 'package:over_react/over_react.dart';

// ignore: uri_has_not_been_generated
part 'fragment.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<FragmentProps> Fragment = _$Fragment;

@Props()
class _$FragmentProps extends UiProps {}

// AF-3369 This will be removed once the transition to Dart 2 is complete.
// ignore: mixin_of_non_class, undefined_class
class FragmentProps extends _$FragmentProps with _$FragmentPropsAccessorsMixin {
  // ignore: undefined_identifier, undefined_class, const_initialized_with_non_constant_value
  static const PropsMeta meta = _$metaForFragmentProps;
}

@Component()
class FragmentComponent extends UiComponent<FragmentProps> {
  Element div;
  List orphans = const [];

  @override
  componentDidMount() {
    unwrapChildren();
    div.style.display = 'none';
  }

  @override
  componentDidUpdate(Map prevProps, Map prevState) {
    unwrapChildren();
  }

  @override
  componentWillUnmount() {
    super.componentWillMount();
    rewrapChildren();
  }

  @override
  componentWillUpdate(nextProps, nextState) {
    rewrapChildren();
  }

  unwrapChildren() {
    // defer first to style calculation to ensure CSS transitions can happen:
    // https://stackoverflow.com/a/24195559/4956731
    new Future.delayed(const Duration(milliseconds: 0), () {
      // plain js rocks!
      // https://plainjs.com/javascript/manipulation/unwrap-a-dom-element-35/
      if (div.parentNode == null) {
        return;
      }
      orphans = [];
      while (div.firstChild != null) {
        orphans.add(div.firstChild);
        div.parentNode.insertBefore(div.firstChild, div);
      }
    });
  }

  rewrapChildren() {
    if (!(div != null && div.parentNode != null)) {
      return;
    }
    orphans.forEach((orphan) {
      div.append(orphan);
    });
  }

  @override
  render() {
    rewrapChildren();
    return (Dom.div()
      ..ref = (ref) {
        div = ref;
      }
    )(props.children);
  }
}
