//
//  ContentView.swift
//  Gym Log
//
//  Created by Ju Long on 8/2/21.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

struct ContentView: View {
    var db:Firestore = Firestore.firestore()
    var body: some View {
        db.collection("users").getDocuments() {
            (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    Text("\(document.data())")
                }
            }
        }
    }
}

func getCollection(db: Firestore) {
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
