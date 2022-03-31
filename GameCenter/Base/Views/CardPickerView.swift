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
    let uiScreenBounds: CGRect
    
    var body: some View {
        
        HStack {
            ForEach(SearchFilter.allCases, id: \.self) { filter in
                CardPickerItem(searchFilter: filter, selection: selection, uiScreenBounds: uiScreenBounds)
                    .onTapGesture {
                        selection = filter
                    }
                
                    Spacer()
            }
        }
    }
}

struct CardPickerItem: View {
    
    var searchFilter: SearchFilter
    var selection: SearchFilter
    let uiScreenBounds: CGRect

    
    var imageName: String {
        switch searchFilter {
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
                .frame(width: uiScreenBounds.width / 2 - 80)
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
        CardPickerView(uiScreenBounds: UIScreen.main.bounds)
    }
}
