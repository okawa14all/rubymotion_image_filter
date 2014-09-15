class EditImageController < UIViewController
  attr_accessor :image

  def viewDidLoad
    super

    self.edgesForExtendedLayout = UIRectEdgeNone

    rmq.stylesheet = EditImageControllerStylesheet
    init_nav
    rmq(self.view).apply_style :root_view

    puts '-------- original image size'
    puts "w:#{self.image.size.width}"
    puts "h:#{self.image.size.height}"


    stillImageSource = GPUImagePicture.alloc.initWithImage(self.image)
    @filter = GPUImageSepiaFilter.new
    stillImageSource.addTarget(@filter)
    @filter.useNextFrameForImageCapture
    stillImageSource.processImage
    filteredImage = @filter.imageFromCurrentFramebuffer

    imageView = rmq.append(UIImageView, :preview_image).get
    imageView.image = filteredImage

    rmq.append(UIView, :filter_list)
  end

  def init_nav
    self.navigationItem.tap do |nav|
      nav.rightBarButtonItem = UIBarButtonItem.alloc.initWithTitle(
        'next',
        style: UIBarButtonItemStylePlain,
        target: self,
        action: :open_post_controller
      )
    end
  end

  def open_post_controller
    puts "--- open_post_controller"
    p self.image
    stillImageSource = GPUImagePicture.alloc.initWithImage(self.image)
    stillImageSource.addTarget(@filter)
    @filter.useNextFrameForImageCapture
    stillImageSource.processImage
    filteredImage = @filter.imageFromCurrentFramebuffer
    p filteredImage
    controller = PostController.new
    controller.filteredImage = filteredImage
    self.navigationController.pushViewController(controller, animated: true)
  end

end
