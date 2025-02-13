import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'bottom_nev.dart';

class HomeScreen extends StatelessWidget {
  final CollectionReference products =
      FirebaseFirestore.instance.collection("products");
  final CollectionReference shoes =
      FirebaseFirestore.instance.collection("shoes");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     bottomNavigationBar: bottomNev(),
     backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: products.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "PINTU",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      radius: 20,
                    ),
                  ),
                  // item(streamSnapshot),

                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              size: 35,
                            ),
                            label: Text(
                              "Search shoes...",
                              style: TextStyle(color: Colors.grey.shade500),
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            5,
                            (index) => Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  width: 450,
                                  height: 150,
                                  // child: Image(
                                  //   image: AssetImage("assets/images/nikead.jpg"),
                                  //   fit: BoxFit.cover,
                                  // ),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/nikead.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                )),
                          ),
                        )),
                  ),

                  SizedBox(
                    height: 15,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "All",
                          style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text("Men", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 15,
                        ),
                        Text("Women", style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 15,
                        ),
                        Text("Kids", style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 15,
                        ),
                        Text("Gifts", style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  item(streamSnapshot)
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

item(AsyncSnapshot<QuerySnapshot> streamSnapshot) {

  return Expanded(
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemCount: streamSnapshot.data!.docs.length,
      itemBuilder: (context, index) {
        final DocumentSnapshot documentSnapshot =
            streamSnapshot.data!.docs[index];

        return Card(
          color: Colors.white,
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10)),
                  child: Transform.rotate(
                    angle: -20 * (3.141592653589793 / 180),
                    child: Image.network(
                      documentSnapshot['image'],
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                          Icons.broken_image,
                          size: 50,
                          color: Colors.grey),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      documentSnapshot['title'],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      documentSnapshot['description'],
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 5),
                    Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(
                          "\$${documentSnapshot['price']}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black,),



                        ),


                        Text(
                          "\$${documentSnapshot['discountPrice']}",
                          style: const TextStyle(
                             color: Colors.grey,decoration: TextDecoration.lineThrough, // Adds strikethrough effect
                            decorationColor: Colors.grey, // Optional: Changes the line color
                            decorationThickness: 2,),



                        ),
                      ],
                    )

                  ],
                ),
              ),
            ],
          ),
        );
      },
      padding: const EdgeInsets.all(10),
    ),
  );
}

//
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class HomeScreen extends StatelessWidget {
//   final CollectionReference users = FirebaseFirestore.instance.collection(
//     "products",
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Home Screen"),
//         centerTitle: true,
//       ),
//       body: StreamBuilder(
//
//         stream: users.snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
//           if (streamSnapshot.hasData) {
//             return ListView.builder(
//               itemCount: streamSnapshot.data!.docs.length,
//               itemBuilder: (context, index) {
//                 final DocumentSnapshot documentSnapshot =
//                 streamSnapshot.data!.docs[index];
//                 return ListTile(
//                   title: Text(documentSnapshot['description']),
//                   subtitle: Text(documentSnapshot['title']),
//                   leading: CircleAvatar(child: Image.network(documentSnapshot['image']),),
//                   trailing: Text(documentSnapshot['price'].toString()
//                   ),
//                 );
//               },
//             );
//           }
//           return const Center(
//
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),
//     );
//   }
// }
