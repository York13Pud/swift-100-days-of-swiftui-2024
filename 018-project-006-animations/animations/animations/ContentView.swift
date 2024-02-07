//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount1 = 1.0
    @State private var animationAmount2 = 1.0
    @State private var animationAmount3 = 1.0
    @State private var animationAmount4 = 1.0
    @State private var animationAmount5 = 0.0

    @State private var enabled = false
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            
            HStack {
                Button("Tap Me 1") {
                    animationAmount1 += 0.25
                }
                .padding(50)
                .background(.red)
                .foregroundStyle(.white)
                .clipShape(Circle())
                .scaleEffect(animationAmount1) // Adds a scale factor to increase the size of the button
                .animation(.default,
                           value: animationAmount1) // Animates the size increase. .default has many alternatives.
                //.blur(radius: (animationAmount1 - 1) * 3)
                
                Button("Tap Me 2") {
                    animationAmount2 += 0.25
                }
                .padding(50)
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(Circle())
                .scaleEffect(animationAmount2)
                .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true),
                           value: animationAmount2)
            }
            
            HStack {
                Button("Tap Me 3") {
                    animationAmount3 += 0.25
                }
                .padding(50)
                .background(.green)
                .foregroundStyle(.white)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(.green)
                        .scaleEffect(animationAmount3)
                        .opacity(2 - animationAmount3)
                        .animation(
                            .easeOut(duration: 1)
                            .repeatForever(autoreverses: false),
                            value: animationAmount3
                        )
                )
                .onAppear {
                    animationAmount3 = 2
                }
                .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true),
                           value: animationAmount3)
                
                Button("Tap Me 4") {
                    // do nothing
                }
                .padding(50)
                .background(.purple)
                .foregroundStyle(.white)
                .clipShape(Circle())
            }
            
            HStack {
                Spacer()
                
                Stepper("Scale amount", value: $animationAmount4.animation(), in: 1...2)
                    .labelsHidden()
                
                Spacer()
                
                Button("Tap Me 5") {
                    animationAmount4 += 0.25
                }
                .padding(40)
                .background(.indigo)
                .foregroundStyle(.white)
                .clipShape(Circle())
                .scaleEffect(animationAmount4)
                
                Spacer()
            }
            
            HStack {
                Button("Tap Me 6") {
                    withAnimation(.interpolatingSpring(stiffness: 3, damping: 1)) {
                        animationAmount5 += 360
                    }
                }
                .padding(50)
                .background(.black)
                .foregroundStyle(.white)
                .clipShape(Circle())
                .rotation3DEffect(.degrees(animationAmount5), axis: (x: 0, y: 1, z: 1))
                
                Button("Tap Me 7") {
                    enabled.toggle()
                }
                .frame(width: 100, height: 100)
                .background(enabled ? .blue : .red)
                .animation(nil, value: enabled)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
                .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
            }
            
            HStack {
                Button("Tap Me 8") {
                    withAnimation {
                        isShowingRed.toggle()
                    }
                }
                .buttonStyle(.borderedProminent)
                    

                if isShowingRed {
                    Rectangle()
                        .fill(.red)
                        .frame(width: 50, height: 50)
                        .transition(.asymmetric(insertion: .scale, removal: .opacity))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
