//
//  ViewController.swift
//  RxSwiftSampleApp
//
//  Created by Oh!ara on 2022/06/04.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var sampleLabel: UILabel!
    @IBOutlet weak var sampleTextField: UITextField!
    @IBOutlet weak var sampleButton: UIButton!
    
    let model = Model()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bind()
    }
    
    func bind() {
        
        // input
        let viewModel = ViewModel(
            input: (
                textFieldText: sampleTextField.rx.text.orEmpty.asDriver(),
                button: sampleButton.rx.tap.asSignal()
            ),
            model: model
        )
        
        // output
        viewModel.outputLabel
            .drive(sampleLabel.rx.text)
            .disposed(by: disposeBag)
        
    }


}

