import 'package:flutter/material.dart';
import 'package:flutter_firebase_and_provider_integration/model/StatusCodeModel.dart';

import '../constant.dart';

class InfoCard extends StatelessWidget {
  final StatusCode status;

  const InfoCard(this.status);

  @override
  Widget build(BuildContext context) {
    return StatusInfoCard(status: status);
  }
}

class StatusInfoCard extends StatelessWidget {
  final StatusCode status;

  const StatusInfoCard({required this.status});

  @override
  Widget build(BuildContext context) {

    var stylish = Theme.of(context).textTheme.headline6?.copyWith(
      color: secondaryColor,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
    );

    return Card(
        color: secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        shadowColor: Colors.tealAccent,
        elevation: 10.0,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Center(
              child: Text("Http Status Code",
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 20,
                  )
                  ),
            ),
          ),
          SizedBox(
            child: AspectRatio(
              aspectRatio: 2.5 / 1,
              child: Card(
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 16,
                  shadowColor: secondaryColor,
                  color: fillColor,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ListView(
                      children: [
                        Text('code:  ' + status.code!, style: stylish,),
                        const Divider(thickness: 0.5, indent: 20,),
                        Text('status:  ' + status.status!, style: stylish,),
                        const Divider(thickness: 0.5, indent: 20,),
                        Text('category:  ' + status.category!, style: stylish,),
                        const Divider(thickness: 0.5, indent: 20,),
                        Text('explain:  ' + status.explain!, style: stylish,),
                        const Divider(thickness: 0.5, indent: 20,),
                      ],
                    ),
                  )),
            ),
          ),
        ]));
  }
}
