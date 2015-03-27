require 'spec_helper'

describe User do
	before { @user = User.new(email: "aasdfasdf@dasf.com", encrypted_password: "123456789")}
		subject { @user }

		describe "password is too short" do
			before { @user.encrypted_password = "12345" }
			it {should_not be_valid }
		end

		describe "email is not the correct form" do
			before { @user.email = "adfadf.adf" }
			it {should_not be_valid}
		end

	  it { should validate_presence_of(:email) }
	  it { should validate_presence_of(:encrypted_password) }
	  it { should ensure_length_of(:encrypted_password).is_at_least(8) }

end