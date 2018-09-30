import 'package:flutter/material.dart';
import 'Grade.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

Widget ClimbingRecords(BuildContext context) => Center(
      child: StreamBuilder(
        stream: Firestore.instance.collection('climbing_logs').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Text('Loading...');
          return _buildGridView(context, snapshot);
        },
      ),
    );

Widget _buildGridView(
    BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
  return GridView.builder(
    itemCount: snapshot.data.documents.length,
    padding: EdgeInsets.all(2.0),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    itemBuilder: (context, index) =>
        _buildGriditem(context, snapshot.data.documents[index]),
  );
}

Widget _buildGriditem(BuildContext context, DocumentSnapshot document) {
  return GridTile(key: ValueKey(document.documentID), child: Image.file());
}
