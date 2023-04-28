//
//  Builder.swift
//  BooksSampleSDUI
//
//  Created by Maksim Ivanov on 28.04.2023.
//

import UIKit

protocol ParamViewControllerBuilder {

    associatedtype Param

    func build(_ param: Param) -> UIViewController
}
