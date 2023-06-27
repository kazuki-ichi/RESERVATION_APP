class RoomsController < ApplicationController
  
  # 新規画面を表示するアクション
  def new
    # @がつく変数はアクションに関連するビューにいく
    #@roomという変数に、Room.newで新規作成画面の準備をしている(インスタンス生成)

    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :detail, :price, :image_path, :address, :user_id ,:content, :image))
  
    #roomのdbに保存します
    if @room.save
    
      # 指定の場所に飛ぶ
      redirect_to @room
    else
      #あとのファイル名が呼び出せる
      render "new"
    end
  end

  def own
    #全て表示
    # @room = Room.all
    @user = current_user
    @rooms = @user.rooms #リレーションを定義することでこのような記述が可能
  end

  def show
    #撮ってきたIDを@roomに代入
    @room = Room.find(params[:id])
    # Reservation(リザベーション)のインスタンス生成＝newするとも言う
    @reservation = Reservation.new
  end

def search_result
  pp params
  if params[:area].present?
  @rooms = Room.where("address like ?", "%#{params[:area]}%")
  elsif params[:keyword].present?
  @rooms = Room.where("name like ? OR detail like ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%")
  else 
  @rooms = Room.all
  end
end


end
