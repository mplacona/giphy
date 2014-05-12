import 'package:unittest/unittest.dart';
import 'package:giphy/giphy.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

void main() {
    print("Giphy API implementation Tests!");
    var key = "dc6zaTOxFJmzC";

    group('Object Setup :: ', () {
        test("New instance of Giphy is created", () {
            var giphy = new Giphy(key);
            expect(giphy is Giphy, isTrue);
        });
    });

    group('Endpoint => ', () {

        Giphy giphy;
        Future<http.Response> future;

        setUp(() {
            giphy = new Giphy(key);
        });

        group('Search :: ', () {
            test("Returns success <<200>>", () {
                future = giphy.search('query');
                expect(future.then((value) => value.statusCode), completion(equals(200)));
            });


            test("Returns valid JSON", () {
                var response = {
                    "data": [],
                    "pagination": {
                        "total_count": 0,
                        "count": 0,
                        "offset": 0
                    },
                    "meta": {
                        "status": 200,
                        "msg": "OK"
                    }
                };
                future = giphy.search('somethingthatitwillneverfind');
                expect(future.then((value) => value.body), completion(equals(JSON.encode(response))));
            });

            test("Returns failure <<403>>", () {
                giphy = new Giphy("1234567890");
                future = giphy.search('query');
                expect(future.then((value) => value.statusCode), completion(equals(403)));
            });
        });

        group('Translate :: ', () {
            test("Returns success <<200>>", () {
                future = giphy.translate('query');
                expect(future.then((value) => value.statusCode), completion(equals(200)));
            });

            test("Returns valid JSON", () {
                var response = {
                    "data": [],
                    "meta": {
                        "status": 200,
                        "msg": "OK"
                    }
                };
                future = giphy.translate('something that it will never find 0909090');
                expect(future.then((value) => value.body), completion(equals(JSON.encode(response))));
            });

            test("Returns failure <<403>>", () {
                giphy = new Giphy("1234567890");
                future = giphy.search('query');
                expect(future.then((value) => value.statusCode), completion(equals(403)));
            });
        });

        group('Random :: ', () {
            test("Returns success <<200>>", () {
                future = giphy.random('caturday');
                expect(future.then((value) => value.statusCode), completion(equals(200)));
            });


            test("Returns valid JSON", () {
                var response = {
                    "data": [],
                    "meta": {
                        "status": 200,
                        "msg": "OK"
                    }
                };
                future = giphy.random('somethingthatitwillneverfind');
                expect(future.then((value) => value.body), completion(equals(JSON.encode(response))));
            });

            test("Returns failure <<403>>", () {
                giphy = new Giphy("1234567890");
                future = giphy.random('caturday');
                expect(future.then((value) => value.statusCode), completion(equals(403)));
            });

        });

        group('Trending :: ', () {
            test("Returns success <<200>>", () {
                future = giphy.trending();
                expect(future.then((value) => value.statusCode), completion(equals(200)));
            });

            test("Returns failure <<403>>", () {
                giphy = new Giphy("1234567890");
                future = giphy.trending();
                expect(future.then((value) => value.statusCode), completion(equals(403)));
            });
        });
    });

}
