module ApplicationHelper
  def flash_background_color(message_type)
    # 色判定
    case message_type
    when "notice" then "bg-secondary-container text-on-surface"
    when "alert" then "bg-error text-on-primary"
    else "bg-surface-container text-on-surface"
    end
  end
end
