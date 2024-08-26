import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String? id;
  final String? typeName;
  final String? collectionName;
  final String? categoryName;
  //final String? imageURL;
  //bool? isCheked;

  const CategoryEntity({
    this.id,
    this.typeName,
    this.collectionName,
    this.categoryName,
    //this.imageURL,
    //this.isCheked,
  });

  @override
  List<Object?> get props => [
        id,
        typeName,
        collectionName,
        categoryName,
        //imageURL,
        //isCheked,
      ];
}
