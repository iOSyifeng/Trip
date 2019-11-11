import 'package:flutter/material.dart';

///加载进度条组件
class LoadingContatiner extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final bool cover;

  const LoadingContatiner({Key key,
    @required this.child,
    @required this.isLoading,
    this.cover = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !cover ? !isLoading ? child : _loadingView
    :Stack( //如果是cover, loading在页面之上
      children: <Widget>[child, isLoading ? _loadingView : null],
    );
  }

  Widget get _loadingView {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
