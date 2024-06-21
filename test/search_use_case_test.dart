import 'package:flutter_test/flutter_test.dart';
import 'package:bookstore/modules/features/search/use_case/search_use_case.dart';
import 'package:bookstore/modules/features/search/use_case/search_use_case_output.dart';
import 'package:bookstore/modules/features/search/use_case/search_presentation_model.dart';
import 'package:bookstore/modules/features/search/use_case/new_releases_presentation_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  final searchUseCase = SearchUseCase();

  final stream = searchUseCase.stream.asBroadcastStream();
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await SharedPreferences.getInstance();
  });

  test('emit loading and newReleases when initializing', () async {
    expectLater(
        stream,
        emitsInOrder([
          isA<PresentLoading>(),
          isA<PresentNewReleases>().having(
              (x) => x.newReleasesPresentationModel.rows,
              'list of presentationrowmodels',
              isA<List<NewReleasePresentationRowModel>>()),
        ]));
    await pumpEventQueue();
  });

  test('emit loading and model after search is tapped', () async {
    expectLater(
        stream,
        emitsInOrder([
          isA<PresentLoading>(),
          isA<PresentModel>().having(
              (x) => x.searchPresentationModel.rows,
              'list of presentationrowmodels',
              isA<List<SearchPresentationRowModel>>()),
        ]));
    await searchUseCase.eventSearchTapped('test');
    await pumpEventQueue();
  });

  test('emit showBookDetail when card is tapped', () async {
    expectLater(
      stream,
      emitsInOrder([
        isA<PresentBookDetail>(),
      ]),
    );

    searchUseCase.eventBookCardTapped(1);
    await pumpEventQueue();
  });
}
