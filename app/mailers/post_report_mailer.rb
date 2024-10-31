# frozen_string_literal: true

# Mailer for single post
class PostReportMailer < ApplicationMailer
  def post_report(user, post, _post_report)
    @post = post
    mail to: user.email, subject: "Post #{post.id} report"
  end
end
