class ReportModel{
  String date;
  String jakkaNo;
  String status;

  ReportModel(
    {required this.date, required this.jakkaNo, required this.status}
  );

  static List<ReportModel> getReport() {
    List<ReportModel> report = [];
    report.add(ReportModel(
        date: '13/03/2024 20:02',
        jakkaNo: 'Jakka No. 102',
        status: 'Accepted'
      )
    );

    report.add(ReportModel(
        date: '12/03/2024 18:55',
        jakkaNo: 'Jakka No. 19',
        status: 'Under Repair'
      )
    );

    report.add(ReportModel(
        date: '7/03/2024 15:23',
        jakkaNo: 'Jakka No. 76',
        status: 'Fixed'
      )
    );
  
    return report;
  }
}