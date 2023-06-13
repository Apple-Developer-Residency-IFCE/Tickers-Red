//
//  TimerView.swift
//  Tickers
//
//  Created by userext on 24/05/23.
//

import SwiftUI

struct TimerView: View {
    
    // MARK: - Properties
    private let color = Color(
        red: 59 / 255,
        green: 129 / 255,
        blue: 235 / 255
    )
    
    private let fadingColor = Color(
        red: 213 / 255,
        green: 224 / 255,
        blue: 249 / 255
    )
    
    private let durationInSecond: TimeInterval
    private let isTimerRunning: Bool
    private let progressTimer: Float
    
    private let onReset: () -> Void
    private let onPlayPause: () -> Void
    private let onSkip: () -> Void
    
    init(
        durationInSecond: TimeInterval,
        isTimerRunning: Bool,
        progressTimer: Float,
        onReset: @escaping () -> Void,
        onPlayPause: @escaping () -> Void,
        onSkip: @escaping () -> Void
    ) {
        self.durationInSecond = durationInSecond
        self.isTimerRunning = isTimerRunning
        self.progressTimer = progressTimer
        self.onReset = onReset
        self.onPlayPause = onPlayPause
        self.onSkip = onSkip
    }
    
    // MARK:  - Views
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 15) {
                ZStack(alignment: .trailing) {
                    Circle()
                        .stroke(fadingColor, lineWidth: 5)
                    Circle()
                        .trim(from: 0, to: CGFloat(progressTimer))
                        .stroke(color, lineWidth: 5)
                    Circle()
                        .fill(fadingColor)
                        .frame(width: 10, height: 10)
                        .offset(x: 5)
                        .opacity(1)
                    ballKnobView
                }
                .padding()
                .frame(height: geo.size.width)
                .rotationEffect(.degrees(270))
                .rotation3DEffect(
                    .degrees(180),
                    axis: (x: 0, y: 1, z: 0)
                )
                .animation(.spring(), value: progressTimer)
                .overlay {
                    timerControlsView
                }
            }
        }
        .padding(50)
        
    } //: View
    
    // MARK: - View to create a ball on progress
    private var ballKnobView: some View {
        GeometryReader { knobGeo in
            Circle()
                .fill(color)
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
                .rotationEffect(.degrees(Double(progressTimer * 360)))
        }
    }  //: View
    
    
    // MARK: View to create buttons of body view
    private var timerControlsView: some View {
        VStack(spacing: 20) {
            Text("\(durationInSecond.timeString)")
                .font(.system(size: 60, weight: .medium, design: .rounded))
                .foregroundColor(color)
            HStack(alignment: .bottom, spacing: 20) {

                Button {
                    onReset()
                } label: {
                    Image("restartWatch")
                }

                Button {
                    onPlayPause()
                } label: {
                    Image(isTimerRunning ? "pauseWatch" : "playButton")
                        .padding(5).padding(.bottom, 10)
                }
        
                Button {
                    onSkip()
                } label: {
                    Image("skipRest")
                }
                
            } //: HStack
        } //: VStack
    } //: View
}

 //MARK: - Preview

struct TimerView_Previews: PreviewProvider {
    @State static var timer: TimeInterval = 15
    static var previews: some View {
        TimerView(
            durationInSecond: timer,
            isTimerRunning: true,
            progressTimer: 1.0,
            onReset: { print("Reset button pressed.") },
            onPlayPause: { print("Play/Pause button pressed.") },
            onSkip: { print("Skip button pressed.") }
        )
    }
}
