module Trakt
  class Show
    include Connection
    def episode_unseen(data)
      require_settings %w|username password apikey|
      post('show/episode/unseen/', data)
    end
    def episode_seen(data)
      require_settings %w|username password apikey|
      post('show/episode/seen/', data)
    end
    def add_to_library(data)
      require_settings %w|username password apikey|
      post('show/library/', data)
    end
    def remove_from_library(data)
      require_settings %w|username password apikey|
      post('show/unlibrary/', data)
    end
    def seen(data)
      require_settings %w|username password apikey|
      post('show/seen/', data)
    end
    def summaries(*args)
      get_with_args('/show/summaries.json/', *args)
    end
    def summary(*args)
      get_with_args('/show/summary.json/', *args)
    end
    # need to use thetvdb id here since the slug can't be used for unseen
    def unseen(title)
      all = seasons title
      episodes_per_season = {}
      episodes_to_remove = []
      all.each do |season_info|
        season_num = season_info['season']
        next if season_num == 0 # dont need to remove specials
        episodes    = season_info['episodes']
        1.upto(episodes) do |episode|
          episodes_to_remove << { season: season_num, episode: episode }
        end
      end
      episode_unseen tvdb_id: title, episodes: episodes_to_remove
    end
    def seasons(title)
      get('show/seasons.json/', title)
    end
    def season(*args)
      get_with_args('/show/season.json/', *args)
    end
  end
end
