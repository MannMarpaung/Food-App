import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app/model/models.dart';
import 'package:food_app/service/services.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  Future<void> getTransactions() async {
    ApiReturnValue<List<Transaction>> result =
        await TransactionService.getTransaction();

    if (result.value != null) {
      emit(TransactionLoaded(result.value!));
    } else {
      emit(TransactionLoadingFailed(result.message!));
    }
  }

  Future<String?> submitTransaction(Transaction transaction) async {
    ApiReturnValue<Transaction> result =
        await TransactionService.submitTransaction(transaction);

    if (result.value != null) {
      emit(TransactionLoaded(
        (state as TransactionLoaded).transaction + [result.value!],
      ));
      print(result.value);
      return result.value!.paymentURL;
    } else {
      print("result = null");
      return null;
    }
  }
}
