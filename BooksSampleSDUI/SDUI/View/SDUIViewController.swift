//
//  BooksViewController.swift
//  BooksSampleSDUI
//
//  Created by Maksim Ivanov on 26.04.2023.
//

import Foundation
import DivKit
import LayoutKit
import UDF
import UIKit

final class SDUIViewController: UIViewController, ViewComponent {

    typealias Props = Data?

    var props: Data? = nil {
        didSet {
            guard isViewLoaded else { return }
            guard let uiData = props else { return }

            setData(uiData)
        }
    }

    private let dispatch: (Action) -> Void
    private let urlOpener: (URL) -> Void

    private lazy var divHostView = SDUIView(components: components)
    private lazy var components = DivKitComponents(
        updateCardAction: nil,
        urlOpener: { [weak self] url in
            self?.urlOpener(url)
        }
    )

    var disposer = Disposer()

    init(title: String,
         dispatch: @escaping (Action) -> Void,
         urlOpener: @escaping (URL) -> Void) {
        self.dispatch = dispatch
        self.urlOpener = urlOpener
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = title
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.95, alpha: 1.0)

        dispatch(SDUI.Action.fetchUIData)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        divHostView.frame = view.bounds.inset(by: view.safeAreaInsets)
    }

    private func setData(_ data: Data) {
        if let cards = try? SDUIJson.loadCards(data) {
            view.addSubview(divHostView)
            divHostView.setData(cards)
        }
    }
}

extension SDUIViewController: UIActionEventPerforming {

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
