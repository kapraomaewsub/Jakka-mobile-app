class NotificationModel{
  String topic;
  String? jakkaNo;
  String date;
  

  NotificationModel(
    {required this.topic, this.jakkaNo, required this.date,}
  );

  static List<NotificationModel> getNotification() {
    List<NotificationModel> notification = [];
    notification.add(NotificationModel(
        topic: 'อย่าลืมคืนจักรยาน!!',
        jakkaNo: 'Jakka No. 102',
        date: '13/03/2024 20:02',
      )
    );

    notification.add(NotificationModel(
        topic: 'Accepted',
        jakkaNo: 'Jakka No. 102',
        date: '13/03/2024 20:02',
      )
    );

    notification.add(NotificationModel(
        topic: 'Accepted',
        date: '13/03/2024 20:02',
      )
    );
  
    return notification;
  }
}