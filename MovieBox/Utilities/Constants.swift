//
//  Constants.swift
//  MovieBox
//
//  Created by Kelly Tan on 2024-07-19.
//

import Foundation

struct Constants {
    static let apiKey = "51df8e30b81014301b4ba2075d963b5e"
    static let movieBaseUrl = "https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1"
    static let movieApiKey = "api_key=\(apiKey)"
    static let imageBaseUrl = "https://image.tmdb.org/t/p/w500"
    static let movieAllUrl = "\(movieBaseUrl)&\(movieApiKey)&sort_by=popularity.desc&without_genres=99,10755&vote_count.gte=200"
    static let moviePopularUrl = "\(movieBaseUrl)&\(movieApiKey)&sort_by=popularity.desc"
    static let movieTopRatedUrl = "\(movieBaseUrl)&\(movieApiKey)&sort_by=vote_average.desc&without_genres=99,10755&vote_count.gte=200"
    static let movieDetailUrl = "https://api.themoviedb.org/3/movie/"
    static let movieDetailVidioQuery = "append_to_response=videos"
    static let movieVideoBaseUrl = "https://api.themoviedb.org/3/movie/"
    static let movieVideoKeyUrl = "/videos?\(movieApiKey)"
    static let youtubeBaseUrl = "http://youtube.com/watch?v="
//http://youtube.com/watch?v=Div0iP65aZo
}

//https://api.themoviedb.org/3/movie/297762/videos?api_key=51df8e30b81014301b4ba2075d963b5e

//https://api.themoviedb.org/3/movie/12477?&append_to_response=videos&api_key=51df8e30b81014301b4ba2075d963b5e
//url = "https://api.themoviedb.org/3/movie/{}?api_key=8265bd1679663a7ea12ac168da84d2e8&language=en-US".format(movie_id)
//data = requests.get(url)
//data = data.json()
//poster_path = data['poster_path']
//full_path = "https://image.tmdb.org/t/p/w500/" + poster_path

//echo("<img src='" . $config['base_url'] . $config['poster_sizes'][2] . $responsePHP['poster_path'] . "'/>");


//Auth.auth().useEmulator(withHost:"127.0.0.1", port:9099)
//export FIREBASE_AUTH_EMULATOR_HOST="127.0.0.1:9099"
//export GCLOUD_PROJECT="your-project-id"
//firebase emulators:start
