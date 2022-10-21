require 'rails_helper'

RSpec.describe "user_transactions/show", type: :view do
  before(:each) do
    assign(:user_transaction, UserTransaction.create!(
      name: "Name",
      photo: "Photo",
      description: "MyText",
      payment: 2.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Photo/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2.5/)
  end
end
