class PostControllerStylesheet < ApplicationStylesheet
  # Add your view stylesheets here. You can then override styles if needed, example:
  # include FooStylesheet

  def setup
    # Add stylesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.white
  end

  def image_view(st)
    # st.frame = { t: 10, l: 10, w: app_width - 20, h: app_width - 20 }
    st.frame = { t: 10, l: 5, w: 90, h: 90 }
    st.background_color = color.clear
    st.view.contentMode = UIViewContentModeScaleAspectFill
    st.view.setClipsToBounds(true)
  end
end
