require 'rails_helper'

RSpec.describe 'user_transactions/new', type: :view do
  before(:each) do
    assign(:user_transaction, UserTransaction.new(
                                name: 'MyString',
                                photo: 'MyString',
                                description: 'MyText',
                                payment: 1.5
                              ))
  end

  it 'renders new user_transaction form' do
    render

    assert_select 'form[action=?][method=?]', user_transactions_path, 'post' do
      assert_select 'input[name=?]', 'user_transaction[name]'

      assert_select 'input[name=?]', 'user_transaction[photo]'

      assert_select 'textarea[name=?]', 'user_transaction[description]'

      assert_select 'input[name=?]', 'user_transaction[payment]'
    end
  end
end
