module ApplicationHelper
    def google_map_image_tag(profile)
        image_tag "http://maps.googleapis.com/maps/api/staticmap?center=#{@profile.latitude},#{@profile.longitude}&markers=#{@profile.latitude},#{@profile.longitude}&zoom=10&size=400x320&key=AIzaSyA4BHW3txEdqfxzdTlPwaHsYRSZbfeIcd8"    
    end 
end
