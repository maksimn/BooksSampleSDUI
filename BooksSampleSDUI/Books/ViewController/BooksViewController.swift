//
//  BooksViewController.swift
//  BooksSampleSDUI
//
//  Created by Maksim Ivanov on 26.04.2023.
//

import DivKit
import LayoutKit
import UIKit

final class BooksViewController: UIViewController {

    private let data: Data

    private var divHostView: DivHostView!
    private var components: DivKitComponents!

    init(_ data: Data) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        components = DivKitComponents(
            updateCardAction: nil,
            urlOpener: { UIApplication.shared.open($0) }
        )
        divHostView = DivHostView(components: components)

        if let cards = try? DivJson.loadCards(data) {
            view.addSubview(divHostView)
            divHostView.setData(cards)
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        divHostView.frame = view.bounds.inset(by: view.safeAreaInsets)
    }
}

extension BooksViewController: UIActionEventPerforming {

    func perform(uiActionEvent event: UIActionEvent, from _: AnyObject) {
        switch event.payload {
        case let .divAction(params):
            components.handleActions(params: params)
            divHostView.reloadItem(cardId: params.cardId)
        case .empty,
             .url,
             .menu,
             .json,
             .composite:
            break
        }
    }
}
