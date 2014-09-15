class MainStylesheet < ApplicationStylesheet

  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.white
  end

  def select_img_from_libraly(st)
    st.frame = {l: 10, t: 150, w: app_width - 20, h: 50}
    st.text = 'ライブラリから選択'
    st.background_color = color.tint
    st.font = font.medium
    st.color = color.white
  end

  def select_img_from_album(st)
    st.frame = {l: 10, t: 250, w: app_width - 20, h: 50}
    st.text = 'アルバムから選択'
    st.background_color = color.tint
    st.font = font.medium
    st.color = color.white
  end

  def select_img_from_camera(st)
    st.frame = {l: 10, t: 350, w: app_width - 20, h: 50}
    st.text = '写真を撮る'
    st.background_color = color.tint
    st.font = font.medium
    st.color = color.white
  end

end
