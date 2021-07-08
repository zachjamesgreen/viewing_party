Methods we might need on api class
- discover_movies
    1. DONE
    1. https://api.themoviedb.org/3/discover/movie?api_key=
- search_movies(search_term)
    1. Movie Class
    1. search_term being the term the user wants to search for
    1. https://api.themoviedb.org/3/search/movie?query=<search_term>&api_key=
- movie(id)
    1. MovieDetail Class
    1. id of the movie we want
    1. https://api.themoviedb.org/3/movie/<>?api_key=
- credits(id)/cast(id)
    1. id of the movie
    1. https://api.themoviedb.org/3/movie/<id>/credits?api_key=
- reviews(id)
    1. id of the movie
    1. https://api.themoviedb.org/3/movie/<>/reviews?api_key=

image_base_url = 'https://image.tmdb.org/t/p/original'

Can get movie reviews and cast with one call

https://api.themoviedb.org/3/movie/588228?api_key=<key>&append_to_response=reviews,credits