import 'dart:math';

import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.shade200,
        child: Center(
          child: ElevatedButton(
              child: const Text('Click for Notification'),
              onPressed: () {
                notify();
              }),
        ),
      ),
    );
  }

  Future<void> notify() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: createuniqueid(),
          channelKey: 'Strix',
          title: 'new notitification',
          body: 'Find products'),
    );
  }
  createuniqueid(){
    return DateTime.now().millisecondsSinceEpoch.remainder(1000);
  }
}
