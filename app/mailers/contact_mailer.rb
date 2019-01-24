class ContactMailer < ApplicationMailer
  def contact_mail(contact,home,title,content)
    @home = Home.find(home)
    @title = title
    @content = content
    mail from: contact.email, to: @home.user.email, subject: "投稿確認メール"
  end
end
