class OrderStatusUpdater
    def self.call(order, new_status, actor)
      return false unless order && Order.statuses.key?(new_status)
  
      order.update(status: new_status).tap do |success|
        if success
          OrderStatusChange.create!(
            order: order,
            previous_status: order.status_previously_was,
            new_status: new_status,
            actor: actor
          )
        end
      end
    end
  end
  