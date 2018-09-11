import 'package:flutter/material.dart';
import 'Grade.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Widget ClimbingRecords(BuildContext context) => Center(
      child: StreamBuilder(
        stream: Firestore.instance.collection('climbing_logs').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Text('Loading...');
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            padding: EdgeInsets.only(top: 10.0),
            itemExtent: 80.0,
            itemBuilder: (context, index) =>
                _buildListItem(context, snapshot.data.documents[index]),
          );
        },
      ),
    );

Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
  return ListTile(
      key: ValueKey(document.documentID),
      title: Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0x80000000)),
            borderRadius: BorderRadius.circular(5.0),
          ),
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            Row(children: [Text(document['place'])]),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(document['problem_name']),
                ),
                Text(
                  Grade.getGrade4Japan(document['grade']),
                ),
              ],
            ),
          ])));
}
