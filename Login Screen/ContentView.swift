//
//  ContentView.swift
//  Login Screen
//
//  Created by Joff on 31/12/22.
//

import SwiftUI



struct ContentView: View {
    var body: some View {
        
        Home()
            .preferredColorScheme(.dark)
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct Home : View {
    
    @State var email = ""
    @State var pass = ""
    
    var body : some View {
        
        GeometryReader {_ in
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .offset(y: 90)
                    
                    
                
                ZStack(alignment: .bottom) {
                    VStack{
                        HStack {
                            Text("Login")
                                .foregroundColor(.white)
                                .font(.title)
                                .fontWeight(.bold)
                                .lineLimit(0)
                                .padding(10)
                            
                            
                            Spacer(minLength: 10)
                        }
                        .padding(.top, 40)
                        
                        
                        VStack {
                            HStack(spacing: 15){
                                Image(systemName: "envelope.fill")
                                    .foregroundColor(Color("Color1"))
                                
                                TextField("Email Adress", text: self.$email)
                            }
                            Divider().background(Color.white.opacity(0.5))
                        }
                        .padding(.horizontal)
                        .padding(.top, 40)
                        
                        VStack {
                            HStack(spacing: 15){
                                Image(systemName: "eye.slash.fill")
                                    .foregroundColor(Color("Color1"))
                                
                                SecureField("Password", text: self.$email)
                            }
                            Divider().background(Color.white.opacity(0.5))
                        }
                        .padding(.horizontal)
                        .padding(.top, 30)
                        
                        HStack{
                            Spacer(minLength: 10)
                            Button(action: {
                                
                            }) {
                                Text("Forget password?")
                                    .foregroundColor(Color.white.opacity(0.6))
                            }
                            .padding()
                        }
                        .padding(.horizontal)
                        .padding(.top, 20)
                    }
                    .padding(.bottom, 65)
                    .background(Color("Color2"))
                    .clipShape(CShape())
                    .cornerRadius(35)
                    .padding(.horizontal,10)
                    .offset(y: 90)
                    
                    
                    //buttom...
                    
                    Button(action: {
                        
                    }) {
                        
                        Text ("LOGIN")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .padding(.horizontal, 50)
                            .background(Color("Color1"))
                            .clipShape(Capsule())
                            .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
                    }
                    //moving view down
                    .offset(y: 280)
                    
                }
                
            }
        }
        .background(Color("Color").edgesIgnoringSafeArea(.all))
    }
}

//curve...

struct CShape : Shape {
    func path(in rect: CGRect) -> Path {
        
        return Path{ path in
            path.move(to: CGPoint (x: rect.width, y:100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
}
