import 'package:flutter/material.dart';
import 'package:note_app/Pages/editeNoteBody.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return editeNoteBody();
              },
            ),
          );
        },
        child: Container(
          // height: 150,
          padding:const EdgeInsets.only(
            top: 24,
            left: 24,
            bottom: 24,
          ),
          decoration: BoxDecoration(
            color:const Color(0xffFFCD7B),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title:const Text(
                  'Flutter tips',
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    'Builde Flutter With => " Fahd Mahmoud "',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon:const Icon(
                      Icons.delete,
                      color: Colors.black,
                      size: 35,
                    )),
              ),
              Padding(
                padding:const EdgeInsets.only(right: 24),
                child: Text(
                  'data',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.2), fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
