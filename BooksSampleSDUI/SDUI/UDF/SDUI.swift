//
//  SDUI.swift
//  BooksSampleSDUI
//
//  Created by Maksim Ivanov on 02.05.2023.
//

import Foundation
import UDF

struct SDUI {

    let getUIDataEffect: SideEffectProtocol

    struct State: Equatable {
        var uiData: Data?
    }

    enum Action: UDF.Action {
        case fetchUIData
        case uiDataFetched(Data)
    }

    func reducer(state: inout State, action: UDF.Action) -> SideEffect {
        guard let action = action as? Action else { return nil }

        switch action {
        case .fetchUIData:
            return getUIDataEffect

        case .uiDataFetched(let uiData):
            state.uiData = uiData
        }

        return nil
    }
}
