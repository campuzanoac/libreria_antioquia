sealed class RootRouterPresenterOutput {}

final class ShowBookDetail extends RootRouterPresenterOutput {
  final String isbn;

  ShowBookDetail(this.isbn);
}

final class ShowPop extends RootRouterPresenterOutput {}
