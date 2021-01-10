import UIKit

class GeneralAboutViewController: AboutViewController {
	@IBOutlet weak var descriptionText: UITextView!
	@IBOutlet weak var wikiImage: UIImageView!
	@IBOutlet weak var nasaImage: UIImageView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if let let_description = body.description {
			descriptionText.text = let_description
		}
		
		let touchWiki = UITapGestureRecognizer(target: self, action:#selector(self.openWiki))
		touchWiki.numberOfTapsRequired = 1
		wikiImage.addGestureRecognizer(touchWiki)
		
		let touchNasa = UITapGestureRecognizer(target: self, action:#selector(self.openNASA))
		touchNasa.numberOfTapsRequired = 1
		nasaImage.addGestureRecognizer(touchNasa)
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	@objc func openWiki() {
		if let let_wiki = body.wiki {
			UIApplication.shared.open(URL(string: let_wiki)!, options: [:])
		}
	}
	
	@objc func openNASA() {
		if let let_nasa = body.nasa {
			UIApplication.shared.open(URL(string: let_nasa)!, options: [:])
		}
	}
}
