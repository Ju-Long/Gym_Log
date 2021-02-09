//
//  ExerciseViewModel.swift
//  Gym Log
//
//  Created by Ju Long on 9/2/21.
//

import Foundation
import FirebaseFirestore

class ExerciseViewModel: ObservableObject, Identifiable {
    @Published var exercise = [Exercise]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("exercise").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("no exercise")
                return
            }
            
            self.exercise = documents.map { queryDocumentSnapshot -> Exercise in
                let data = queryDocumentSnapshot.data()
                let name = data["name"] as? [String] ?? []
                let imageName = data["imageName"] as? [String] ?? []
                
                return Exercise(name: name, imageName: imageName)
            }
        }
    }
}
