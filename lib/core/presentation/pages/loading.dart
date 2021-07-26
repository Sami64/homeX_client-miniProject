import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:core';

class LoadingPage extends StatefulWidget {
  final Function? callback;

  final Future<String?> errorText;

  const LoadingPage({Key? key, required this.errorText, this.callback})
      : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
        initialData: "",
        future: widget.errorText,
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              title:
                  snapshot.data!.isNotEmpty ? Text('An Error Occured  ') : null,
              content: snapshot.data!.isNotEmpty
                  ? Text(snapshot.data!)
                  : Row(
                      children: <Widget>[
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).primaryColor),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Text("Loading..."),
                        )
                      ],
                    ),
              actions: snapshot.data!.isNotEmpty
                  ? <Widget>[
                      TextButton.icon(
                          icon: Icon(Icons.refresh),
                          onPressed: () =>
                              Navigator.of(context).pop<bool>(false),
                          label: Text('RETRY'))
                    ]
                  : null,
            );
          return Builder(builder: (context) {
            SchedulerBinding.instance!.addPostFrameCallback((_) async {
              Navigator.of(context).pop<bool>(true);
              //print('CALLBACK VAL ${await widget.errorText}');
              widget.callback!();
            });
            return Container();
          });
        });
  }
}
