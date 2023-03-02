import 'package:cip/src/repository/cip_repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/iss_data_model.dart';

class CIPBloc {
  final CIPRepository _cipRepository = CIPRepository();
  final BehaviorSubject<ISSDataModel> _subject = BehaviorSubject<ISSDataModel>();

  getCipData() async {
    ISSDataModel response = await _cipRepository.getISSDataModel();
    _subject.sink.add(response);
  }

  BehaviorSubject<ISSDataModel> get subject => _subject;

  void dispose(){
    _subject.done;
  }
}

final getCIPBloc = CIPBloc();