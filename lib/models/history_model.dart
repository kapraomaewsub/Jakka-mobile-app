class HistoryModel{
  String date;
  String jakkaNo;
  String status;

  HistoryModel(
    {required this.date, required this.jakkaNo, required this.status}
  );

  static List<HistoryModel> getHistory() {
    List<HistoryModel> history = [];
    history.add(HistoryModel(
        date: '18/03/2024 8:35',
        jakkaNo: 'Jakka No. 224',
        status: 'Not Returned'
      )
    );

    history.add(HistoryModel(
        date: '14/03/2024 8:26',
        jakkaNo: 'Jakka No. 122',
        status: 'Returned'
      )
    );

    history.add(HistoryModel(
        date: '13/03/2024 8:30',
        jakkaNo: 'Jakka No. 102',
        status: 'Returned'
      )
    );

    history.add(HistoryModel(
        date: '12/03/2024 17:20',
        jakkaNo: 'Jakka No. 19',
        status: 'Returned'
      )
    );

    history.add(HistoryModel(
        date: '9/03/2024 8:20',
        jakkaNo: 'Jakka No. 55',
        status: 'Returned'
      )
    );

    history.add(HistoryModel(
        date: '7/03/2024 8:25',
        jakkaNo: 'Jakka No. 76',
        status: 'Returned'
      )
    );
  
    return history;
  }
}