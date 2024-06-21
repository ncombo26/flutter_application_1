import 'package:flutter/material.dart';
import 'main.dart';

class EditPants extends StatefulWidget{
  const EditPants({super.key});

  @override
  State<EditPants> createState() => EditPantsState();
}

class EditPantsState extends State<EditPants>{
  void remove(int index){
    setState((){
      pant_list.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Pants")),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: pant_list.length,
            itemBuilder: (context, index){
              return ListTile(
                leading: const Icon(Icons.remove),
                title: Text(pant_list[index]),
                onTap: (){remove(index);}
              );
            }
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextField(
                controller: TextEditingController(),
                decoration: const InputDecoration(hintText: "Add Pants: "),
                onSubmitted: (pants){
                  setState(() {
                    pant_list.add(pants);
                  });
                },
              )
            )
        ]
      )
    );
  }
}