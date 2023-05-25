//
//  TimerView.swift
//  Tickers
//
//  Created by userext on 24/05/23.
//

import SwiftUI

struct TimerView: View {
    
    @State private var progressTimer: Double = 1.0
    @State private var count: Int = 10
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 15) {
                ZStack {
                    
                    Circle()
                        .fill(.clear)
                        .padding(-40)
                    
                    Circle()
                        .trim(from: 0, to: progressTimer)
                        .stroke(Color(red: 59 / 255, green: 129 / 255, blue: 235 / 255), lineWidth: 10)
                        .padding(-2)
                    
                    Circle()
                        .fill(.clear)
                    
                    Circle()
                        .trim(from: 0, to: progressTimer)
                        .stroke(Color.white.opacity(0.7), lineWidth: 10)
                    ballKnobView
                }
                
                .padding()
                .frame(height: geo.size.width)
                .rotationEffect(.degrees(-90))
                .animation(.spring(), value: progressTimer)
                .overlay {
                    Text("\(count)")
                        .font(.largeTitle)
                        .tint(.black)
                    
                }
                .onReceive(timer) { _ in
                    progressTimer -= 0.1
                    count -= 1
                    if (progressTimer <= 0.0 || count <= 0) {
                        timer.upstream.connect().cancel()
                    }
                }
            }
        }
        .padding(40)
    }
    
    // MARK: - View to create a ball on progress
    private var ballKnobView: some View {
        GeometryReader { knobGeo in
            Circle()
                .fill(Color(red: 59 / 255, green: 129 / 255, blue: 235 / 255))
                .frame(width: 20, height: 20)
                .overlay(
                    Circle()
                        .fill(.white)
                        .padding(5)
                )
                .frame(
                    width: knobGeo.size.width,
                    height: knobGeo.size.height,
                    alignment: .center
                )
                .offset(x: knobGeo.size.height / 2)
                .rotationEffect(.degrees(progressTimer * 360))
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
