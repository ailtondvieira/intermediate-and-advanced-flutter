class HomeRepository {
  Future<List<String>> getAllNames() async {
    await Future.delayed(const Duration(seconds: 5));
    return ['Ailton', 'Teste1', 'Teste2', 'Teste3'];
  }

  Stream<int> timedCounter(Duration interval, int maxCount) async* {
    int index = 0;
    while (true) {
      await Future.delayed(interval);
      yield index++;
      if (index == maxCount) {
        break;
      }
    }
  }
}
