part of 'featured_book_cubit.dart';

@immutable
sealed class FeaturedBookState {}

final class FeaturedBookInitial extends FeaturedBookState {}
final class FeaturedBookLoading extends FeaturedBookState {}
final class FeaturedBookSucess extends FeaturedBookState {
  final List<BookEntity>books;

  FeaturedBookSucess({required this.books});

}
final class FeaturedBookFailure extends FeaturedBookState {
  final String errMassage;

  FeaturedBookFailure({required this.errMassage});

}
