import 'package:flutter/material.dart';


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
      appBar: settingAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Notification', style: TextStyle(fontSize: 16)),
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
            Text('Language', style: TextStyle(fontSize: 16)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Thai', style: TextStyle(fontSize: 16)),
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
                    return Colors
                        .transparent;
                  }),
                  side: BorderSide.none,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('English', style: TextStyle(fontSize: 16)),
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
                    return Colors
                        .transparent;
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

  AppBar settingAppBar() {
    return AppBar(
      title: const Text(
        'Setting',
        style: TextStyle(
          color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold
        ),
      ),
      toolbarHeight: 60,
      backgroundColor: Color.fromRGBO(34, 72, 158, 1),
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25), 
          bottomRight: Radius.circular(25),
        ),
      ),
    );
  }
}