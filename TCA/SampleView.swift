//
//  SampleView.swift
//  TCA
//
//  Created by 강치우 on 1/14/24.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct Feed {
    struct State: Equatable {
        var count = 0
        var isTimerRunning = false
    }
    
    enum Action {
        case addButtonTap
        case subtractButtonTap
        case tapButton
        case timer
    }
    
    enum Cancel { case timer }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .addButtonTap:
                state.count += 1
                return .none
                
            case .subtractButtonTap:
                state.count -= 1
                return .none
                
            case .timer:
                state.count += 1
                return .none
                
            case .tapButton:
                state.isTimerRunning.toggle()
                if state.isTimerRunning {
                    return .run { send in
                        while true {
                            try await Task.sleep(for: .seconds(1))
                            await send(.timer)
                        }
                    }
                    .cancellable(id: Cancel.timer)
                } else {
                    return .cancel(id: Cancel.timer)
                }
            }
        }
    }
}

struct SampleView: View {
    
    let store: StoreOf<Feed>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewstore in
            VStack {
                Text("\(viewstore.count)")
                    .font(.largeTitle)
                    .padding()
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)
                
                HStack {
                    Button("+") {
                        viewstore.send(.addButtonTap)
                    }
                    .font(.largeTitle)
                    .padding()
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)
                    
                    Button("-") {
                        viewstore.send(.subtractButtonTap)
                    }
                    .font(.largeTitle)
                    .padding()
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)
                }
                .font(.largeTitle)
                
                Button(viewstore.isTimerRunning ? "Stop" : "Start") {
                    viewstore.send(.tapButton)
                }
                .font(.largeTitle)
                .padding()
                .background(Color.black.opacity(0.1))
                .cornerRadius(10)
            }
            
        }
    }
}

#Preview {
    SampleView(store: Store(initialState: Feed.State()) {
        Feed()
        }
    )
}
