import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
       
        let bottomView = UIView()
        bottomView.backgroundColor = .yellow
        bottomView.layer.opacity = 1
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomView)
        bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        // Создадим экземпляр дочернего класса.
        let childViewController = UIViewController()

        // Добавляем дочерний контроллер в иерархию родителя.
        addChild(childViewController)

        // Добавляем `view` дочернего контроллера в иерархию родительской `view`.
        childViewController.view.backgroundColor = .magenta
        view.insertSubview(childViewController.view, belowSubview: bottomView)

        // Добавим констрейнты.
        if let childView = childViewController.view {
            childView.translatesAutoresizingMaskIntoConstraints = false
            childView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            childView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            childView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            childView.bottomAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        }

        // Сообщаем системе, что процесс добавления дочернего контроллера завершён.
        childViewController.didMove(toParent: self)
        
    }


}

