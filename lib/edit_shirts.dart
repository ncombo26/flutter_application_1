import 'package:flutter/material.dart';
import 'main.dart';

class EditShirts extends StatefulWidget{
  const EditShirts({super.key});

  @override
  State<EditShirts> createState() => EditShirts_state();
}

class EditShirts_state extends State<EditShirts>{
  void remove(int index){
    setState((){
      shirt_list.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Shirts"),),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: shirt_list.length,
            itemBuilder: (context, index){
              return ListTile(
                leading: const Icon(Icons.remove),
                title: (Text(shirt_list[index])),
                onTap: (){remove(index);}
              );
            },
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextField(
              controller: TextEditingController(),
              decoration: (const InputDecoration(hintText: "Add a shirt: ")),
              onSubmitted: (shirt){
                setState(() {
                  shirt_list.add(shirt);
                });
              }
            ),
            ),
        ],
      ),
      
    );
  }
}

