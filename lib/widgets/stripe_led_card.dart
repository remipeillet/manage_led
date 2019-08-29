import 'package:flutter/material.dart';
import 'package:manage_led_app/model/bande_led.dart';
import 'package:manage_led_app/views/bande_led_details.dart';

class StripeLedCard extends StatefulWidget {

  final StripeLedModel stripeLed;

  StripeLedCard({Key key, @required this.stripeLed}) : super(key:key);

  _StripeLedCardState createState() => _StripeLedCardState ();
}


class _StripeLedCardState extends State<StripeLedCard>{

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => StripeLedDetail(stripeLed: widget.stripeLed))),
      child: Hero(
        tag: 'stripe_led_card_${widget.stripeLed.id}',
        child: Card(
            color: widget.stripeLed.color,
            elevation: 2.0,
            shape: const Border(),
            child: SizedBox(
              height: 100,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Text(widget.stripeLed.name),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          icon: widget.stripeLed.turnOn ? Icon(Icons.brightness_high) : Icon(Icons.brightness_low),
                          color: Colors.amber,
                          onPressed: () {
                            setState(() {
                              widget.stripeLed.turnOn = !widget.stripeLed.turnOn;
                            });
                          }
                      ),
                    ),
                  ],
                ),
              ),
            )

        ),
      )

    );
  }
}