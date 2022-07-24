module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      logger.add_tags 'ActionCable', (current_user ? current_user.name : "testmyapp")
    end

    protected
      def find_verified_user
        verified_user = User.find_by(id: cookies.signed['user.id'])
        cook=cookies.signed['user.expires_at'] rescue nil
	verified_user
        #if verified_user && (cook ? (cook > Time.now) : false)
        #  verified_user
        #else
        #  reject_unauthorized_connection
        #end
      end
  end
end
