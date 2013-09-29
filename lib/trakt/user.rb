module Trakt
  class User
    include Connection

    def watchlist_shows(*args)
      get_with_args('/watchlist/shows.json/', *args)
    end

  end
end
