module ApplicationHelper
    def google_map_image_tag(profile)
        # image_tag "http://maps.googleapis.com/maps/api/staticmap?center=#{profile.latitude},#{profile.longitude}&markers=#{profile.latitude},#{profile.longitude}&zoom=13&size=400x300&key=AIzaSyA4BHW3txEdqfxzdTlPwaHsYRSZbfeIcd8"    
        image_tag "https://maps.googleapis.com/maps/api/staticmap?center=#{profile.latitude},#{profile.longitude}&markers=#{profile.latitude},#{profile.longitude}&zoom=13&size=400x300&key=AIzaSyDolmJy0YpUryP2_jpsw1KI7i8_cV7hNuU"    
    end 
end
