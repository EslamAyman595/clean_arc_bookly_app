import 'package:clean_arch_bookly_pp/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:clean_arch_bookly_pp/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:clean_arch_bookly_pp/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_pp/Features/home/domain/repos/home_repo.dart';
import 'package:clean_arch_bookly_pp/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo{
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource, required this.homeLocalDataSource});
  
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks()async {
    try {
  var booksList = homeLocalDataSource.fetchFeaturedBooks();
  if(booksList.isNotEmpty){
    return right(booksList);
  }
  var books= await homeRemoteDataSource.fetchFeaturedBooks();
  return right(books);
}  catch (e) {
  if(e is DioException){
    return(left(ServerFailure.fromDiorError(e)));
  }else{
    return left(ServerFailure(e.toString()));
  }
}
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async{
     try {
      List<BookEntity>books;
   books = homeLocalDataSource.fetchNewestBooks();
  if(books.isNotEmpty){
    return right(books);
  }
   books= await homeRemoteDataSource.fetchNewestBooks();
  return right(books);
}  catch (e) {
  if(e is DioException){
    return(left(ServerFailure.fromDiorError(e)));
  }else{
    return left(ServerFailure(e.toString()));
  }
}
  }

}