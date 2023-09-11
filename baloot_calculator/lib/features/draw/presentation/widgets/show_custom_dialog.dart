import 'package:flutter/material.dart';

showCustomDialog({required BuildContext context, required List<String> names}) {
  if (names.length < 4) {
    return ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.redAccent,
        content: Center(
          child: Text(
            "لازم تضيف 4 أسماء على الأقل",
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  } else {
    Set<String> itemSet = names.toSet();
    List<String> itemListFromSet = itemSet.toList();
    itemListFromSet.shuffle();
    List<String> randomItems = itemListFromSet.take(4).toList();

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                randomItems[0],
                style: const TextStyle(fontSize: 25),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      randomItems[1],
                      style: const TextStyle(fontSize: 25),
                    ),
                    Text(
                      randomItems[2],
                      style: const TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ),
              Text(
                randomItems[3],
                style: const TextStyle(fontSize: 25),
              ),
              const Divider(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'إغلاق',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
