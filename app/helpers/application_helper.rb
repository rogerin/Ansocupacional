module ApplicationHelper
  def flash_message
    messages = ""
    [:notice, :info, :warning, :error, :success].each {|type|
      if flash[type]
      	if type == :notice
        	messages += "<div class=\"alert alert-danger\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button> #{flash[type]}</div>"
        else
        	messages += "<div class=\"alert alert-#{type}\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button> #{flash[type]}</div>"

        end

      end
    }

    messages.html_safe
  end

  def return_tipo(tipo)
  	if tipo == 1
  		"Admin"
  	elsif tipo == 2
  		"Clinica"
  	else
  		"indefinido"
  	end
  end
end