import 'package:bloc/bloc.dart';
import 'package:clean_arch_bookly_pp/Features/home/data/repos/hom_repo_Impl.dart';
import 'package:clean_arch_bookly_pp/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_pp/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:meta/meta.dart';

part 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit(this.featuredBooksUseCase) : super(FeaturedBookInitial());
  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future<void>fetchFeaturedBooks()async{
    emit(FeaturedBookLoading());

var result=await featuredBooksUseCase.call();
result.fold((failure) {
  emit(FeaturedBookFailure(errMassage: failure.message));
}, (books) {
  emit(FeaturedBookSucess(books: books));
});
  }
}
