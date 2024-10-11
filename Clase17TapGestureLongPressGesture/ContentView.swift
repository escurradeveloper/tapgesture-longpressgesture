//
//  ContentView.swift
//  Clase17TapGestureLongPressGesture
//
//  Created by Escurra Colquis on 11/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isTapped = false
    @GestureState private var longPress = false
    
    var body: some View {
        Text("TapGesture y LongPressGesture")
            .bold()
            .foregroundStyle(.black)
            .font(.system(size: 20))
            .padding(.top, 20)
        Spacer()
        Image(systemName: "clock")
            .font(.system(size: 300))
            .foregroundStyle(.indigo)
            .scaleEffect(isTapped ? 0.5 : 1.0)
            .animation(.linear, value: isTapped)
            //.gesture(
              //  TapGesture()
                //    .onEnded({
                  //      isTapped.toggle()
                    //}))
            .gesture(
                LongPressGesture(minimumDuration: 1.0)
                    .updating($longPress, body: { currentState, state, transaction in
                        state = currentState
                    })
                    .onEnded({ _ in
                        isTapped.toggle()
                    })
            )
        Spacer()
        
        VStack {
            Text("Mi canal en Youtube y Github:")
            Text("@escurradeveloper")
                .bold()
                .font(.system(size: 30))
        }
    }
}

#Preview {
    ContentView()
}
