class TestController < ApplicationController
    before_action :set_user, only: %i{sign_up} 
    before_action :data_sign_in, only: %i{post_sign_in}
    def get_info
     @user=User.new
    end
    def sign_up
        user = User.new(set_user)
        if user.save!
            redirect_to index_path, alert: 'dki thanh cong'
        else
            render :get_info, alert: 'khong thanh cong'
        end

    end

    def set_user
        params.require(:user).permit(:email, :password, :number_phone)
    end

    def sign_in
    end

    def post_sign_in
        user= User.new(data_sign_in)
        user1=User.find_by(email: user.email)
        if user1
            if user.password== user1.password
                redirect_to home_path, alert: 'đây là trang chủ'
            else
                render :sign_in, alert: 'password sai'
            end
        else 
            render :sign_in, alert: 'tai khoan khong ton tai'
        end

    end
    def data_sign_in
       params.require(:user).permit(:email, :password)
    end
    
end
