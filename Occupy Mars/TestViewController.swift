import UIKit

class WebBrowserController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        webView.loadRequest(URLRequest(url: URL(string: "https://www.timeanddate.com/astronomy/night/")!))
    }
}
