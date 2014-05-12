import 'package:unittest/unittest.dart';
import 'package:giphy/giphy.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'fixtures.dart';

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
            test("Returns valid JSON", () {
                future = giphy.search('somethingthatitwillneverfind');
                expect(future.then((value) => value), completion(equals(JSON.encode(successfull_response_paginated))));
            });

            test("Returns failure <<400>>", () {
                giphy = new Giphy("1234567890");
                future = giphy.search('query');
                expect(future.then((value) => value), completion(equals(JSON.encode(forbidden_response))));
            });
        });

        group('Translate :: ', () {
            test("Returns valid JSON", () {
                future = giphy.translate('something that it will never find 0909090');
                expect(future.then((value) => value), completion(equals(JSON.encode(successful_response))));
            });

            test("Returns failure <<400>>", () {
                giphy = new Giphy("1234567890");
                future = giphy.search('query');
                expect(future.then((value) => value), completion(equals(JSON.encode(forbidden_response))));
            });
        });

        group('Random :: ', () {
            test("Returns valid JSON", () {
                future = giphy.random('somethingthatitwillneverfind');
                expect(future.then((value) => value), completion(equals(JSON.encode(successful_response))));
            });

            test("Returns failure <<400>>", () {
                giphy = new Giphy("1234567890");
                future = giphy.random('caturday');
                expect(future.then((value) => value), completion(equals(JSON.encode(forbidden_response))));
            });

        });

        group('Trending :: ', () {
            test("Returns failure <<400>>", () {
                giphy = new Giphy("1234567890");
                future = giphy.trending();
                expect(future.then((value) => value), completion(equals(JSON.encode(forbidden_response))));
            });
        });
    });

}
