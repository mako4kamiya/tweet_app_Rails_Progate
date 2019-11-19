class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    def new
        @user = User.new
    end
    
    def create
        @user = User.new(
            name: params[:name],
            email: params[:email],
            image_name: "default_user.jpg"
        )
        if @user.save
            flash[:notice] = "ユーザー登録が完了しました"
            redirect_to("/users/#{@user.id}")
        else
            render("/users/new")
        end
    end

    def edit
        @user = User.find_by(id: params[:id])
    end

    def update
        @user = User.find_by(id: params[:id])
        @user.name = params[:name]
        @user.email = params[:email]
        if params[:image]
            @user.image_name = "#{@user.id}.jpg" #データベースに画像のファイル名を保存
            image = params[:image] #画像データを取得
            File.binwrite("public/user_images/#{@user.image_name}",image.read) #画像データをpublicフォルダに保存
        end
        if @user.save
            flash[:notice] = "ユーザー情報を編集しました"
            redirect_to("/users/#{@user.id}")
        else
            render("/users/edit")
        end
    end
end
