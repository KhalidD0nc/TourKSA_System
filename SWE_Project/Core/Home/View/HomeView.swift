//
//  HomeView.swift
//  SWE_Project
//
//  Created by Khalid R on 19/03/1446 AH.
//

import SwiftUI

struct HomeView: View {
    @StateObject var weatherViewModel = WeatherViewModel()
    @State var selectedCity : City = .riyadh
    @State private var showDropDown = false
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundApp
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        
                        
//                        Text("\(String(format: "%.1f", weatherViewModel.getTemperature(for: selectedCity)))°C")
//                            .font(.ericaOne(size: 20))
//                            .foregroundColor(.primary)
                        Text("39.4°C")
                            .font(.ericaOne(size: 20))
                            .foregroundStyle(.black)
                        Spacer()
                        Image(weatherViewModel.getDayOrNightImage())
                            .resizable()
                            .frame(width: 30, height: 30)
                        Spacer()
                        citySelectionButton
                        
                    }
                    .padding(.horizontal)
                    
                    
                    
                    Spacer()
                    
                }
                
                if showDropDown {
                    dropDownView
                        .zIndex(1)
                }
                
            }
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    Text("TourKsa")
                        .font(.ericaOne(size: 28))
                        .foregroundStyle(Color.greenApp)
                }
            })
            
            .onChange(of: selectedCity) { newCity in
                // Fetch the new weather when the city changes
                weatherViewModel.fetchWeather(for: newCity)
            }
            .onAppear {
                // Fetch initial weather for the default selected city
                weatherViewModel.fetchWeather(for: selectedCity)
            }
        }
    }
}

#Preview {
    HomeView()
}

extension HomeView {
    private var citySelectionButton: some View  {
        Button {
            // Toggle dropdown
            withAnimation(.smooth) {
                showDropDown.toggle()
            }
        } label: {
            HStack {
                Text(selectedCity.title)
                    .font(.ericaOne(size: 15))
                    .foregroundColor(.white)
                Image("Down_Arrow")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .rotationEffect(.degrees(showDropDown ? 180 : 0)) // Rotate arrow when dropdown is open
            }
            .padding()
            .background(Color.greenApp)
            .cornerRadius(15)
        }
        
    }
    private var dropDownView: some View  {
        VStack {
            
            HStack {
                Spacer()
                VStack(alignment: .leading) {
                    ForEach(City.allCases, id: \.self) { city in
                        Button {
                            // Set the selected market and close the dropdown
                            withAnimation {
                                selectedCity = city
                                showDropDown = false
                            }
                        } label: {
                            HStack {
                                Text(city.title)
                                    .font(.ericaOne(size: 14))
                                    .foregroundColor(.primary)
                                Spacer()
                                if city == selectedCity {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.primary)
                                }
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                        }
                    }
                }
                .background(Color("Menu"))
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(width: 150)
                .padding(.trailing, 10)
                .offset(y: -10) // Adjust dropdown position
            }
            .transition(.move(edge: .top))
            Spacer().frame(height: 450)
            
        }
    }
    
}
