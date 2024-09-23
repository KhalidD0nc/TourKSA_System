//
//  ContainerView.swift
//  SWE_Project
//
//  Created by Khalid R on 19/03/1446 AH.
//

import SwiftUI

struct ContainerView: View {
    @State private var selectedTab: TabViewModel = .home
    var body: some View {
        VStack  {
            TabView(selection: $selectedTab) {
                Text("HomeView")
                    .tag(TabViewModel.home)
                Text("Saved View")
                    .tag(TabViewModel.saved)
                Text("Map View")
                    .tag(TabViewModel.map)
                Text("Settings View")
                    .tag(TabViewModel.settings)
            }
            customBarItem
        
        }
       
    }
}

#Preview {
    ContainerView()
}

struct NewTabItem: View  {
  
    var tab: TabViewModel = .home
    @Binding var activeTab: TabViewModel
    var body: some View {
        VStack(spacing: 5) {
            Image(activeTab == tab ? tab.tabedImages : tab.image)
                .resizable()
                .frame(width: (activeTab == tab) ? 30 : 30, height: (activeTab == tab) ? 30 : 30)
                Circle()
                .fill(Color.greenApp)
                .frame(width: 10, height: 10)
                
        
             
               
                 
      
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        
        
        .onTapGesture {
            withAnimation(.spring(duration: 0.4)) {
                activeTab = tab
            }
            
        }
    }
    
}
extension ContainerView  {
    private var customBarItem: some View {
        HStack(alignment: .bottom) {
            ForEach(TabViewModel.allCases, id: \.rawValue) {
                NewTabItem(tab: $0, activeTab: $selectedTab)
            }
        }
        
    }

}

