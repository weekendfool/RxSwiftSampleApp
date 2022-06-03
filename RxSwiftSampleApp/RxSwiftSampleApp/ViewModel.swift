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
    
    // MARK: - input
    init(
        input: (
            textFieldText: Driver<String>,
            button: Signal<Void>
        ),
        model: Model
    ) {
        let model = model
        
        outputLabel = input.textFieldText.map { text in
            print("text:\(text)")
            return model.addStar(text: text)
        }
        
        outputLabel = input.button.map { _ -> String in
            print("button tap")
            return "buttn tap deth"
        }
        .asDriver(onErrorDriveWith: .empty())
    }
    
}
