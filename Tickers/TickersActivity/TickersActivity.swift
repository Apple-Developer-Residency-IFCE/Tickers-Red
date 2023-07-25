//
//  TickersActivity.swift
//  TickersActivity
//
//  Created by Julia Morales on 24/07/23.
//

import WidgetKit
import SwiftUI
import ActivityKit

struct TickersActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: TickersActivityAttributes.self) { context in
            LiveActivView(context: context, color: .white)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.bottom) {
                    LiveActivView(context: context, color: .black)
                }
            } compactLeading: {
                Image("catfocus")
            } compactTrailing: {
                //TimeTrackingWidgetView(context: context)
            } minimal: {
                Image("catfocus")
            }
        }
    }
}


struct LiveActivView: View {
    let context: ActivityViewContext<TickersActivityAttributes>
    let color: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .fill(color)
                .frame(height: 97)
            
            VStack {
                HStack{
                    Text("\(context.state.timer)")
                        .bold()
                        .foregroundColor(.blue)
                    //TimerWidgetView(context: context)
                    Spacer()
                    Image("catfocus")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                Text("Foco")
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(20)
        }
        
    }
}

//struct TimerWidgetView: View {
//    let context: ActivityViewContext<TickersActivityAttributes>
//
//    var body: some View {
//        Text(context.state.timer, style: .relative)
//            .foregroundColor(.blue)
//    }
//
//}
