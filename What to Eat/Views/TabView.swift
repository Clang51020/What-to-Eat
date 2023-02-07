//
//  TabView.swift
//  What to Eat
//
//  Created by Chris Lang on 1/21/23.
//

import SwiftUI

struct TabView: View {
    @State var currentTab: Int = 0
    @State var text: String = ""
    let tabs = ["Favorites", "Results", "Search", "Settings", "Profile"]
    let icons = ["heart.fill", "list.bullet.circle","plus.circle","gear","person.circle.fill"]
    
    var body: some View {
        VStack {
            ZStack {
                TextField("Holding Text", text: $text)
                    .textFieldStyle(.plain)
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.brandPurple, lineWidth: 3)
                    }.padding(.horizontal)
            }
            Spacer()
            tabItems
        }
    }
}

extension TabView {
    var tabItems: some View {
        HStack(alignment:.bottom) {
            ForEach(0...4, id:\.self) { tab in
                VStack(alignment: .center) {
                    Image(systemName: icons[tab])
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(tab == currentTab ? .cyan : .black)
                    Text(tabs[tab])
                        .font(.caption)
                        .foregroundColor(tab == currentTab ? .cyan : .black)
                }.onTapGesture { withAnimation {currentTab = tab }}
                    .padding(.horizontal,10)
            }
        }
    }
    
    
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView()
    }
}
