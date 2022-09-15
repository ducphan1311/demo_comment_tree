import 'package:flutter/material.dart';
import 'package:tips_and_tricks_flutter/presentation/widgets/video_widget.dart';
import 'dart:ui' as ui;


class WebViewPage extends StatefulWidget {
  static const path = '/web_view_page';
  const WebViewPage({Key? key}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  void initState() {
    super.initState();
    // ui.platformViewRegistry.registerViewFactory('openstreetmap', (int viewId) {
    //   return IFrameElement()
    //     ..style.width = '100%'
    //     ..style.height = '100%'
    //     ..src = 'https://www.openstreetmap.org/export/embed.html?bbox=-0.004017949104309083%2C51.47612752641776%2C0.00030577182769775396%2C51.478569861898606&layer=mapnik'
    //     ..style.border = 'none';
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WebViewPage'),),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child:
        // WebViewX(
        //     initialContent: '<h2> Hello, world! </h2>',
        //     initialSourceType: SourceType.html,
        //     onWebViewCreated: (controller) => webviewController = controller,
        //     ...
        //     ... other options
        // )
        // HtmlElementView(viewType: 'openstreetmap')
        // WebView(
        //   initialUrl: Uri.dataFromString('<html><body><iframe src="https://embed.animehehe.app?k=411a40c1cf5d608cc1fad2e4ee4bb62a&li=0&tham=1663150526&lt=os&qlt=720p&spq=p&prv=&key=c5d0f9982fc6ff4c8dbab293032bf2c5&ua=802a1200e7ca638d6a6071bfed50e66dd9601ba77a61cd5f11804df3c90df3453fc8756844ea4426915362f8d4901f36d4849f99489af54daa8d45f34b80c0793e9c6effd19285e996c192380266c9802b1c14349110c1b24d06658fd472c84ecef55135398f2e4a623f068037f049054c7a061a27f16cd8f3b0b9e7e03ed51b" width="100%" height="100%" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true" allowFullScreen="true" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"><\/iframe></body></html>', mimeType: 'text/html', parameters: {"action":"load_link","episode_id":"155287","sv":"oserver","show":"1","debug":"123"}).toString(),
        //   javascriptMode: JavascriptMode.unrestricted,
        // ),
        VideoWidget(videoId: 1, recordId: 1)
      ),
    );
  }
}