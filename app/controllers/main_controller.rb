class MainController < UIViewController

  def viewDidLoad
    super

    # Sets a top of 0 to be below the navigation control, it's best not to do this
    # self.edgesForExtendedLayout = UIRectEdgeNone

    rmq.stylesheet = MainStylesheet
    init_nav
    rmq(self.view).apply_style :root_view

    rmq.append(UIButton, :select_img_from_libraly).on(:touch) do |sender|
      open_image_picker_controller(UIImagePickerControllerSourceTypePhotoLibrary)
    end

    rmq.append(UIButton, :select_img_from_album).on(:touch) do |sender|
      open_image_picker_controller(UIImagePickerControllerSourceTypeSavedPhotosAlbum)
    end

    rmq.append(UIButton, :select_img_from_camera).on(:touch) do |sender|
      open_image_picker_controller(UIImagePickerControllerSourceTypeCamera)
    end
  end

  def init_nav
    self.title = 'Image Filter'
  end

  def open_image_picker_controller(sourceType)
    picker = UIImagePickerController.new
    picker.delegate = self
    picker.sourceType = sourceType
    self.presentModalViewController(picker, animated: true)
  end

  def imagePickerController(picker, didFinishPickingImage:image, editingInfo:editingInfo)
    edit_image_controller = EditImageController.new
    edit_image_controller.image = image
    picker.pushViewController(edit_image_controller, animated: true)
  end

end
