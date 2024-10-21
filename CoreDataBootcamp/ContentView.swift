//
//  ContentView.swift
//  CoreDataBootcamp
//
//  Created by HaYen on 17/10/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    //    @Environment(\.managedObjectContext) private var viewContext
    //
    //    @FetchRequest(
    //        entity: FruitEntity.entity(),
    //        sortDescriptors: [NSSortDescriptor(keyPath: \FruitEntity.name, ascending: true)])
    //    var fruits: FetchedResults<FruitEntity>
    
    @EnvironmentObject private var vm: CoreDataViewModel
    @State var textFieldText: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Add fruit here ... ", text: $textFieldText)
                    .font(.headline)
                    .padding(.leading)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .frame(height: 55)
                    .background(Color(.lightGray))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Button(action: {
                    guard !textFieldText.isEmpty else {return}
                    vm.addFruit(text: textFieldText)
                    textFieldText = ""
                }, label: {
                    Text("Submit")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .frame(height: 55)
                        .background(.blue)
                        .cornerRadius(10)
                })
                .padding(.horizontal)
                
                List {
                    ForEach(vm.savedEntities) { fruit in
                        Text(fruit.name ?? "")
                            .onTapGesture {
                                vm.updateFruit(fruit: fruit)
                            }
                    }
                    .onDelete(perform: vm.deleteFruit)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Fruits")
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(CoreDataViewModel())
//        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
