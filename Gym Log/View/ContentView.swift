//
//  ContentView.swift
//  Gym Log
//
//  Created by Ju Long on 8/2/21.
//

import SwiftUI

var maxWidth = UIScreen.main.bounds.size.width
var maxHeight = UIScreen.main.bounds.size.height

struct ContentView: View {
    @State var showMenu = false
    @State var showMain = false
    @State var showAdd = false
    @State var showDelete = true
    
    var body: some View {
        let drag = DragGesture()
            .onChanged {
                if $0.translation.width > 100 {
                    withAnimation {
                        self.showMenu = true
                    }
                }
            }
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        self.showMenu = false
                    }
                }
            }
        ZStack(alignment: .leading) {
            if self.showMain {
                MainView(showMenu: $showMenu)
                    .offset(x: self.showMenu ? maxWidth*0.7 : 0)
                    .disabled(self.showMenu ? true : false)
                    .transition(.move(edge: .leading))
                    .animation(.easeInOut(duration: 0.3))
            } else if self.showAdd {
                AddExerciseView(showMenu: $showMenu)
                    .offset(x: self.showMenu ? maxWidth*0.7 : 0)
                    .disabled(self.showMenu ? true : false)
                    .transition(.move(edge: .leading))
                    .animation(.easeInOut(duration: 0.3))
            } else if self.showDelete {
                DeleteView(showMenu: $showMenu)
                    .offset(x: self.showMenu ? maxWidth*0.7 : 0)
                    .disabled(self.showMenu ? true : false)
                    .transition(.move(edge: .leading))
                    .animation(.easeInOut(duration: 0.3))
            }
            
            if self.showMenu {
                MenuView(showMenu: $showMenu, showMain: $showMain, showAdd: $showAdd, showDelete: $showDelete)
                    .frame(width: maxWidth*0.7)
                    .transition(.move(edge: .leading))
                    .animation(.easeInOut(duration: 0.5))
            }
        }
        .gesture(drag)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
