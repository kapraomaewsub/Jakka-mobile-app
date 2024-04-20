import 'package:flutter/material.dart';
import 'package:jakka_app/helper/helper_functions.dart';

class Settingpage extends StatefulWidget {
  const Settingpage({super.key});

  @override
  State<Settingpage> createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {
  bool notificationValue = false;
  bool isThaiSelected = false;
  bool isEnglishSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: displayAppBar('Setting'),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Notification', style: TextStyle(fontSize: 16)),
                Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    value: notificationValue,
                    onChanged: (newValue) {
                      setState(() {
                        notificationValue = newValue;
                      });
                    },
                    activeColor: Colors.grey,
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: Colors.grey.withOpacity(0.5),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                )
              ],
            ),
            const Text('Language', style: TextStyle(fontSize: 16)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Thai', style: TextStyle(fontSize: 16)),
                Checkbox(
                  value: isThaiSelected,
                  onChanged: (newValue) {
                    setState(() {
                      isThaiSelected = newValue ?? false;
                      if (isThaiSelected) {
                        isEnglishSelected = false;
                      }
                    });
                  },
                  checkColor: Colors.black,
                  fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.selected)) {
                      return Colors.transparent;
                    }
                    return Colors.transparent;
                  }),
                  side: BorderSide.none,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('English', style: TextStyle(fontSize: 16)),
                Checkbox(
                  value: isEnglishSelected,
                  onChanged: (newValue) {
                    setState(() {
                      isEnglishSelected = newValue ?? false;
                      if (isEnglishSelected) {
                        isThaiSelected = false;
                      }
                    });
                  },
                  checkColor: Colors.black,
                  fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.selected)) {
                      return Colors.transparent;
                    }
                    return Colors.transparent;
                  }),
                  side: BorderSide.none,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
