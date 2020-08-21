module ApplicationHelper
  def date_format(date)
    date.strftime('%d-%m-%Y')
  rescue StandardError
    nil
  end
end
