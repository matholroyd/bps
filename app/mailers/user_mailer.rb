class UserMailer < ActionMailer::Base

  def setup_instructions(user)
    mail(user, 
      subject: "Setup instuction for Bitcoin Payment Service"
    )
  end
  
  protected

  def mail(user, opts)
    DBC.require(user)
    DBC.require(user.valid?)
    
    @user = user

    default_opts = {
      :to      => user.email,
      :from    => "someone@smith.com",
    }
    super(default_opts.merge(opts)) do |format|
      format.html
    end
  end
  
end