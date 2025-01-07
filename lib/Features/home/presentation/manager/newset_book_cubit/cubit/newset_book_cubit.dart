import 'package:bloc/bloc.dart';
import 'package:clean_arch_bookly_pp/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/book_entity.dart';

part 'newset_book_state.dart';

class NewsetBookCubit extends Cubit<NewsetBookState> {
  NewsetBookCubit(this.fetchNewestdBooksUseCase) : super(NewsetBookInitial());
  final FetchNewestdBooksUseCase fetchNewestdBooksUseCase;
  Future <void>fetchNewestBooks()async{
    emit(NewsetBookLoading());
    var result= await fetchNewestdBooksUseCase.call();
    result.fold((failure) {
      emit(NewsetBookFailure(errMassage: failure.message));
    }, (books) {
      emit(NewsetBookSucess(books: books));
    });
  }
}
