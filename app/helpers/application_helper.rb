module ApplicationHelper

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(
        content_tag(:div, class: "flash-messages") do
          content_tag(:div, message, class: "alert #{msg_type} alert-dismissable") do
            concat message
            concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
          end
        end
      )
    end
    nil
  end

end
