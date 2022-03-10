import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_project/debouncer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  final String _url = 'https://flutter.dev';
  final _debouncer = Debouncer(milliseconds: 1000);

  WebViewController? _webViewController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: TextFormField(
            initialValue: _url,
            onChanged: (value) {
              _debouncer.run(
                () => _webViewController!.loadUrl(value),
              );
            },
            decoration: const InputDecoration(
              hintText: 'URL',
              prefixIcon: Padding(
                padding: EdgeInsets.only(bottom: 4), // add padding to adjust icon
                child: Icon(Icons.search),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        if (_webViewController == null) const CircularProgressIndicator(),
        Expanded(
          child: WebView(
            initialUrl: _url,
            onWebViewCreated: (controller) {
              setState(() {
                _webViewController = controller;
              });
            },
          ),
        )
      ],
    );
  }
}
