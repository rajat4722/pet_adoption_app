import 'package:flutter/material.dart';
import 'package:pet_adoption_app/presentation/screens/details.dart';
// import 'package:pet_adoption_app/presentation/screens/adopted_pets_screen.dart';  // Import AdoptedPetsScreen
import 'package:pet_adoption_app/presentation/utils/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> displayedPets = List.from(pets);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Find your\nfavorite pet",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          offset: const Offset(00, 00),
                          blurRadius: 40,
                          spreadRadius: 0,
                          color: Colors.grey.withOpacity(.25)),
                    ]),
                    child: const CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.black26,
                      child: Icon(
                        Icons.pets_rounded,
                        size: 25,
                        color: Color(0xff53E88B),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      offset: const Offset(12, 26),
                      blurRadius: 50,
                      spreadRadius: 0,
                      color: Colors.grey.withOpacity(.1)),
                ]),
                child: TextField(
                  onChanged: (value) {
                    // Filter the pets based on the search input
                    setState(() {
                      displayedPets = pets
                          .where((pet) => pet["name"]
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                    });
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xff4338CA),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Divider(),
              const SizedBox(height: 5),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: displayedPets.length,
                itemBuilder: (BuildContext context, int index) {
                  var pet = displayedPets[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            petDetails: pet,
                            onAdoptStatusChanged:
                                (bool isAdopted, String dateAdopted) {
                              setState(() {
                                pet["isAdopted"] = isAdopted;
                                pet["dateAdopted"] = dateAdopted;
                              });
                            },
                          ),
                        ),
                      );
                    },
                    child: Card(
                      color: pet["isAdopted"] ?? false
                          ? Colors.grey[400]
                          : Colors.grey[900],
                      borderOnForeground: true,
                      child: Row(
                        children: <Widget>[
                          Row(
                            children: [
                              Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Hero(
                                    tag: pet["image"],
                                    child: Image.network(
                                      pet["image"],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  pet["name"],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      pet["rate"].toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.grey,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      pet["location"],
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                pet["is_favorited"] = !pet["is_favorited"];
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: pet["is_favorited"]
                                    ? Colors.red
                                    : Colors.black,
                              ),
                              child: Icon(
                                pet["is_favorited"]
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: pet["is_favorited"]
                                    ? Colors.white
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(height: 2, color: Colors.transparent),
              )
            ],
          ),
        ),
      ),
    );
  }
}
