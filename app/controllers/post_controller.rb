class PostController < UIViewController
  attr_accessor :filteredImage

  def viewDidLoad
    super

    self.edgesForExtendedLayout = UIRectEdgeNone

    rmq.stylesheet = PostControllerStylesheet
    init_nav
    rmq(self.view).apply_style :root_view

    puts '======== filteredImage size'
    puts "w:#{self.filteredImage.size.width}"
    puts "h:#{self.filteredImage.size.height}"

    rmq.append(UIImageView, :image_view).get.image = self.filteredImage
  end

  def init_nav
    self.navigationItem.tap do |nav|
      nav.leftBarButtonItem = UIBarButtonItem.alloc.initWithTitle(
        'cancel',
        style: UIBarButtonItemStylePlain,
        target: self,
        action: :cancel
      )
    end

    self.navigationItem.tap do |nav|
      nav.rightBarButtonItem = UIBarButtonItem.alloc.initWithTitle(
        'post',
        style: UIBarButtonItemStylePlain,
        target: self,
        action: :post
      )
    end
  end

  def post
    puts 'post'
    self.dismissViewControllerAnimated(true, completion:nil)
  end

  def cancel
    puts 'cancel'
    self.dismissViewControllerAnimated(true, completion:nil)
  end
end
