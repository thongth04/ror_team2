module ApplicationHelper
  
  def flash_class_name(name)
    case name
      when 'notice' then 'success'
      when 'alert'  then 'danger'
    else 
      name
    end
  end
  def created_at_from_parameters
    if params[:search].present?
      params[:search][:created_at]
    end
  end

end
