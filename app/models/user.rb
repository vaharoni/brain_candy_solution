class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :brain_candy_completions, dependent: :destroy
  has_many :brain_candies, through: :brain_candy_completions

  def candy_status(candy)
    @candy_lookup ||= Hash[brain_candy_completions.map { |bcc| [bcc.brain_candy_id, bcc] }]
    BrainCandyCompletion.status @candy_lookup[candy.id]
  end

  def claim_complete(candy)
    brain_candy_completions << BrainCandyCompletion.new(brain_candy: candy) unless has_candy?(candy.id)
  end

  # self should be the verifying user
  def verify(candy, claiming_user_id)
    bcc = BrainCandyCompletion.find_by_brain_candy_id_and_user_id(candy.id, claiming_user_id)
    bcc.update_column :verifying_user_id, self.id
  end

  private

  def has_candy?(candy_id)
    brain_candy_completions.select { |bcc| bcc.brain_candy_id == candy_id }.present?
  end
end
