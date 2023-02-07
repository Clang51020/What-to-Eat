//
//  CustomInputView.swift
//  What to Eat
//
//  Created by Chris Lang on 2/7/23.
//

import SwiftUI

struct CustomInputView: View {
    let image: String
    let placeholderText: String
    @Binding var text: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: image)
                    .foregroundColor(.gray)
                TextField(placeholderText, text: $text)
            }
            Divider()
                .background(Color.brandPurple)
        }
    }
}

struct CustomInputView_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputView(image:"envelope", placeholderText: "Email", text:.constant(""))
    }
}
