import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<String> selectedOptions = [];
List<String> options = [
  "One",
  "Two",
  "Three",
  "Four",
  "Five",
  "Six",
  "Seven",
  "Eight",
  "Nine",
  "Ten"
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dynamic Link")),
      body: Column(
        children: [
          const Center(
              child: Text(
            "Please Select an option",
            style: TextStyle(fontSize: 16),
          )),
          Expanded(
            child: ListView(
              children: options
                  .map((option) => CheckboxListTile(
                        title: Text(option),
                        value: selectedOptions.contains(option),
                        onChanged: (value) {
                          setState(() {
                            if (value!) {
                              selectedOptions.add(option);
                            } else {
                              selectedOptions.remove(option);
                            }
                          });
                        },
                      ))
                  .toList(),
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                final selectedQuery = selectedOptions.map((e) {
                  return Uri.encodeQueryComponent(e);
                }).join("&");

                final dynamicLink = "link/?selected_options=$selectedQuery";

                print(dynamicLink);

                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Genarated Link"),
                        content: Container(
                            color: Color.fromARGB(255, 223, 223, 223),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(dynamicLink),
                            )),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Close"),
                          ),
                        ],
                      );
                    });
              },
              child: const Text("Genarate"))
        ],
      ),
    );
  }
}
