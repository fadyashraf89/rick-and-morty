class MyCharacters {
   int? id;
   String name;
   String status;
   String species;
   String gender;
   String image;
   String type;
   String originName;
   String locationName;

   MyCharacters({
      this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.gender,
      required this.image,
      required this.type,
      required this.originName,
      required this.locationName,
   });

   factory MyCharacters.fromJson(Map<String, dynamic> json) {
      return MyCharacters(
         id: int.tryParse(json['id'].toString()), // Handle potential parsing errors
         name: json['name'] ?? '', // Provide default value if null
         status: json['status'] ?? '',
         species: json['species'] ?? '',
         gender: json['gender'] ?? '',
         image: json['image'] ?? '',
         type: json['type'] ?? '',
         originName: json['origin']['name'] ?? '',
         locationName: json['location']['name'] ?? '',
      );
   }
}