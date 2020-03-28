class RanksController < ApplicationController
  def index
    @sales_ranks= Product.order(sales_score: :desc).limit(5)
  
    @grade_ranks = Review.select("product_id, avg(grade) as average_grade").group("product_id")
    .order("average_grade DESC")

     @vote_ranks = Review.select("product_id, count(*) as vote_count").
     group("product_id").order("count(*) DESC").limit(5)


    @gender_male_ranks = Review.joins(:user).where(users: {kid_gender: '0'}).select("product_id, count(*) as vote_count, users.name as user_name").
     group("product_id").order("count(*) DESC").limit(5)


                         
  end

  def sales
    @sales_ranks= Product.order(sales_score: :desc).limit(5)

  end

  def grade
    @grade_ranks = Review.select("product_id, avg(grade) as average_grade").group("product_id")
    .order("average_grade DESC").limit(5)

    # @items = Item.where(:shop_name => @shop.name).joins(:reviews)
    # .select("items.id, avg(reviews.rating) as average_rating, count(reviews.id) as number_of_reviews")
    # .group("items.id")
    # .order("average_rating DESC, number_of_reviews DESC")
    #@grade_ranks = Review.group(:product_id).select(:product_id).order("average(:grade) desc").limit(5) 

  end

  def votes
    @vote_ranks = Review.select("product_id, count(*) as vote_count")
                  .group("product_id").order("count(*) DESC").limit(5)

  end

  def gender

    @gender_male_ranks = Review.where(user_kid_gender: 0).select("product_id, count(*) as vote_count")
                         .group("product_id").order("count(*) DESC").limit(5)

    @gender_female_ranks = Review.where(user_kid_gender: 1).select("product_id, count(*) as vote_count")
                        .group("product_id").order("count(*) DESC").limit(5)

  end
end

 # @items = Item.where(:shop_name => @shop.name).joins(:reviews)
    # .select("items.id, avg(reviews.rating) as average_rating, count(reviews.id) as number_of_reviews")
    # .group("items.id")
    # .order("average_rating DESC, number_of_reviews DESC")
    #@grade_ranks = Review.group(:product_id).select(:product_id).order("average(:grade) desc").limit(5) 
