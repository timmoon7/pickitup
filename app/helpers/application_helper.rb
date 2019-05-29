module ApplicationHelper
    def google_map_image_tag(profile)  
        image_tag "https://maps.googleapis.com/maps/api/staticmap?center=#{profile.latitude},#{profile.longitude}&markers=#{profile.latitude},#{profile.longitude}&zoom=13&size=400x300&key=#{google_map_key}"    
    end 
end
str = str.force_encoding("UTF-8")