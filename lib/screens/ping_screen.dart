import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class PingScreen extends StatefulWidget {
  const PingScreen({Key? key}) : super(key: key);

  @override
  State<PingScreen> createState() => _PingScreenState();
}

class _PingScreenState extends State<PingScreen> {
  String? result;

  Future<void> _request() async {
    final response = await http.get(
      Uri.parse('https://dev.easydev.group/ping/')
    );
    setState(() {
      result = response.body;
    });
  }

  @override
  void initState() {
    super.initState();

    _request();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(result ?? 'Loading...'),
        ),
      ],
    );
  }
}