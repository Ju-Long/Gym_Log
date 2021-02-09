//
//  DeleteView.swift
//  Gym Log
//
//  Created by Ju Long on 9/2/21.
//

import SwiftUI

struct DeleteView: View {
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
            VStack {
                VStack (alignment: .center, spacing: 5){
                    Text("\(Date(), formatter: Self.mainDateFormat)")
                        .font(.largeTitle)
                    Text("\(Date(), formatter: Self.subDateFormat)")
                        .font(.subheadline)
                        .foregroundColor(Color(.gray))
                }
                Text("Upcoming Exercises")
                    .foregroundColor(Color(.orange))
                    .frame(width: maxWidth*0.95, height: 30, alignment: .trailing)
                    .padding(.top, 30)
                List {
                    DeleteRow()
                }.listStyle(PlainListStyle())
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
