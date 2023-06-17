import 'package:flutter/foundation.dart';
import 'package:complainz/model/GetComplaintCategoryModel.dart';

import '../model/api/get_complaint_category_api.dart';

class GetComplaintCategoryViewModel extends ChangeNotifier {
  GetComplaintCategoryModel? _complaintCategory;
  String _errorMessage = '';
  bool _isLoading = false;

  GetComplaintCategoryModel? get complaintCategory => _complaintCategory;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  Future<void> getResultCompaintCategory() async {
    try {
      _isLoading = true;
      notifyListeners();

      GetComplaintCategoryApi api = GetComplaintCategoryApi();
      _complaintCategory = await api.getComplaintCategory();

      _isLoading = false;
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      _errorMessage = error.toString();
      notifyListeners();
    }
  }
}
