//
//  CheckBoxToggleStyle.swift
//  Gofer
//
//  Created by Abhishek Velekar on 01/11/25.
//

import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            
            RoundedRectangle(cornerRadius: 5.0)
                .stroke(lineWidth: 2)
                .frame(width: 20, height: 20)
                .background(configuration.isOn ? .theme : Color.clear)	
                .cornerRadius(5.0)
                .foregroundColor(.theme)
                .overlay {
                    Image(systemName: configuration.isOn ? "checkmark" : "")
                        .font(.system(size: 13))
                        .foregroundColor(.white)
                }
                .onTapGesture {
                    withAnimation(.spring()) {
                        configuration.isOn.toggle()
                    }
                }
                

            configuration.label

        }
    }
}
