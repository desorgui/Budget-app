require 'rails_helper'

RSpec.describe "user_transactions/edit", type: :view do
  let(:user_transaction) {
    UserTransaction.create!(
      name: "MyString",
      photo: "MyString",
      description: "MyText",
      payment: 1.5
    )
  }

  before(:each) do
    assign(:user_transaction, user_transaction)
  end

  it "renders the edit user_transaction form" do
    render

    assert_select "form[action=?][method=?]", user_transaction_path(user_transaction), "post" do

      assert_select "input[name=?]", "user_transaction[name]"

      assert_select "input[name=?]", "user_transaction[photo]"

      assert_select "textarea[name=?]", "user_transaction[description]"

      assert_select "input[name=?]", "user_transaction[payment]"
    end
  end
end
