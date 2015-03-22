module RubyMotionQuery
  class RMQ

    # Creates and shows the old UIAlertView.  Added here for use in fallback.
    # Fallback won't run actions, but the old system needed delegates anyhow.
    # Usage Example:
    #   rmq.alert_view("This is a test")
    #   rmq.alert_view(title: "Hey there", message: "Enjoying this?")
    # @return [RMQ]
    def alert_view(opts = {})

      # shortcut sending a string
      opts = {message: opts} if opts.is_a? String
      # An alert is nothing without a message
      raise(ArgumentError, "RedAlert requires a message") if opts[:message].nil? || opts[:message].empty?

      opts = {
        title: "Alert!",
        cancel_button: "OK",
        other_buttons: [],
        delegate: nil,
        view_style: UIAlertViewStyleDefault,
        show_now: true,
      }.merge(opts)

      alert_view = UIAlertView.alloc.initWithTitle(
        opts[:title],
        message: opts[:message],
        delegate: opts[:delegate],
        cancelButtonTitle: opts[:cancel_button],
        otherButtonTitles: nil
      )
      Array(opts[:other_buttons]).each { |button| alert_view.addButtonWithTitle(button) }

      alert_view.alertViewStyle = opts[:view_style]

      alert_view.show if opts[:show_now]
      rmq(alert_view)
    end

  end
end