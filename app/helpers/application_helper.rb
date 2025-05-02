# app/helpers/application_helper.rb
module ApplicationHelper
    def status_badge_color(status)
      case status
      when 'pending' then 'warning'
      when 'paid' then 'info'
      when 'shipped' then 'primary'
      when 'delivered' then 'success'
      when 'cancelled' then 'danger'
      else 'secondary'
      end
    end
  end