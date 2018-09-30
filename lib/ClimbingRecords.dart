import 'package:flutter/material.dart';
import 'Grade.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';
import 'dart:io';

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

Image _getImageFromFirebaseStorage(DocumentSnapshot document) {
  var imageUrl = document['image_url'];
  if (imageUrl == null) {
    return Image.asset(
      'images/noimage.png',
      width: 300.0,
      height: 120.0,
      fit: BoxFit.cover,
    );
  }

  return Image.network(imageUrl);
}

Card _buildGriditem(BuildContext context, DocumentSnapshot document) {
  return Card(
      child: GridTile(
          key: ValueKey(document.documentID),
          child: _getImageFromFirebaseStorage(document)));
}
