# coding: utf-8
module AppsHelper
  
  def render_stars(app, new=false)
    stars_status = {'1' => "很差", '2' => "差", '3' => "还行", '4' => "好", '5' => "很好"}
    html = []
    
    App::RATE_DIMENSIONS.each do|k, v|
      input_html = []
      app_star = if new || app.rater_count == 0
        0
      else
        attr = "#{k}_star".to_sym
        app.respond_to?(attr) ? app.send(attr)/app.rater_count : 0
      end
      stars_status.each do |k1, v1|
        checked = k1.to_i == app_star
        input_html << %(<input name="star_#{k}" type="radio" class="star required" #{disabled="disabled" unless new} value="#{k1}" title="#{v1}" #{checked="checked" if checked}/>)
      end
      html << %(<div id="app_#{k}"><span class="app-star-title">#{v}</span>#{input_html.join("")}</div>)
    end
    html.join("")
  end
end
