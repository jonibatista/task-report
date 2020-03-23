class User < ApplicationRecord  
    has_secure_password

    has_many :tasks

    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :email, uniqueness: { case_sensitive: false }
    validates :name, presence: true, length: { maximum: 50 }
    validates :password, presence: true, length: { minimum: 8 }, unless: Proc.new { password.nil? }

    before_save :clear_email


    def reporter?
      !manager?
    end

    private
      def clear_email
        self.email = email.downcase
      end
end
