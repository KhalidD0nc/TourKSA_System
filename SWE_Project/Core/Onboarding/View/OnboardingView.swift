//
//  OnboardingView.swift
//  SWE_Project
//
//  Created by Khalid R on 06/03/1446 AH.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        ZStack {
            Image("Onboarding")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Text("TourKSA")
                    .font(.ericaOne(size: 70))
                    .foregroundStyle(.white)
                Spacer()
                VStack {
               
                        Button{
                            
                        } label: {
                            
                            
                            HStack {
                                Image(systemName: "envelope")
                                    .foregroundStyle(.black)
                                Text("Sign In With Email")
                                    .font(.ericaOne(size: 18))
                                    .foregroundStyle(.black)
                            }
                            .padding()
                            .background(.gray.opacity(0.1))
                            .cornerRadius(40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .inset(by: 0.5)
                                    .stroke(Color(red: 0.96, green: 0.96, blue: 0.96), lineWidth: 1)
                                
                            )
                        }
                        .padding(.top)
                        Spacer()
                        
                        HStack {
                            Text("Don't Have an account?")
                                .foregroundStyle(.gray.opacity(0.4))
                            Button {
                                
                            } label: {
                                Text("Sign Up")
                                
                            }  .foregroundColor(Color.blue)
                            
                            
                            
                            
                        }
                        .padding(.bottom)
                    
                    
            }
                
                .foregroundColor(.clear)
                .frame(width: 364, height: 165)
                .background(.white)
                .cornerRadius(40)
                .padding(.bottom, 80)
            }
        }
    }
}

#Preview {
    OnboardingView()
}
