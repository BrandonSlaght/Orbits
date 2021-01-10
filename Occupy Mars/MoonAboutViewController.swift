import UIKit

class MoonAboutViewController: AboutViewController, UITableViewDataSource, UITableViewDelegate  {
	
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var tableViewHeight: NSLayoutConstraint!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
		let blurView = UIVisualEffectView(effect: blurEffect)
		blurView.frame = view.bounds
		
		tableView.delegate = self
		tableView.dataSource = self
		tableView.separatorEffect = UIVibrancyEffect(blurEffect: blurView.effect as! UIBlurEffect)
		tableView.estimatedRowHeight = 200
		tableView.rowHeight = UITableView.automaticDimension
	}
	
	override func viewDidLayoutSubviews() {
		tableView.layoutIfNeeded()
		tableViewHeight.constant = tableView.contentSize.height
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return body.moons.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "MoonCell", for: indexPath) as! BodyCell
		cell.backgroundColor = UIColor.clear
		let objects = body.moons
		cell.name?.text = objects[indexPath.row].name
		setupCellScene(cell: cell, moon: objects[indexPath.row])
		
		return cell
	}
	
	func setupCellScene(cell: BodyCell, moon: Body) {
		if (cell.sceneView != nil) {
			cell.sceneView.scene = moon.getScene(size: Size.small)
			cell.sceneView.isPlaying = true
			cell.sceneView.antialiasingMode = .multisampling4X
			cell.sceneView.preferredFramesPerSecond = 15
		}
		if (cell.sceneView.scene == nil) {
			cell.heightConstraint.constant = 60
		}
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let detail = self.storyboard?.instantiateViewController(withIdentifier: "detailViewController") as? DetailViewController
		detail?.body = body.moons[indexPath.row]
		self.navigationController?.pushViewController(detail!, animated: true)
	}
}
