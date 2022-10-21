require 'rails_helper'

RSpec.describe "user_transactions/index", type: :view do
  before(:each) do
    assign(:user_transactions, [
      UserTransaction.create!(
        name: "Name",
        photo: "Photo",
        description: "MyText",
        payment: 2.5
      ),
      UserTransaction.create!(
        name: "Name",
        photo: "Photo",
        description: "MyText",
        payment: 2.5
      )
    ])
  end

  it "renders a list of user_transactions" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Photo".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.5.to_s), count: 2
  end
end
