import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LearnProvider extends ChangeNotifier {

  String? OriginalName;
  String? OriginalPhone;

  String? get DummyName => OriginalName;
  String? get DummyPhone => OriginalPhone;

  void updateName(String? newName) {
    if (newName != null && newName != OriginalName) {
      OriginalName = newName;
      notifyListeners();
    }
  }

  void updatePhone(String? newPhone) {
    if (newPhone != null && newPhone != OriginalPhone) {
      OriginalPhone = newPhone;
      notifyListeners();
    }
  }
}



class ProviderDetails extends StatefulWidget {
  const ProviderDetails({super.key});

  @override
  State<ProviderDetails> createState() => _ProviderDetailsState();
}

class _ProviderDetailsState extends State<ProviderDetails> {
  @override
  Widget build(BuildContext context) {

    final enterName = Provider.of<LearnProvider>(context);
    return Scaffold(
      backgroundColor: Colors.red,
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white)
                ),
                child: Center(child: Text('${enterName.DummyName}'))),
            SizedBox(
              height: 30,
            ),
            Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white)
                ),
                child: Center(child: Text('${enterName.DummyPhone}'))),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProviderDetails()));
            }, child: Text("Edit"))
          ],
        ),
      ),
    );
  }
}


//
// class EditProviderDetails extends StatefulWidget {
//   const EditProviderDetails({super.key});
//
//   @override
//   State<EditProviderDetails> createState() => _EditProviderDetailsState();
// }
//
// class _EditProviderDetailsState extends State<EditProviderDetails> {
//
//   TextEditingController namecont = TextEditingController();
//   TextEditingController Phonecont = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Padding(
//         padding: const EdgeInsets.all(28.0),
//         child: Column(
//           children: [
//             TextFormField(controller: namecont,),
//             SizedBox(
//               height: 30,
//             ),
//             TextFormField(controller: Phonecont,),
//             SizedBox(
//               height: 30,
//             ),
//             ElevatedButton(onPressed: (){
//               Provider.of<LearnProvider>(context, listen: false).updateName(
//                   namecont.text);
//               Provider.of<LearnProvider>(context, listen: false).updatePhone(
//                   Phonecont.text);
//               Navigator.push(context, MaterialPageRoute(builder: (context)
//               => ProviderDetails()));
//             }, child: Text("Save")),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
class EditProviderDetails extends StatefulWidget {
  const EditProviderDetails({super.key});

  @override
  State<EditProviderDetails> createState() => _EditProviderDetailsState();
}

class _EditProviderDetailsState extends State<EditProviderDetails> {
  TextEditingController namecont = TextEditingController();
  TextEditingController Phonecont = TextEditingController();

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<LearnProvider>(context, listen: false);
    namecont.text = provider.DummyName ?? '';
    Phonecont.text = provider.DummyPhone ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            TextFormField(
              controller: namecont,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 30),
            TextFormField(
              controller: Phonecont,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Provider.of<LearnProvider>(context, listen: false).updateName(namecont.text);
                Provider.of<LearnProvider>(context, listen: false).updatePhone(Phonecont.text);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProviderDetails()));
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}



// class EntryModel with ChangeNotifier {
//   String name;
//   String phone;
//   String service;
//   String status;
//   String review;
//
//   EntryModel({
//     this.name = '',
//     this.phone = '',
//     this.service = '',
//     this.status = '',
//     this.review = '',
//   });
//
//   // Update the model when new data is provided
//   void updateEntry({
//     required String newName,
//     required String newPhone,
//     required String newService,
//     required String newStatus,
//     required String newReview,
//   }) {
//     name = newName;
//     phone = newPhone;
//     service = newService;
//     status = newStatus;
//     review = newReview;
//     notifyListeners(); // Notifies listeners of state change
//   }
// }
