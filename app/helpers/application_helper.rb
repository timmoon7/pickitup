module ApplicationHelper
    def google_map_image_tag(profile)  
        api_key = ENV.fetch('GOOGLE_MAP_KEY')
        map_uri = "https://maps.googleapis.com/maps/api/staticmap?center=#{profile.latitude},#{profile.longitude}&markers=#{profile.latitude},#{profile.longitude}&zoom=13&size=400x300&key=#{api_key}" 
        image_tag map_uri.force_encoding("UTF-8")
    end 
end