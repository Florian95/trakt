module Trakt
  class User
    include Connection

    def watchlist_shows(*args)
      get_with_args('/user/watchlist/shows.json/', *args)
    end

    def library_shows_watched(*args)
      get_with_args('/user/library/shows/watched.json/', *args)
    end

    def library_shows_collection(*args)
      get_with_args('/user/library/shows/collection.json/', *args)
    end

  end
end
