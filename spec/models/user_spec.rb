require 'rails_helper'

describe User do 


    include TestFactories

    describe "#favorited(post)" do

      before do
        @post = associated_post
        @user = authenticated_user
      end 
      

      it "returns 'nil' if the user has not favorited a post" do 
        # expect nil if no favorte post

        expect(@user.favorited(@post)).to eq(nil)

      end

      it "returns the appropriate favorite if it exists" do
        expect(@user.favorited(@post)).to eq(@post.favorites.find_by(user_id: @user.id))
      end
  end
end  

