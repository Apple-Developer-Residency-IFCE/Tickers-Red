//
//  TimerView.swift
//  Tickers
//
//  Created by userext on 24/05/23.
//

import SwiftUI

struct TimerView: View {
    
    @State var isTimerRunning = false
    @State private var progressTimer: Double = 1.0
    @State private var startTime = Date()
    @State private var timerString = "0:00"
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    let color = Color(
        red: 59 / 255,
        green: 129 / 255,
        blue: 235 / 255
    )
    
    let fadingColor = Color(
        red: 213 / 255,
        green: 224 / 255,
        blue: 249 / 255
    )
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 15) {
                ZStack(alignment: .trailing) {
                    Circle()
                        .stroke(fadingColor, lineWidth: 10)
                    Circle()
                        .trim(from: 0, to: progressTimer)
                        .stroke(color, lineWidth: 10)
                    ballKnobView
                    Circle()
                        .fill(fadingColor)
                        .frame(width: 10, height: 10)
                        .offset(x: 5)
                        .opacity(1)
                }
                .padding()
                .frame(height: geo.size.width)
                .rotationEffect(.degrees(90))
                .rotation3DEffect(
                    .degrees(180),
                    axis: (x: 0, y: 1, z: 0)
                )
                .animation(.spring(), value: progressTimer)
                .overlay {
                    Text(self.timerString)
                        .font(.largeTitle)
                        .foregroundColor(color)
                    
                }
                .onReceive(timer) { _ in
                    progressTimer -= 0.1
                    if (progressTimer <= 0.0) {
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
