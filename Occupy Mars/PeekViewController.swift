import Foundation

class PeekViewController: UIViewController {
	
	@IBOutlet weak var imageHolder: UIImageView!
	@IBOutlet weak var imageHolderHeight: NSLayoutConstraint!
	
	var image = UIImage()
	var imageTitle = ""
	
	override func viewDidLoad() {
		super.viewDidLoad()
		imageHolder.image = image
		imageHolder.sizeToFit()
		if let image = imageHolder.image {
			self.preferredContentSize = CGSize(width: image.size.width, height: image.size.height)
		}
	}
	
	override var previewActionItems: [UIPreviewActionItem] {
		
		let saveAction = UIPreviewAction(title: "Save", style: .default) { (_: UIPreviewAction, _: UIViewController) -> Void in
			UIImageWriteToSavedPhotosAlbum(self.image, nil, nil, nil)
		}
		
		let shareAction = UIPreviewAction(title: "Share", style: .default) { (_: UIPreviewAction, _: UIViewController) -> Void in
			let image = self.image
			let activityViewController = UIActivityViewController(activityItems: [(image), self.imageTitle], applicationActivities: nil)
			activityViewController.popoverPresentationController?.sourceView = self.view
			UIApplication.shared.delegate?.window??.rootViewController?.present(activityViewController, animated: true, completion: nil)
		}
		
		return [saveAction, shareAction]
	}
}
