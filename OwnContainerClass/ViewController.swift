import UIKit

class ViewController: UIViewController {
    
    private var contentViewController: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
       
        let bottomView = UIView()
        bottomView.backgroundColor = .yellow
        bottomView.layer.opacity = 0.5
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomView)
        bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        let childViewController = MyViewController()
        
        addChild(childViewController)
        view.insertSubview(childViewController.view, belowSubview: bottomView)

        if let childView = childViewController.view {
            childView.translatesAutoresizingMaskIntoConstraints = false
            childView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            childView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            childView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            childView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }

        childViewController.didMove(toParent: self)
        contentViewController = childViewController
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        var newSafeArea = UIEdgeInsets()
        newSafeArea.bottom += 100
        contentViewController?.additionalSafeAreaInsets = newSafeArea
    }

}

