import 'package:reiverpodtest_app/model/model.dart';
import 'package:reiverpodtest_app/services/fetch_api.dart';
import 'package:flutter_riverpod/all.dart';

final photostateFuture = FutureProvider<List<PhotoModel>>((ref) async {
  return fetchPhotos();
});
