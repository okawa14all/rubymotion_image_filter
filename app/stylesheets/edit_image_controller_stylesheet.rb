class EditImageControllerStylesheet < ApplicationStylesheet
  # Add your view stylesheets here. You can then override styles if needed, example:
  # include FooStylesheet

  def setup
    # Add stylesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.white
  end

  def preview_area_height
    app_width*4/3
  end

  def filter_area_height
    # navigationBar height 44
    app_height - preview_area_height - 44
  end

  def preview_image(st)
    st.frame = { t: 0, l: 0, w: app_width, h: preview_area_height }
    st.background_color = color.clear
    st.view.contentMode = UIViewContentModeScaleAspectFit
  end

  def filter_list(st)
    st.frame = { fb: 0, l: 0, w: app_width, h: filter_area_height }
    st.background_color = color.translucent_black
  end
end
