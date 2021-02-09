//
//  MainView.swift
//  Gym Log
//
//  Created by Ju Long on 9/2/21.
//

import SwiftUI

struct MainView: View {
    @Binding var showMenu: Bool
    static let mainDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.y"
        return formatter
    }()
    static let subDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            VStack (alignment: .center, spacing: 5){
                Text("\(Date(), formatter: Self.mainDateFormat)")
                    .font(.largeTitle)
                Text("\(Date(), formatter: Self.subDateFormat)")
                    .font(.subheadline)
                    .foregroundColor(Color(.gray))
                ScrollView {
                    CardViewRow()
                }.padding(.top, 50)
            }
            .navigationBarItems(leading: (Button(action: {
                showMenu.toggle()
            }, label: {
                Image(self.showMenu ? "clear" : "menu-icon")
                    .resizable()
                    .frame(width: 30, height: 30)
            })))
        }
    }
}
