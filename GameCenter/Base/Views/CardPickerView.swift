//
//  CardPickerView.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 30.03.2022.
//

import SwiftUI

enum SearchFilter: String, CaseIterable {
    case Online = "Online Games"
    case Offline = "Offline Games"
}

struct CardPickerView: View {
    
    @State private var selection: SearchFilter = .Offline
    
    var body: some View {
        
        HStack {
            ForEach(SearchFilter.allCases, id: \.self) { filter in
                CardPickerItem(searchFilter: filter, selection: $selection)
            }
        }
    }
}

struct CardPickerItem: View {
    
    var searchFilter: SearchFilter
    @Binding var selection: SearchFilter
    
    var imageName: String {
        switch selection {
        case .Online:
            return "wifi"
        case .Offline:
            return "wifi.slash"
        }
    }
    
    var backgroundColor: Color {
        selection == searchFilter ? Color("Secondary") : Color("BackgroundField")
    }
    
    var tintColor: Color {
        selection == searchFilter ? Color("Secondary") : Color.gray
    }
    
    var body: some View {
        
        VStack {
            
            Image(systemName: imageName)
                .frame(width: 100)
                .padding()
                .foregroundColor(selection == searchFilter ? Color.white : Color.gray)
                .background(RoundedRectangle(cornerRadius: 10).fill(backgroundColor))
            
            Text(selection.rawValue)
                .foregroundColor(tintColor)
                .modifier(FootNote())
        }
        .frame(maxWidth: .infinity)
    }
}

struct CardPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CardPickerView()
    }
}
