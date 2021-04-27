import 'package:ad/ad_state.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

void main() {
  //* becuase i want to use a plugin before calling run app // avoid runtime error
  WidgetsFlutterBinding.ensureInitialized();

  final initFuture = MobileAds.instance.initialize();

  final adState = AdState(initFuture);

  runApp(Provider.value(
    value: adState,
    builder: (context, child) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AdComponent(),
    );
  }
}

//* ADMOB Component

const String testDevice = 'Mobile_Ad';

class AdComponent extends StatefulWidget {
  @override
  _AdComponentState createState() => _AdComponentState();
}

class _AdComponentState extends State<AdComponent> {
  BannerAd banner;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (banner == null)
              SizedBox(height: 50)
            else
              Container(
                height: 50,
                color: Colors.blue,
                child: AdWidget(ad: banner),
              ),
            Flexible(
              child: Placeholder(),
            ),
          ],
        ),
      ),
    );
  }
}
