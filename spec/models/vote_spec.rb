describe Vote do
  describe "validations" do
    before do
      @post = Post.create(title: 'post title', body 'post body')
      3.times {@post.votes.create(value: 1) }
      2.times {@post.votes.create(value: -1) }
    end
    
        describe '#up_votes' do
          it "increases the number of votes with value = 1" do
            expect( @post.up_votes ).to eq(1)
          end
        end

        describe '#down_votes' do
          it "decreases the number of votes with value = 1" do
            expect( @post.down_votes ).to eq(1)
          end
        end

        describe "value validations" do
          it "only allows -1 or 1 as values" do
            expect( @post.value_validations ).to eq(1 ) # 3 - 2
          end
        end
    
  end
end