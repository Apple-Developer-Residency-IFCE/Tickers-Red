//
//  TimerView.swift
//  Tickers
//
//  Created by userext on 24/05/23.
//

import SwiftUI

struct TimerView: View {
    
    // MARK: - Properties
    @State var isTimerRunning: Bool = false
    @State private var progressTimer: Double = 1.0
    @State var durationInSecond: TimeInterval
    
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
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
    
    let stepTimer: TimeInterval
    
    init(durationInSecond: TimeInterval) {
        self.durationInSecond = durationInSecond
        self.stepTimer = 1/(durationInSecond)
    }
    
    // MARK: -  Actions
    func stop() {
        timer.upstream.connect().cancel()
    }
    func start() {
        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    }
    
    func configureTimer(_ toRunOrReload: Bool) {
        isTimerRunning = toRunOrReload
        if isTimerRunning {
            guard durationInSecond > 0 else { return }
            start()
        } else {
            stop()
        }
    }
    // MARK: Views
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
                    componentView
                }
                .onReceive(timer) { _ in
                    progressTimer -= 0.1
                    if (progressTimer <= 0.0 || durationInSecond <= 0) {
                        configureTimer(true)
                    }
                }
            }
        }
        .padding(40)
        
    } //: Body View
    
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
    
    
    // MARK: View to create buttons of body view
    private var componentView: some View {
        VStack(spacing: 20) {
            Text("\(durationInSecond.timeString)")
                .font(.system(size: 60, weight: .medium, design: .rounded))
                .foregroundColor(color)
            HStack(alignment: .bottom, spacing: 20) {

                Button {
                    print("Reiniciando o timer")
                } label: {
                    Image("restartWatch")
                }

                Button {
                    print("Iniciando o timer")
                } label: {
                    Image("playButton")
                        .padding(.bottom, 10)
                }
        
                Button {
                    print("Pulando o timer")
                } label: {
                    Image("skipRest")
                }
                
            } //: HStack
        }//: VStack
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(durationInSecond: 12)
    }
}
