class NotificationsMailer < ApplicationMailer

  def course_approve(course)
    @course = course
    @user = course.user
    subject = "Your course is approved by admin."
    mail to: @user.email,
         subject: subject
  end

  def course_reject(course)
    @course = course
    @user = course.user
    subject = "Your course is rejected by admin."
    mail to: @user.email,
         subject: subject
  end
end
