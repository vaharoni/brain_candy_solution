class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :brain_candy_completions
  has_many :brain_candies, through: :brain_candy_completions

  def candy_status(candy)
    @candy_lookup ||= Hash[brain_candy_completions.map{|bcc| [bcc.brain_candy_id, bcc]}]
    BrainCandyCompletion.status @candy_lookup[candy.id]
  end

  def claim_complete(candy)
    brain_candy_completions << BrainCandyCompletion.new(brain_candy: candy) unless
        brain_candy_completions.select{|bcc| bcc.brain_candy_id == candy.id}.present?
  end

  # self should be the verifying user
  def verify(candy, claiming_user_id)
    bcc = BrainCandyCompletion.find_by_brain_candy_id_and_user_id(candy.id, claiming_user_id)
    bcc.update_column :verifying_user_id, self.id
  end
end
