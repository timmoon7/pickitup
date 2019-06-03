module ApplicationHelper
    def sortable(column, title = nil)
        title ||= column.titleize
        direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
        link_to title, {sort: column, direction: direction}
    end

    def google_map_image_tag(profile)  
        api_key = ENV.fetch('GOOGLE_MAP_KEY')
        image_tag "https://maps.googleapis.com/maps/api/staticmap?center=#{profile.latitude},#{profile.longitude}&markers=#{profile.latitude},#{profile.longitude}&zoom=13&size=400x300&key=#{api_key}"    
    end 
end