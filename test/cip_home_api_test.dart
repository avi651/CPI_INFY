import 'package:flutter_test/flutter_test.dart';
import 'package:nock/nock.dart';
import 'package:http/http.dart' as http;

void main() {
  setUpAll(() {
    nock.init();
  });

  setUp(() {
    nock.cleanAll();
  });

  test('CIP Home API Test', () async {
    final interceptor = nock('http://api.open-notify.org').get('/iss-now.json')
      ..reply(
        200,
        'timestamp',
      );

    final response = await http.get(Uri.parse('http://api.open-notify.org/iss-now.json'));
    expect(interceptor.isDone, true);
    expect(response.statusCode, 200);
    expect(response.body, 'timestamp');
  });
}
