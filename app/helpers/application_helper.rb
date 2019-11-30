module ApplicationHelper

    def render_nav_links
        if current_user
            render partial: 'layouts/nav_links'
        else
            render partial: 'layouts/logged_out_links'
        end
    end
    
end
