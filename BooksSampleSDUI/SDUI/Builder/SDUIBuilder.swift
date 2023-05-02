//
//  SDUIBuilder.swift
//  BooksSampleSDUI
//
//  Created by Maksim Ivanov on 02.05.2023.
//

import CoreModule
import UDF
import UIKit

struct SDUIDependency {
    let title: String
    let url: String
    let urlOpener: (URL) -> Void
    let config: Config
}

struct SDUIBuilder: ViewControllerBuilder {

    let dependency: SDUIDependency

    func build() -> UIViewController {
        let logger = LoggerImpl(category: "\(dependency.title) SDUI")
        let getUIDataEffect = GetUIDataEffect(url: dependency.url, service: service(), logger: logger)
        let sdui = SDUI(getUIDataEffect: getUIDataEffect)
        let store = Store<SDUI.State>(state: .init(), reducer: sdui.reducer)
        let sduiViewController = SDUIViewController(
            title: dependency.title,
            dispatch: { store.dispatch($0) },
            urlOpener: dependency.urlOpener
        )

        let disposable = store.onAction(with: { (state, action) in
            logger.debug("SDUI \(action) action")
        })

        sduiViewController.connect(to: store, stateToProps: { (state, _) in state.uiData })
        disposable.dispose(on: sduiViewController.disposer)

        return sduiViewController
    }

    private func service() -> DataService {
        dependency.config.isDataServiceMocked ?
            DataServiceMock(dependency.url) :
            DataServiceImpl(url: dependency.url, httpClient: HttpClientImpl())
    }
}
