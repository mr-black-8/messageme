class WsController < WebsocketRails::BaseController

  before_action :fetch_user

  def get_id
    if @current_user.present?
      WebsocketRails[:user_id].trigger(:user, @current_user.id)
      WebsocketRails.users[@current_user.id] = connection
      get_all_messages(@current_user)
      get_all_users(@current_user)
    end
  end

  def get_all_messages(user)
    messages = Message.all
    user_messages = []
    messages.each do |msg|
      if msg.user_id == user.id || msg.target == user.id
        user_messages << msg
      end
    end
    WebsocketRails.users[user.id].send_message('messages', user_messages)
  end

  def get_all_users(user)
    all_users = User.all
    other_users = []
    all_users.each do |u|
      if u.id != user.id
        new_user = {id: u.id,
                    name: u.first + ' ' + u.last[0],
                    image: u.image}
        other_users << new_user
      end
    end
    WebsocketRails.users[user.id].send_message('users', other_users)
  end

  def goodbye
  end


  private
  def fetch_user
    @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
    session[:user_id] = nil unless @current_user.present?
  end
end
