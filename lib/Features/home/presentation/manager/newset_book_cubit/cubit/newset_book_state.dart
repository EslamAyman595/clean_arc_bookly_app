part of 'newset_book_cubit.dart';

@immutable
sealed class NewsetBookState {}

final class NewsetBookInitial extends NewsetBookState {}
final class NewsetBookLoading extends NewsetBookState {}
final class NewsetBookSucess extends NewsetBookState {
  final List<BookEntity> books;

  NewsetBookSucess({required this.books});
}
final class NewsetBookFailure extends NewsetBookState {
  final String errMassage;

  NewsetBookFailure({required this.errMassage});

}
