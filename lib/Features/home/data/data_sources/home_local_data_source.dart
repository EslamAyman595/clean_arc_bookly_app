import 'package:clean_arch_bookly_pp/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_pp/constants.dart';
import 'package:hive/hive.dart';

 abstract class HomeLocalDataSource {
  List<BookEntity>fetchFeaturedBooks();
  List<BookEntity>fetchNewestBooks();
  
}
class HomeLocaDataSourceImpl extends HomeLocalDataSource{
  @override
  List<BookEntity> fetchFeaturedBooks() {
var box= Hive.box<BookEntity>(kFeaturedBox);
return box.values.toList();//لية عملت tolist لانها جاية iterable لازم احولها لى list 
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box= Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }

}