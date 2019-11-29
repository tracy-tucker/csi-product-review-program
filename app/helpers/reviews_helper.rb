module ReviewsHelper

    def display_header(review)
        if params[:product_id]
            content_tag(:h1, "Create a new review for #{review.product.active_ingredient} - #{review.product.chem_group.name}")
        else
            content_tag(:h1, "Create a review")
        end
    end
    
end
