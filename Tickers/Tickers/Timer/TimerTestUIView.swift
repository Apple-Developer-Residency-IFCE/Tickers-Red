//
//  TimerTestUIView.swift
//  Tickers
//
//  Created by Oliver Santos on 12/06/23.
//

import SwiftUI

struct TimerTestUIView: View {
        @State private var timerValue: Int = 60
        @State private var progress: Float = 0.0
        @State private var timer: Timer?

        var body: some View {
            VStack {
                Text("Timer: \(timerValue)")
                ProgressBar(progress: $progress)
                Button(action: {
                    startTimer()
                }) {
                    Text("Iniciar")
                }
                Button(action: {
                    stopTimer()
                }) {
                    Text("Parar")
                }
                Button(action: {
                    resetTimer()
                }) {
                    Text("Reiniciar")
                }
            }
            .padding()
        }

        func startTimer() {
            progress = 0.0
            let totalTime = Float(timerValue) // Tempo total inicial
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                if timerValue > 0 {
                    timerValue -= 1
                    let remainingTime = Float(timerValue)
                    progress = (totalTime - remainingTime) / totalTime
                } else {
                    stopTimer()
                }
            }
        }

        func stopTimer() {
            timer?.invalidate()
            timer = nil
        }

        func resetTimer() {
            timer?.invalidate()
            timer = nil
            timerValue = 60
            progress = 0.0
        }
    }

    struct ProgressBar: View {
        @Binding var progress: Float

        var body: some View {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: geometry.size.width, height: 20)
                        .opacity(0.3)
                        .foregroundColor(.gray)
                    Rectangle()
                        .frame(width: min(CGFloat(self.progress) * geometry.size.width, geometry.size.width), height: 20)
                        .foregroundColor(.blue)
                }
                .cornerRadius(10)
            }
        }
    }


struct TimerTestUIView_Previews: PreviewProvider {
    static var previews: some View {
        TimerTestUIView()
    }
}
