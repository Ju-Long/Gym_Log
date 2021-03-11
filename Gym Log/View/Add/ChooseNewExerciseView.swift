//
//  ChooseNewExerciseView.swift
//  Gym Log
//
//  Created by Ju Long on 9/2/21.
//

import SwiftUI

struct ChooseNewExerciseView: View {
    @ObservedObject var exerciseViewModel = ExerciseViewModel()
    var body: some View {
        NavigationView {
            VStack {
                List(exerciseViewModel) { in
                    HStack {
                        
                    }
                }
            }
            .navigationBarTitle("Choose an Exercise")
            .navigationBarItems(trailing: (Button(action: {}, label: {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 20, height: 20, alignment: .center)
            })))
        }
        
    }
}

struct ChooseNewExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseNewExerciseView()
    }
}
