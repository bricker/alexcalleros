module ApplicationHelper

  BOOTSTRAP_ALERT_MAP = {
    :notice => "success",
    :alert  => "danger"
  }

  def bootstrap_alert_class(key)
    BOOTSTRAP_ALERT_MAP[key.to_sym] || key.to_s
  end

  def active_for(name)
    "active" if controller_name == name
  end

  def form_errors(form)
    render '/admin/shared/form_errors', f: form
  end

  def delete_tag(object)
    render '/admin/shared/delete_tag', object: object
  end
end
