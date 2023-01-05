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
    
    @State var index = 0
    
    var body : some View {
        
        GeometryReader {_ in
            
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 60, height: 60)
                    //.offset(y: 90)

                ZStack{
                    
                    SignUP(index: self.$index)
                        //changing view order...
                        .zIndex(Double(self.index))
                    
                    Login(index: self.$index)
                    
                }
                //lines and OR"
                HStack(spacing: 15){
                    Rectangle()
                        .fill(Color("Color1"))
                        .frame(height: 1)
                    
                    Text ("OR")
                    
                    Rectangle()
                        .fill(Color("Color1"))
                        .frame(height: 1)
                }
                .padding(.horizontal, 20)
                .padding(.top, 50)
                .offset(y: -10)
                
                //Login whit other acounts...
                HStack(spacing: 25) {
                    
                    Button(action: {
                        
                    }) {
                        Image("apple")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                    
                    Button(action: {
                        
                    }) {
                        Image("fb")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                    
                    Button(action: {
                        
                    }) {
                        Image("twitter")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                    
                    Button(action: {
                        
                    }) {
                        Image("google")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                    
                }
                .padding(.top, 30)
                .offset(y: -20)
            }
            .padding(.vertical)
            
        }
        .background(Color("Color").edgesIgnoringSafeArea(.all))
    }
}

//curve...

struct CShape : Shape {
    func path(in rect: CGRect) -> Path {
        
        return Path{ path in
            
            //right side curve
            
            path.move(to: CGPoint (x: rect.width, y:100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
}

struct CShape1 : Shape {
    func path(in rect: CGRect) -> Path {
        
        return Path{ path in
            
            //left side curve
            
            path.move(to: CGPoint (x: 0, y:100))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x:  rect.width, y: 0))
        }
    }
}

// Login page...

struct Login : View {

    @State var email = ""
    @State var pass = ""
    @Binding var index : Int
    
    var body: some View{
        
        ZStack(alignment: .bottom) {
            
            VStack{
                
                HStack {
          
                    VStack(spacing: 10){
                        
                        Text("Login")
                            .foregroundColor(self.index == 0 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                            .lineLimit(0)
                            .padding(10)
                        
                        Capsule()
                            .fill(self.index == 1 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                    
                    
                    Spacer(minLength: 10)
                }
                .padding(.top, 30)//for top curve...
                
                
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
                        
                        SecureField("Password", text: self.$pass)
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
            .contentShape(CShape())
            //shadow...
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                
                self.index = 0
           
            }
            .cornerRadius(35)
            .padding(.horizontal,10)
            //.offset(y: 90)
            
            
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
            .offset(y: 20)
            .opacity(self.index == 0 ? 1 : 0)
                
            
        }
    }
}

// SignUP page...

struct SignUP : View {
    
    @State var email = ""
    @State var pass = ""
    @State var Repass = ""
    @Binding var index : Int
    
    var body: some View{
        
        ZStack(alignment: .bottom) {
            VStack{
                HStack {
                    
                    Spacer(minLength: 10)
                    
                VStack(spacing: 10){
                    
                    Text("SignUp")
                        .foregroundColor(self.index == 1 ? .white : .gray)
                        .font(.title)
                        .fontWeight(.bold)
                        .lineLimit(0)
                        .padding(10)
                    
                    Capsule()
                        .fill(self.index == 1 ? Color.blue : Color.clear)
                        .frame(width: 100, height: 5)
                        
                    }
                }
                .padding(.top, 20)//for top curve
                
                
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
                        
                        SecureField("Password", text: self.$pass)
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                //replacing forget passaword with reenter password
                //so same height will be maintained
                
                VStack {
                    HStack(spacing: 15){
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color1"))
                        
                        SecureField("Password", text: self.$Repass)
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .padding()
            //Botton padding
            .padding(.bottom, 65)
            .background(Color("Color2"))
            .clipShape(CShape1())
            //clipping the content shape also for gesture...
            .contentShape(CShape1())
            //shadow...
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                
                self.index = 1
           
            }
            .cornerRadius(35)
            .padding(.horizontal,10)
            //.offset(y: 90)
            
            
            //Buttom...
            
            Button(action: {
                
            }) {
                
                Text ("SIGNUP")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Color1"))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            //moving view down...
           .offset(y: 20)
            //hiding view when it in background...
            //only button...
            .opacity(self.index == 1 ? 1 : 0)
        }
    }
}

