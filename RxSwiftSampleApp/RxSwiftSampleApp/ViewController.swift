//
//  ViewController.swift
//  RxSwiftSampleApp
//
//  Created by Oh!ara on 2022/06/04.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var sampleLabel: UILabel!
    @IBOutlet weak var sampleTextField: UITextField!
    @IBOutlet weak var sampleButton: UIButton!
    
    let model = Model()
    let disposeBag = DisposeBag()
    
//    var label: Driver<String>
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        bind()
//
//        sampleTextField.rx.text.orEmpty
//            .asDriver()
//            .drive(sampleLabel.rx.text)
//            .disposed(by: disposeBag)
        // input
        
       bind()
        
       
    }

    
    func bind() {
        // input
        let viewModel = ViewModel(
            input: (
                textFieldText: sampleTextField.rx.text.orEmpty.asDriver(),
                button: sampleButton.rx.tap.asSignal(),
                test: sampleTextField.rx.text.orEmpty.asObservable()
                
            ),
            model: model
        )
        
        // output
        viewModel.outputLabel
            .drive(sampleLabel.rx.text)
            .disposed(by: disposeBag)
        
//        viewModel.outputLabel
//            .asObservable()
//            .bind(to: sampleLabel.rx.text)
//            .disposed(by: disposeBag)

//        viewModel.outputLabel
//            .asDriver()
//            .drive(sampleLabel.rx.text)
//            .disposed(by: disposeBag)
////
//        viewModel.outputLabel
//            .asDriver(onErrorDriveWith: .empty())
//            .drive(sampleLabel.rx.text)
//            .disposed(by: disposeBag)

//        viewModel.outputLabel
//            .asObservable()
//            .bind(to: sampleLabel.rx.text)
//            .disposed(by: disposeBag)

        viewModel.outTest.asDriver(onErrorDriveWith: .empty())
            .drive(sampleLabel.rx.text)
            .disposed(by: disposeBag)

        
//                viewModel.outTest
//                    .bind(to: sampleLabel.rx.text)
//                    .disposed(by: disposeBag)

    }
    
    func bind2() {
        print("ok")
        
        var label: Driver<String>
        
        label =  sampleTextField.rx.text.orEmpty
                    .asDriver()
                    .map { text in
                        print("viewText:\(text)")
                        return text
                        }
                    
        bind3(label: label)
    }
    
    func bind3(label: Driver<String>) {
        label.drive(sampleLabel.rx.text)
                   .disposed(by: disposeBag)
    }


}

