import 'package:cms/bloc_cubits/admin_home_cubit/admin_home_state.dart';
import 'package:cms/models/count_model.dart';
import 'package:cms/repository/admin_home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit(this._adminHomeRepository) : super(AdminInitial());

  AdminHomeRepository _adminHomeRepository;

  showCount(token) {
    emit(AdminLoading());
    _adminHomeRepository.fetchCountData(token).then((value) {
      CountResp countResp = CountResp.fromJson(value);
      List<Data> countData = List<Data>.from(countResp.data!);
      if (countResp != null && countResp.success == 0) {
        emit(AdminError(errorMessage: 'data not found'));
      } else {
        emit(AdminSuccess(message: "data found", countData: countData));
      }
    });
  }
}
