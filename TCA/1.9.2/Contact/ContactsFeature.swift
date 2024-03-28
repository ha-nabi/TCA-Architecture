//
//  ContactFeature.swift
//  TCA
//
//  Created by 강치우 on 3/28/24.
//

import ComposableArchitecture
import Foundation

struct Contact: Equatable, Identifiable {
    let id: UUID
    var name: String
}

@Reducer
struct ContactsFeature {
    @ObservableState
    struct State: Equatable {
        @Presents var addContact: AddContactFeature.State?
        var contacts: IdentifiedArrayOf<Contact> = []
    }
    
    enum Action {
        case addButtonTapped
        case addContact(PresentationAction<AddContactFeature.Action>)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .addButtonTapped:
                state.addContact = AddContactFeature.State(
                    contact: Contact(id: UUID(), name: "")
                )
                return .none
                
            case let .addContact(.presented(.delegate(.saveContact(contact)))):
                state.contacts.append(contact)
                return .none
                
            case .addContact:
                return .none
            }
        }
        // 하위 작업이 시스템에 들어올 때 하위 리듀서를 실행하고 모든 작업에서 상위 리듀서를 실행하는 새 리듀서가 생성됨.
        // 또한 하위 기능이 해제될 때 효과 취소 등을 자동으로 처리
        .ifLet(\.$addContact, action: \.addContact) {
            AddContactFeature()
        }
    }
}
