class MainController < UIViewController

  def viewDidLoad
    super

    self.title = 'redpotion_alert'

    rmq.stylesheet = MainStylesheet
    rmq(self.view).apply_style :root_view

    # New UIAlertController Examples
    rmq.append(UIView, :alert_controller_section).tap do |acs|
      acs.append(UILabel, :alert_controller_title)

      acs.append(UIButton, :alert_controller_button).on(:tap) do

        ok = UIAlertAction.actionWithTitle("OK", style: UIAlertActionStyleDefault, handler: -> (action) {
          puts "#{action.title} was pressed"
        })

        rmq.alert(message: "UIAlertController Minimal", actions: [ok])
      end

      acs.append(UIButton, :alert_controller_advanced_button).on(:tap) do

        ok = UIAlertAction.actionWithTitle("OK", style: UIAlertActionStyleDefault, handler: -> (action) {
          puts "#{action.title} was pressed"
        })

        cancel = UIAlertAction.actionWithTitle("Cancel", style: UIAlertActionStyleCancel, handler: -> (action) {
          puts "#{action.title} was pressed"
        })

        delete = UIAlertAction.actionWithTitle("Delete", style: UIAlertActionStyleDestructive, handler: -> (action) {
          puts "#{action.title} was pressed"
        })

        rmq.alert(title: "More Actions", message: "UIViewController 2", actions: [ok, cancel, delete])
      end

    end.resize_frame_to_fit_subviews(bottom: 10, right: -5)


    # Classic UIAlertView Examples
    rmq.append(UIView, :alert_view_section).tap do |avs|
      avs.append(UILabel, :alert_view_title)

      avs.append(UIButton, :alert_view_button).on(:tap) do
        rmq.alert_view(message: "Minimal UIAlertView")
      end

      avs.append(UIButton, :alert_view_ks_button).on(:tap) do
        rmq.alert_view({
          title: "Hey There",
          message: "Check out this complex alert!",
          cancel_button: 'Nevermind',
          other_buttons: ['Log In'],
          delegate: nil,
          view_style: UIAlertViewStyleLoginAndPasswordInput
        })
      end
    end.resize_frame_to_fit_subviews(bottom: 10, right: -5)
  end

  def supportedInterfaceOrientations
    UIInterfaceOrientationMaskAll
  end
  def willAnimateRotationToInterfaceOrientation(orientation, duration: duration)
    rmq.all.reapply_styles
  end
end
