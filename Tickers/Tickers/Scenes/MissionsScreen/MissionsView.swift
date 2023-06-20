//
//  MissionsView.swift
//  Tickers
//
//  Created by Ian Pacini on 07/06/23.
//

import SwiftUI

struct MissionsView: View {
    @ObservedObject var missionsViewModel: MissionsViewModel
    
    let columns = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                Divider()
                ScrollView{
                    LazyVGrid(columns: columns, spacing: 12) {
                        ForEach(missionsViewModel.missions, id: \.id) { mission in
                            MissionCellView(taskTotal: mission.taskTotal, taskResolved: mission.taskResolved, color: mission.color, title: mission.title, description: mission.description)
                        }
                    }//Vgrid
                    .padding(.horizontal)
                }//scrollView
                Divider()
                    .padding(.bottom, 10)
                    .padding(.top, -7)
            }
            .background{
                Color("BackgroundColor")
                    .padding(.bottom, 10)
            }
        }
        .navBarWithBackButton(blackText: "Missões")
    }
}

struct MissionsView_Previews: PreviewProvider {
    static var previews: some View {
        MissionsView(missionsViewModel: MissionsViewModel())
    }
}
