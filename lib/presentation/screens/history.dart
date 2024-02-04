import 'package:flutter/material.dart';
import 'package:pet_adoption_app/presentation/utils/data.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Filter adopted pets
    List<Map<String, dynamic>> adoptedPets = pets.where((pet) {
      return pet["isAdopted"] == true;
    }).toList();

    // Sort adopted pets by adoption date (assuming you have a "dateAdopted" field)
    adoptedPets.sort((a, b) {
      DateTime dateA = DateTime.parse(a["dateAdopted"]);
      DateTime dateB = DateTime.parse(b["dateAdopted"]);
      return dateB.compareTo(dateA);
    });

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Adopted Pets',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: adoptedPets.length,
        itemBuilder: (context, index) {
          var pet = adoptedPets[index];
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  pet["name"],
                  style: TextStyle(color: Colors.red[400]),
                ),
                subtitle: Text(pet["dateAdopted"],
                    style: TextStyle(
                        color: Colors.blueGrey[
                            400])), // Replace with the actual date field
                // You can add more details or customize the ListTile as needed
              ),
            ),
          );
        },
      ),
    );
  }
}
