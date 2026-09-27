import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FadeInOutTweenExample(),
    );
  }
}

class FadeInOutTweenExample extends StatefulWidget {
  @override
  _FadeInOutTweenExampleState createState() => _FadeInOutTweenExampleState();
}

class _FadeInOutTweenExampleState extends State<FadeInOutTweenExample> {
  bool _visible = true;

  void _toggleVisibility() {
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fade In/Out with TweenAnimationBuilder')),
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(
            begin: _visible ? 0.0 : 1.0,
            end: _visible ? 1.0 : 0.0,
          ),
          duration: Duration(seconds: 1),
          builder: (context, opacity, child) {
            return Opacity(
              opacity: opacity,
              child: child,
            );
          },
          child: Text(
            "Hello Flutter!",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleVisibility,
        child: Icon(Icons.visibility),
        tooltip: 'Fade In/Out',
      ),
    );
  }
}
