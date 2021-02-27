part of 'services.dart';

class CinemaTransactionServices {
  static CollectionReference transactionCollection =
      Firestore.instance.collection('transactions');

  // save transaction
  static Future<void> saveTransaction(
      CinemaTransaction cinemaTransaction) async {
    await transactionCollection.document().setData({
      'userID': cinemaTransaction.userID,
      'title': cinemaTransaction.title,
      'subtitle': cinemaTransaction.subtitle,
      'time': cinemaTransaction.time.millisecondsSinceEpoch,
      'amount': cinemaTransaction.amount,
      'picture': cinemaTransaction.picture
    });
  }

  // get transaction
  static Future<List<CinemaTransaction>> getTransaction(String userID) async {
    // ambil document
    QuerySnapshot snapshot = await transactionCollection.getDocuments();

    var documents = snapshot.documents
        .where((document) => document.data['userID'] == userID);

    return documents
        .map((e) => CinemaTransaction(
            userID: e.data['userID'],
            title: e.data['title'],
            subtitle: e.data['subtitle'],
            time: DateTime.fromMillisecondsSinceEpoch(e.data['time']),
            amount: e.data['amount'],
            picture: e.data['picture']))
        .toList();
  }
}
