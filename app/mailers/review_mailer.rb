class ReviewMailer < ApplicationMailer
        def new_review(review)
            @review = review
            @product = review.product
            @owner = @product.user
            mail(
                to: @owner.email,
                subject: 'Someone posted a review for your product.'
            )
        end
end
