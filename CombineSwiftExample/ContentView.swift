//
//  ContentView.swift
//  CombineSwiftExample
//
//  Created by Akash gupta on 24/10/24.
//

import SwiftUI

struct CombineView: View {
    @StateObject var viewmodel = CombineViewModel()
    
    var body: some View {
        VStack {
            List(viewmodel.items, id: \.self) {
                item in
                Text(item)
            }
        }
        .padding()
        Button(action:{
            viewmodel.addItem("Ravindra")
        }){
            Text("Add New Item")
        }
    }
}

#Preview {
    CombineView()
}
