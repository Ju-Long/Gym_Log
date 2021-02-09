//
//  AddExerciseView.swift
//  Gym Log
//
//  Created by Ju Long on 9/2/21.
//

import SwiftUI
import AlertX

struct AddExerciseView: View {
    @State private var exercise = SelectedExercise()
    @State var date = Date()
    @State var showChoose = false
    @State private var showSet = false
    @State private var showRep = false
    @State private var showWeight = false
    @State private var showAlert = false
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
            VStack (spacing: 15){
                VStack (alignment: .center, spacing: 5){
                    Text("\(Date(), formatter: Self.mainDateFormat)")
                        .font(.largeTitle)
                    Text("\(Date(), formatter: Self.subDateFormat)")
                        .font(.subheadline)
                        .foregroundColor(Color(.gray))
                }
                    DatePicker (
                        "",
                        selection: $exercise.date,
                        in: Date()...,
                        displayedComponents: .date
                    )
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .colorInvert()
                    .colorMultiply(Color(.orange))
                    
                List {
                    HStack {
                        Text("Choose an Exercise")
                            .font(.title3)
                        Spacer()
                        Button(action: {
                            showChoose.toggle()
                        }, label: {
                            HStack {
                                Text("\(exercise.name)")
                                    .foregroundColor(Color(.orange))
                                    .font(.title3)
                                Text(">")
                                    .foregroundColor(.gray)
                            }
                        })
                        .sheet(isPresented: $showChoose, content: {
                            ChooseNewExerciseView()
                        })
                    }.frame(height: 40)
                    
                    HStack {
                        Text("Choose The Amount of Sets")
                            .font(.title3)
                        Spacer()
                        Button(action: {
                            showSet.toggle()
                            showRep = false
                            showWeight = false
                        }, label: {
                            HStack {
                                Text("\(exercise.sets)")
                                    .foregroundColor(Color(.orange))
                                    .font(.title3)
                                Text(self.showSet ? "⌄" : ">")
                                    .foregroundColor(.gray)
                            }
                        })
                    }.frame(height: 40)
                    
                    if showSet {
                        HStack {
                            Spacer()
                            Picker("", selection: $exercise.sets) {
                                ForEach(0..<31) { index in
                                    Text("\(index)").tag(index)
                                }
                            }
                        }
                    }
                    
                    HStack {
                        Text("Choose The Amount of Reps")
                            .font(.title3)
                        Spacer()
                        Button(action: {
                            showRep.toggle()
                            showSet = false
                            showWeight = false
                        }, label: {
                            HStack {
                                Text("\(exercise.reps)")
                                    .foregroundColor(Color(.orange))
                                    .font(.title3)
                                Text(self.showRep ? "⌄" : ">")
                                    .foregroundColor(.gray)
                            }
                        })
                    }.frame(height: 40)
                    
                    if showRep {
                        HStack {
                            Spacer()
                            Picker("", selection: $exercise.reps) {
                                ForEach(0..<31) { index in
                                    Text("\(index)").tag(index)
                                }
                            }
                        }
                    }
                    
                    HStack {
                        Text("Choose The Weight (optional)")
                            .font(.title3)
                        Spacer()
                        Button(action: {
                            showWeight.toggle()
                            showSet = false
                            showRep = false
                        }, label: {
                            HStack {
                                Text("\(exercise.weight, specifier: "%.1f")")
                                    .foregroundColor(Color(.orange))
                                    .font(.title3)
                                Text(self.showWeight ? "⌄" : ">")
                                    .foregroundColor(.gray)
                            }
                        })
                    }.frame(height: 40)
                    
                    if showWeight {
                        HStack {
                            Spacer()
                            Picker("", selection: $exercise.weight) {
                                ForEach(Array(stride(from: 0, to: 500, by: 2.5)), id:\.self) { index in
                                    Text("\(index, specifier: "%.1f")").tag(index)
                                }
                            }
                        }
                    }
                }
                .listStyle(PlainListStyle())
                Button(action: {
                    showAlert.toggle()
                }, label: {
                    Text("Schedule")
                        .foregroundColor(.white)
                })
                .frame(width: maxWidth*0.4, height: 70, alignment: .center)
                .background(RoundedCorners(tl: 20, tr: 20, bl: 20, br: 20).fill(Color(.orange)))
                .alertX(isPresented: $showAlert, content: {
                    if (exercise.name == "Please Select" || exercise.sets == 0 || exercise.reps == 0) {
                        return AlertX(title: Text("Please choose at least an exercise and more than 0 sets and reps"), primaryButton: .default(Text("Ok")), theme: .light())
                    } else {
                        return AlertX(title: Text(exercise.date, formatter: Self.mainDateFormat), message: Text("\(exercise.name) \n\(exercise.sets) Sets, \(exercise.reps) Reps, \(exercise.weight)"), primaryButton: .cancel(), secondaryButton: .default(Text("Schedule"), action: {
                            
                        }), theme: .sun(withTransparency: false, roundedCorners: true), animation: .fadeEffect())
                    }
                })
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
