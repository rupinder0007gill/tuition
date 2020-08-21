class NotificationsMailer < ApplicationMailer
  def course_approve(course)
    @course = course
    @user = course.user
    subject = 'Your course is approved by admin.'
    mail to: @user.email,
         subject: subject
  end

  def course_reject(course)
    @course = course
    @user = course.user
    subject = 'Your course is rejected by admin.'
    mail to: @user.email,
         subject: subject
  end

  def enrollment_approve(enrollment)
    @course = enrollment.course
    @user = enrollment.user
    subject = "Your enrollment is approved for #{@course.title}."
    mail to: @user.email,
         subject: subject
  end

  def enrollment_reject(enrollment)
    @course = enrollment.course
    @user = enrollment.course.user
    subject = "Your course is rejected for #{@course.title}."
    mail to: @user.email,
         subject: subject
  end
end
