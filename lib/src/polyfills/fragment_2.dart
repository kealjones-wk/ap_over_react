import 'dart:html';
import 'dart:math';
import 'package:over_react/over_react.dart';

// ignore: uri_has_not_been_generated
part 'fragment_2.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<FragmentV2Props> FragmentV2 = _$FragmentV2;

@Props()
class _$FragmentV2Props extends UiProps {}

// AF-3369 This will be removed once the transition to Dart 2 is complete.
// ignore: mixin_of_non_class, undefined_class
class FragmentV2Props extends _$FragmentV2Props
    with _$FragmentV2PropsAccessorsMixin {
  // ignore: undefined_identifier, undefined_class, const_initialized_with_non_constant_value
  static const PropsMeta meta = _$metaForFragmentV2Props;
}

@Component()
class FragmentV2Component extends UiComponent<FragmentV2Props> {
  Element div;
  List orphans = const [];
  List fragmentChildren;
  String fragmentId = Random().nextInt(100000).toString();

  @override
  void componentWillMount() {
    setupChildren();
    super.componentWillMount();
  }

  @override
  componentDidMount() {
    //unwrapChildren();
  }

  @override
  componentDidUpdate(Map prevProps, Map prevState) {
    //unwrapChildren();
  }

  @override
  componentWillUnmount() {
    rewrapChildren();
  }

  @override
  componentWillUpdate(_, __) {
    rewrapChildren();
  }

  setupChildren() {
    var key = 0;
    fragmentChildren = props.children.map((child) {
      var propsToAdd = domProps()
        ..addProp('data-fragment', fragmentId)
        ..key = key++;
      if (child is String) {
        child = Dom.span()(child);
      }
      return cloneElement(Dom.div()(child), propsToAdd);
    }).toList();
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

      while (div.firstChild != null) {
        div.parentNode.insertBefore(div.firstChild, div);
      }
      window.document.childNodes.single.append(div);
    });
    div.style.display = 'none';
    div.style.position = 'absolute';
  }

  rewrapChildren() {
    if (!(div != null && div.parentNode != null)) {
      return;
    }
    var fragmentChildrenNodes =
        window.document.querySelectorAll('[data-fragment="$fragmentId"]');
    fragmentChildrenNodes[0].before(div);
    fragmentChildrenNodes.forEach((fragmentChild) {
      div.append(fragmentChild);
    });
    div.style.display = 'auto';
    div.style.position = 'static';
  }

  @override
  render() {
    return (Dom.div()
      ..addProp('data-fragment-id', fragmentId)
      ..ref = (ref) {
        div = ref;
      }
    )(fragmentChildren);
  }
}
