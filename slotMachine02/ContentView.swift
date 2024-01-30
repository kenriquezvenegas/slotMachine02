//
//  ContentView.swift
//  slotMachine02
//
//  Created by Beatriz Enríquez on 30/01/24.
//

import SwiftUI

//The added value es unique
enum Choice: Int, Identifiable {
    var  id: Int {
        rawValue
    }
    case Success, Failure
}

struct ContentView: View {
    @State public var symbols = ["eating", "happy", "love"]
    @State public var numbers = [0,1,2]
    @State public var counter = 0
    @State private var showingAlert: Choice?
    
    var body: some View {
        ZStack{
            Image("sunshine")
                .resizable().edgesIgnoringSafeArea(.all)
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 80){
                HStack{
                    Image("fire")
                        .resizable()
                        .scaledToFit()
                        .shadow(color:.orange,radius: 1, y: 3)
                    Text("Slot Machine")
                        .font(.system(size: 30))
                        .fontWeight(.black)
                        .shadow(color:.orange,radius: 1, y: 3)
                    Image("fire")
                        .resizable()
                        .scaledToFit()
                        .shadow(color:.orange,radius: 1, y: 3)
                }
                .frame(width: .infinity, height: 50, alignment: .center)
                
                VStack(spacing: 45){
                    HStack(spacing: 35){
                        HexagonalUIView()
                            .fill(Color.white.opacity(0.8))
                            .frame(width: 100, height: 120, alignment: .center)
                            .overlay(
                                Image(symbols[numbers[0]])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 70, alignment: .center)
                                    .shadow(color:.gray, radius: 4, x: 4, y: 5)
                            )
                        HexagonalUIView()
                            .fill(Color.white.opacity(0.8))
                            .frame(width: 100, height: 120, alignment: .center)
                            .overlay(
                                Image(symbols[numbers[2]])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 70, alignment: .center)
                                    .shadow(color:.gray, radius: 4, x: 4, y: 5)
                            )
                    }
                    HexagonalUIView()
                        .fill(Color.white.opacity(0.8))
                        .frame(width: 100, height: 120, alignment: .center)
                        .overlay(
                            Image(symbols[numbers[1]])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 70, alignment: .center)
                                .shadow(color:.gray, radius: 4, x: 4, y: 5)
                        )
                    
                    HStack(spacing: 35){
                        HexagonalUIView()
                            .fill(Color.white.opacity(0.8))
                            .frame(width: 100, height: 120, alignment: .center)
                            .overlay(
                                Image(symbols[numbers[2]])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 70, alignment: .center)
                                    .shadow(color:.gray, radius: 4, x: 4, y: 5)
                            )
                        HexagonalUIView()
                            .fill(Color.white.opacity(0.8))
                            .frame(width: 100, height: 120, alignment: .center)
                            .overlay(
                                Image(symbols[numbers[0]])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 70, alignment: .center)
                                    .shadow(color:.gray, radius: 4, x: 4, y: 5)
                            )
                    }
                    Button(action: {
                        self.numbers[0] = Int.random(in: 0...self.symbols.count - 1)
                        self.numbers[1] = Int.random(in: 0...self.symbols.count - 1)
                        self.numbers[2] = Int.random(in: 0...self.symbols.count - 1)
                        counter += 1
                        
                        if (self.numbers[0] == self.numbers[1] &&  self.numbers[1] == self.numbers[2] ){
                            self.showingAlert = .Success
                            self.counter = 0
                        }
                        if counter > 5 {
                            self.showingAlert = .Failure
                            self.counter = 0
                        }
                         
                        
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("yellowSM"))
                            .overlay(
                                Text("Spin")
                                    .font(.title3)
                                    .fontWeight(.black)
                                    
                            )
                            .foregroundStyle(.black)
                            .frame(width: 200, height: 40, alignment: .center)
                            .shadow(color:.gray, radius: 1, y:4)
                    })
                    
                }
            }
            .alert(item: $showingAlert) { alert -> Alert in
                switch alert {
                case .Success:
                    
                    return Alert(title: Text("YEAH! you won!!"), message:Text("Born with the charm."), dismissButton: .cancel())
                case .Failure:
                    return Alert(title: Text("Ooooooopsss!!"), message:Text("Better luck next time."), dismissButton: .cancel())
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
