import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/material_picker.dart';
import 'package:manage_led_app/model/bande_led.dart';
import 'package:manage_led_app/widgets/stripe_led_card.dart';

class StripeLedDetail extends StatefulWidget {

  final StripeLedModel stripeLed;

  StripeLedDetail({Key key, @required this.stripeLed}) : super(key:key);

  _StripeLedDetailState createState() => _StripeLedDetailState ();
}

class _StripeLedDetailState extends State<StripeLedDetail> {

  static const double _appBarHeight = 100.0;

  void changeColor(Color color) {
    widget.stripeLed.color = color;
    setState(() {

    });
  }

  void turnOffOn(bool data) {
    widget.stripeLed.turnOn = data;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .headline
        .copyWith(
      color: widget.stripeLed.color,
    );
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(widget.stripeLed.name),
            expandedHeight: _appBarHeight,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Center(
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
              child: Column(
                // Column is also layout widget. It takes a list of children and
                // arranges them vertically. By default, it sizes itself to fit its
                // children horizontally, and tries to be as tall as its parent.
                //
                // Invoke "debug painting" (press "p" in the console, choose the
                // "Toggle Debug Paint" action from the Flutter Inspector in Android
                // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
                // to see the wireframe for each widget.
                //
                // Column has various properties to control how it sizes itself and
                // how it positions its children. Here we use mainAxisAlignment to
                // center the children vertically; the main axis here is the vertical
                // axis because Columns are vertical (the cross axis would be
                // horizontal).

                children: <Widget>[
                  Hero(
                    tag: 'info_${widget.stripeLed.id}',
                    child:  StripeLedCard(stripeLed: widget.stripeLed)
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.77,
                    child: Card(
                      child: MaterialPicker(
                        pickerColor: widget.stripeLed.color,
                        onColorChanged: changeColor,
                        enableLabel: true,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: SwitchListTile(
                        title: Text("Allumage des Leds"),
                        value: widget.stripeLed.turnOn,
                        onChanged: turnOffOn),
                  ),
                  FutureBuilder<StripeLedModel>(
                      future: getBandeLed(1),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(snapshot.data.name);
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }

                        // By default, show a loading spinner.
                        return CircularProgressIndicator();
                      }
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}