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
    
//        sampleTextField.rx.text.orEmpty
//            .asDriver()
//            .drive(sampleLabel.rx.text)
//            .disposed(by: disposeBag)
        // input
        
       bind2()
        
       
    }

    
    func bind() {
        // input
        let viewModel = ViewModel(
            input: (
                textFieldText:
                    sampleTextField
                    .rx
                    .text
                    .orEmpty
                    .asDriver(),
                button:
                    sampleButton
                    .rx
                    .tap
                    .asSignal(),
                test:
                    sampleTextField
                    .rx
                    .text
                    .orEmpty
                    .asObservable()
            ),
            model: model
        )
        
        // output
        
        // x
//        viewModel.outputLabel
//            .drive(sampleLabel.rx.text)
//            .disposed(by: disposeBag)
//        // x
//        viewModel.outputLabel
//            .drive(sampleLabel.rx.text)
//            .disposed(by: disposeBag)
        // x
        viewModel.outputLabel
            .drive { [weak self] text in
                self?.sampleLabel.text = text
            }
            .disposed(by: disposeBag)
        
        
        
//        viewModel.outTest
//            .bind(to: sampleLabel.rx.text)
//            .disposed(by: disposeBag)
//
        viewModel.outTest
            .asDriver(onErrorDriveWith: .empty())
            .drive(sampleLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.outputLabel
            .asObservable()
            .bind(to: sampleLabel.rx.text)
            .disposed(by: disposeBag)

    }
    
    func bind2() {
        print("ok")
        
        var label: Driver<String>
        
        label =  sampleTextField.rx.text.orEmpty
                    .asDriver()
//                    .map { text in
//                        print("viewText:\(text)")
//                        return text
//                        }

        
        let viewModel = ViewModel(
            input: (
                textFieldText:
                    label,
                button: sampleButton.rx.tap.asSignal(),
                test: label.asObservable()
                
            ),
            model: model
        )
        
//        viewModel.outputLabel
//            .drive(sampleLabel.rx.text)
//            .disposed(by: disposeBag)
        
        viewModel.outTest
            .asDriver(onErrorDriveWith: .empty())
            .drive(sampleLabel.rx.text)
            .disposed(by: disposeBag)
                    
//        bind3(label: label)
    }
    
    func bind3(label: Driver<String>) {
        label.drive(sampleLabel.rx.text)
                   .disposed(by: disposeBag)
    }
    
    func bind4() {
        
    }


}

//extension ViewController: ViewModel2 {
//    var input: (textField: Driver<String>, button: Signal<Void>) {
////        textField = sampleTextField.rx.text.asDriver()
//
//    }
//
//    var output: (label: Driver<String>, ()) {
//        <#code#>
//    }
//
////    var input = ViewModel2.Input
////    var output = ViewModel2.Output
//
//
//
//}

