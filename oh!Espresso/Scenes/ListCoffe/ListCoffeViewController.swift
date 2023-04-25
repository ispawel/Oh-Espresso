//
//  ListCoffeViewController.swift
//  oh!Espresso
//
//  Created by Pavel Isakov on 17.04.2023.
//

import UIKit
import Stevia

//MARK: - View Controller
class ListCoffeViewController: UIViewController {

    // MARK: - Imputs
    private let uiColor = UIColors()
    
    // MARK: - Output
    var didSendEventClosure: ((ListCoffeViewController.Event) -> Void)?
    
    // MARK: - Methods
    let namesListCoffe: [String] = ["Espresso", "Cold Brew", "V60", "Latte", "Cappichino", "Raf", "Flat White"]
    let volumeListCoffe: [Int] = [36, 100, 250, 230, 180, 250, 150]
    
    
    func fillMainStack(){
        for i in 0..<namesListCoffe.count {
            let nameCoffeLabel: UILabel = {
                let label = UILabel()
                label.font = UIFont(name: "title1", size: 13)
                label.text = "\(namesListCoffe[i])"
                return label
            }()
            
            let volumeCoffeLabel: UILabel = {
                let label = UILabel()
                label.font = UIFont(name: "title3", size: 12)
                label.textColor = .white
                label.text = "\(volumeListCoffe[i]) g"
                return label
            }()
            
            let sectionElemenHStackView: UIStackView = {
                let stackView = UIStackView()
                stackView.layer.cornerRadius = 10
                stackView.axis = .horizontal
                stackView.distribution = .fill
                stackView.width(view.frame.width - 100)
                stackView.height(90)
                stackView.backgroundColor = UIColor(hue: 0.47, saturation: 0.07, brightness: 1.0, alpha: 0.4)
                return stackView
            }()
            sectionElemenHStackView.addArrangedSubview(nameCoffeLabel)
            sectionElemenHStackView.addArrangedSubview(volumeCoffeLabel)
            vStackMainView.addArrangedSubview(sectionElemenHStackView)
        }
    }
    
    //MARK: - Subviews
    
    let titleListCoffeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "title1", size: 18)
        label.text = "Enter Coffe"
        return label
    }()

    //MARK: - Containers
    
    private let scrollMainView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.layer.cornerRadius = 10
        return scrollView
    }()
    
    private let vStackMainView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.layer.cornerRadius = 10
        return stackView
    }()
    
    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup
        uiColor.gradient.frame = view.bounds
        view.layer.addSublayer(uiColor.gradient)
        vStackMainView.backgroundColor = UIColor(hue: 0.47, saturation: 0.07, brightness: 0.5, alpha: 0.4)
        scrollMainView.backgroundColor = UIColor(hue: 0.47, saturation: 0.07, brightness: 1.0, alpha: 0.4)

        
        // Subviews
        view.subviews(
            titleListCoffeLabel,
            scrollMainView.subviews(
                vStackMainView
            )
        )
        titleListCoffeLabel.centerHorizontally()
        fillMainStack()
        
        
        // layout

        scrollMainView.followEdges(view, top: 50, bottom: -50, leading: 20, trailing: -20)
        vStackMainView.followEdges(scrollMainView, top: 10, bottom: -10, leading: 10, trailing: -10)
        
        
    }
    

    @objc private func didTapLoginButton(_ sender: Any) {
        didSendEventClosure?(.listCoffe)
    }
}

//MARK: -
extension ListCoffeViewController {
    enum Event {
        case listCoffe
    }
}
