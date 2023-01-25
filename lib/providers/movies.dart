import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constant/api.dart';
import '../models/movie.dart';

class Movies with ChangeNotifier {
  // the now playing listdata
  List<Movie> _nowPlaying = [];
  List<Movie> get nowPlaying {
    return [..._nowPlaying];
  }
  //*

  // the up coming movie  listdata
  final List<Movie> _upComing = [];
  List<Movie> get upComing {
    return [..._upComing];
  }
  //*

  // the up coming movie  listdata
  final List<Movie> _topRated = [];
  List<Movie> get topRated {
    return [..._topRated];
  }

  Movie? _movie;

  Movie get movie {
    return _movie!;
  }

  String? _videoKey;

  String get videoKey {
    return _videoKey!;
  }

  //*
  // the up coming movie  listdata
  final List<Movie> _popular = [];
  List<Movie> get popular {
    return [..._popular];
  }
  //*

  Future<void> getNowPlaying() async {
    final url = Uri.parse(MyApi.nowPlaying);
    final response = await http.get(url);
    List<Movie> loadedData = [];
    if (response.statusCode == 200) {
      for (var element in List<Movie>.from(
        (json.decode(response.body)['results'] as List<dynamic>).map(
          (e) => Movie.fromJson(e),
        ),
      )) {
        loadedData.add(element);
      }
    }
    _nowPlaying = loadedData;
    notifyListeners();
  }

  Future<void> getUpComing(page) async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=e3d304e939340f69f639d7bb3c709475&page=$page');
    final response = await http.get(url);
    List<Movie> loadedData = [];
    if (response.statusCode == 200) {
      for (var element in List<Movie>.from(
        (json.decode(response.body)['results'] as List<dynamic>).map(
          (e) => Movie.fromJson(e),
        ),
      )) {
        loadedData.add(element);
      }
    }
    _upComing.addAll(loadedData);
    notifyListeners();
  }

  Future<void> getTopRated(page) async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=e3d304e939340f69f639d7bb3c709475&page=$page');
    final response = await http.get(url);
    List<Movie> loadedData = [];
    if (response.statusCode == 200) {
      for (var element in List<Movie>.from(
        (json.decode(response.body)['results'] as List<dynamic>).map(
          (e) => Movie.fromJson(e),
        ),
      )) {
        loadedData.add(element);
      }
    }
    _topRated.addAll(loadedData);
    notifyListeners();
  }

  Future<void> getPopular(page) async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=e3d304e939340f69f639d7bb3c709475&page=$page');
    final response = await http.get(url);
    List<Movie> loadedData = [];
    if (response.statusCode == 200) {
      for (var element in List<Movie>.from(
        (json.decode(response.body)['results'] as List<dynamic>).map(
          (e) => Movie.fromJson(e),
        ),
      )) {
        loadedData.add(element);
      }
    }
    _popular.addAll(loadedData);
    notifyListeners();
  }

  Future<void> getMovieDetails(String id) async {
    final url = Uri.parse(MyApi.movieId(id));
    final response = await http.get(url);
    Movie? loadedMovie;
    if (response.statusCode == 200) {
      loadedMovie = Movie.fromJson(json.decode(response.body));
    }
    _movie = loadedMovie as Movie;
    final urlVideo = Uri.parse(
        'https://api.themoviedb.org/3/movie/${_movie!.id}/videos?api_key=e3d304e939340f69f639d7bb3c709475');
    final responseKey = await http.get(urlVideo);
    String loadkey = '';
    if (responseKey.statusCode == 200) {
      loadkey = json.decode(responseKey.body)['results'][0]['key'].toString();
    }
    _videoKey = loadkey;
    notifyListeners();
  }
}
