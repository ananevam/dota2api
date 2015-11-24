require 'open-uri'

module Dota2api
  INTERFACE_DOTA_MATCH = 'IDOTA2Match_570'
  INTERFACE_ECON_DOTA = 'IEconDOTA2_570'
  INTERFACE_STEAM_USER = 'ISteamUser'

  @base_url = 'https://api.steampowered.com/'

  def self.request interface, method, params
    params.merge!({:key => Dota2api.api_key})
    url = "#{@base_url}#{interface}/#{method}/v001/?" + params.map { |k,v| "#{k}=#{v}" }.join('&')
    print url+"\r\n"
    page = open(url)
    text = page.read

    JSON.parse(text, :symbolize_names => true)[:result]
  end

  def self.get_match_history params = {}
    self.request(self::INTERFACE_DOTA_MATCH, 'GetMatchHistory', params)[:matches]
  end

  def self.get_match_details params = {}
    self.request self::INTERFACE_DOTA_MATCH, 'GetMatchDetails', params
  end

  def self.get_heroes params = {}
    self.request(self::INTERFACE_ECON_DOTA, 'GetHeroes', params)[:heroes]
  end

  def self.get_player_summaries params = {}
    self.request self::INTERFACE_STEAM_USER, 'GetPlayerSummaries', params
  end

  def self.get_match_history_by_sequence_num params = {}
    self.request(self::INTERFACE_DOTA_MATCH, 'GetMatchHistoryBySequenceNum', params)[:matches]
  end

  def self.get_game_items params = {}
    self.request(self::INTERFACE_ECON_DOTA, 'GetGameItems', params)[:items]
  end

end
