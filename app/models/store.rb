class Store < ApplicationRecord
    include HTTParty

    default_params key: ENV['HOTPEPPER_API_KEY'], format: 'json'

    def self.get_stores(lat,lng,range)
        base_uri "http://webservice.recruit.co.jp/hotpepper/gourmet/v1"
        get("/", query:{ lat: lat, lng: lng, range: range})
    end

    def self.details(id)
        base_uri "http://webservice.recruit.co.jp/hotpepper/gourmet/v1"
        get("/", query:{id: id})
    end
end
