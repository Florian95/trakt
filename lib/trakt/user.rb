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

    def method_missing(m, *args, &block)
      actions = m.split(/_/)
      if actions[0] == 'get'
        get_with_args("/user/#{actions[1..-1].join('/')}.json/", *args)
      end
    end

  end
end
