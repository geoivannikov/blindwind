abstract class BaseUseCase<Repository, Argument, Result> {
  final Repository repository;
  BaseUseCase(this.repository);

  Future<Result> createRequest([Argument arg]);
}

abstract class BaseUseCaseAsStream<Repository, Argument, Result> {
  final Repository repository;
  BaseUseCaseAsStream(this.repository);

  Stream<Result> createRequest([Argument arg]);
}
