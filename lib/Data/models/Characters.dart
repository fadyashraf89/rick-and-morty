class Characters{
   int? id;
   String? name, status, species,gender,image, type, OriginName, LocationName;
   Characters(
      {this.id,
      this.name,
      this.status,
      this.species,
      this.gender,
      this.image,
      this.type,
      this.OriginName,
      this.LocationName});

   factory Characters.fromJson(Map<String, dynamic> json){
     return Characters(
       id: json["results"]["id"],
       name: json["results"]["name"],
       status: json["results"]["status"],
       species: json["results"]["species"],
       type: json["results"]["type"],
       gender: json["results"]["gender"],
       image: json["results"]["image"],
       OriginName: json["results"]["origin"]["name"],
       LocationName: json["results"]["location"]["name"]
     );
   }


}
