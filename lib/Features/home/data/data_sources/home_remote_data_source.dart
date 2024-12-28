import 'package:clean_arch_bookly_pp/Features/home/data/models/boo_k_model/boo_k_model.dart';
import 'package:clean_arch_bookly_pp/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_pp/constants.dart';
import 'package:clean_arch_bookly_pp/core/utils/dio_helper.dart';
import 'package:clean_arch_bookly_pp/core/utils/end_points.dart';
import 'package:clean_arch_bookly_pp/core/utils/functions/save_books.dart';
import 'package:dio/src/response.dart';
import 'package:hive/hive.dart';

abstract class HomeRemoteDataSource{
   Future< List<BookEntity>> fetchFeaturedBooks();
  Future< List<BookEntity>> fetchNewestBooks();
}
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource{
  @override
  Future<List<BookEntity>> fetchFeaturedBooks()async {
  var data=  await DioHelper.getData(url: featuredBooks);
    List<BookEntity> books = gitBooksList(data);
    saveBooksData(books,kFeaturedBox);//cache featured books
    return books;
  }

 

  

  @override
  Future<List<BookEntity>> fetchNewestBooks()async {
    var data=  await DioHelper.getData(url: NewestBooks);
    List<BookEntity> books = gitBooksList(data);
    saveBooksData(books, kNewestBox);
    return books;
  }
List<BookEntity> gitBooksList(Response<dynamic> data) {
    List<BookEntity>books=[];
    for (var bookMap in data.data['items']) {
      books.add(BooKModel.fromJson(bookMap));
      
    }
    return books;
  }
}