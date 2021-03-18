import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:supplychaintracker/services/database.dart';
import 'package:provider/provider.dart';

class TransactionDis extends StatefulWidget {
  @override
  _TransactionDisState createState() => _TransactionDisState();
}

class _TransactionDisState extends State<TransactionDis> {
  Object snapshot;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[900],
          title: Text("Transactions"),
        ),
        backgroundColor: Colors.lightGreenAccent,
        body: Padding(
            padding: EdgeInsets.fromLTRB(15, 40, 15, 10),
            child: ColoredBox(
              color: Colors.white,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('transaction')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) return Text("Loading");
                    return DataTable(
                      showBottomBorder: true,
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            'Product',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Amount',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Date',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                      rows: snapshot.data.docs.map((document) {
                        return DataRow(
                          cells: <DataCell>[
                            DataCell(Text(document['productName'])),
                            DataCell(Text(document['amount'].toString())),
                            DataCell(Text(document['timeStamp'].toString())),
                          ],
                        );
                      }).toList(),
                    );
                  }),
            )),
      ),
    );
  }
}
