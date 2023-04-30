//
//  Builder.swift
//  BooksSampleSDUI
//
//  Created by Maksim Ivanov on 28.04.2023.
//

import UIKit

protocol ParametrizedViewControllerBuilder {

    associatedtype Parameter

    func build(_ parameter: Parameter) -> UIViewController
}
