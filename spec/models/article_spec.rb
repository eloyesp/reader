require 'spec_helper'

describe Article do

  it 'can be stared by users' do
    @article = create :article
    expect(@article.starers).to be_empty
    @user = create :user
    @article.starers << @user
    expect(@article.starers).to include(@user)
  end

end

