class GetAllVehiclesEntity {
  GetAllVehiclesEntity({
      this.message, 
      this.metadata, 
      this.vehicles,});


  String? message;
  Metadata? metadata;
  List<Vehicles>? vehicles;



}



class Vehicles {
  Vehicles({
      this.id, 
      this.type, 
      this.image, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  String? id;
  String? type;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? v;


}



class Metadata {
  Metadata({
      this.currentPage, 
      this.numberOfPages, 
      this.limit,});


  int? currentPage;
  int? numberOfPages;
  int? limit;



}