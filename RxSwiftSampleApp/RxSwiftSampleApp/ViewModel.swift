//
//  ViewModel.swift
//  RxSwiftSampleApp
//
//  Created by Oh!ara on 2022/06/04.
//

import Foundation
import RxSwift
import RxCocoa


class ViewModel {
    
    // MARK: - output
    var outputLabel: Driver<String>
    var outTest: Observable<String>
    var outBool: Observable<Bool>
    
    // MARK: - input
    init(
        input: (
            textFieldText: Driver<String>,
            button: Signal<Void>,
            test: Observable<String>
        ),
        model: Model
    ) {
        let model = model
        
//        outTest = input.test.map { text -> String in
//            print("text:\(text)")
//            return text
//        }
        
        outputLabel = input.test.map { text -> String in
            print("text8:\(text)")
            return text
        }
        .asDriver(onErrorDriveWith: .empty())
        
        outputLabel = input.test.asDriver(onErrorDriveWith: .empty()).map { text -> String in
            print("text9:\(text)")
            return text
        }
//        .asDriver(onErrorDriveWith: .empty())
        

        outTest = input.textFieldText.asObservable().map { text in
            print("text4: \(text)")
            return text
        }

        outputLabel = input.textFieldText.map { text -> String in
            print("text5:\(text)")
            return text
        }
        .asDriver(onErrorDriveWith: .empty())
        
        outputLabel = input.textFieldText.asDriver().map { text in
            print("text6:\(text)")
            return text
        }
       
        
        
        _ = input.textFieldText.map { text in
            print("text3: \(text)")
        }
        
        outputLabel = input.textFieldText.map { text in
            print("text2:\(text)")
            return text
        }
        .asDriver(onErrorDriveWith: .empty())
        
        
        
        
        outputLabel = input.button.map { _ -> String in
            print("button tap")
            return "buttn tap deth"
        }
        .asDriver(onErrorDriveWith: .empty())
        
        outBool = input.textFieldText.asObservable().map { text -> Bool in
            if text.count >= 1 {
                return true
            } else {
                return false
            }
        }
        
    }
    
}
