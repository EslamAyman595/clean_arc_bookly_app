import 'package:clean_arch_bookly_pp/Features/home/domain/entities/book_entity.dart';

 abstract class HomeLocalDataSource {
  List<BookEntity>fetchFeaturedBooks();
  List<BookEntity>fetchNewestBooks();
  
}
class HomeLocaDataSourceImpl extends HomeLocalDataSource{
  @override
  List<BookEntity> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }

}