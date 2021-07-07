class MoviesController < ApplicationController

  def discover
    # use discover endpoint only 4
    @movies = TMDBService.discover
  end

  def movies
    # only 40
    @movie = {
      id: 1,
      poster_path: '/qIicLxr7B7gIt5hxZxo423BJLlK.jpg',
      vote_average: 8.2,
      title: 'F9',
      runtime: 138
    }
  end

  def search; end

  def show
    # only 40
    @movie = {
      id: 1,
      poster_path: '/qIicLxr7B7gIt5hxZxo423BJLlK.jpg',
      vote_average: 8.2,
      title: 'F9',
      runtime: 138,
      genres: [
        {
          id: 28,
          name: 'Action'
        },
        {
          id: 878,
          name: 'Science Fiction'
        }
      ],
      cast: [
        { id: 73457,
          name: 'Chris Pratt',
          profile_path: '/gXKyT1YU5RWWPaE1je3ht58eUZr.jpg',
          character: 'Dan Forester' },
        { id: 73457,
          name: 'Chris Pratt',
          profile_path: '/gXKyT1YU5RWWPaE1je3ht58eUZr.jpg',
          character: 'Dan Forester' },
        { id: 73457,
          name: 'Chris Pratt',
          profile_path: '/gXKyT1YU5RWWPaE1je3ht58eUZr.jpg',
          character: 'Dan Forester' },
        { id: 73457,
          name: 'Chris Pratt',
          profile_path: '/gXKyT1YU5RWWPaE1je3ht58eUZr.jpg',
          character: 'Dan Forester' },
        { id: 73457,
          name: 'Chris Pratt',
          profile_path: '/gXKyT1YU5RWWPaE1je3ht58eUZr.jpg',
          character: 'Dan Forester' },
        { id: 73457,
          name: 'Chris Pratt',
          profile_path: '/gXKyT1YU5RWWPaE1je3ht58eUZr.jpg',
          character: 'Dan Forester' },
        { id: 73457,
          name: 'Chris Pratt',
          profile_path: '/gXKyT1YU5RWWPaE1je3ht58eUZr.jpg',
          character: 'Dan Forester' },
        { id: 73457,
          name: 'Chris Pratt',
          profile_path: '/gXKyT1YU5RWWPaE1je3ht58eUZr.jpg',
          character: 'Dan Forester' },
        { id: 73457,
          name: 'Chris Pratt',
          profile_path: '/gXKyT1YU5RWWPaE1je3ht58eUZr.jpg',
          character: 'Dan Forester' },
        { id: 73457,
          name: 'Chris Pratt',
          profile_path: '/gXKyT1YU5RWWPaE1je3ht58eUZr.jpg',
          character: 'Dan Forester' }
      ],
      overview: 'The world is stunned when a group of time travelers arrive from the year 2051 to deliver an urgent message: Thirty years in the future, mankind is losing a global war against a deadly alien species. The only hope for survival is for soldiers and civilians from the present to be transported to the future and join the fight. Among those recruited is high school teacher and family man Dan Forester. Determined to save the world for his young daughter, Dan teams up with a brilliant scientist and his estranged father in a desperate quest to rewrite the fate of the planet.'
    }
  end
end
