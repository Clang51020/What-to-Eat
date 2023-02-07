//
//  CreateListView.swift
//  What to Eat
//
//  Created by Chris Lang on 2/4/23.
//

import Firebase
import FirebaseAnalytics
import SwiftUI

struct CreateListView: View {
    @State var listName: String = ""
    var body: some View {
        NavigationView {
            ZStack(alignment: .leading) {
                Color.white.ignoresSafeArea()
                VStack {
                    Text("Create A New List")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.leading)
                        .padding(.vertical)
                    VStack {
                        HStack {
                            Image(systemName: "textformat.size.larger")
                                .font(.headline)
                                .padding(.trailing)
                            TextField("List Name", text: $listName)
                                .textFieldStyle(.plain)
                        }.padding(.horizontal, 40)
                        Divider()
                            .padding(.horizontal, 40)
                    }
                    Spacer()
                }
            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading) { toolbarLeadingContent }
                ToolbarItem(placement: .navigationBarTrailing) { toolbarTrailingContent }
            }
        }
    }
}

extension CreateListView {
    var toolbarLeadingContent: some View {
        Button {
            // Hold for back button
        } label: {
            Image(systemName: "chevron.left")
                .foregroundColor(.primaryColor)
        }
    }
    
    var toolbarTrailingContent: some View {
        Button {
            // Hold for save list functionality
        } label: {
            Text("Save")
                .foregroundColor(.primaryColor)
                .fontWeight(.bold)
        }
    }
}

struct CreateListView_Previews: PreviewProvider {
    static var previews: some View {
        CreateListView()
    }
}
