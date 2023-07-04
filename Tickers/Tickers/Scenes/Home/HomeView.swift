//
//  HomeView.swift
//  Tickers
//
//  Created by Ian Pacini on 07/06/23.
//

import SwiftUI

struct HomeView<T: Identifiable>: View {
    
    // MARK: - Properties
    @ObservedObject var tickersViewModel: TickersViewModel
    @ObservedObject var achievementViewModel: AchievementHomeViewModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                Divider()
                createScrollView(
                    title: "Escolha um Ticker para cuidar",
                    items: tickersViewModel.tickers
                ) { item in
                    CardPetView(
                        isLocked: item.isLocked,
                        actualProgress: item.actualProgress,
                        totalProgress: item.totalProgress,
                        tickerLevel: item.tickerLevel,
                        tickerImage: item.tickerImage,
                        tickerEgg: item.tickerEgg,
                        tickerName: item.tickerName
                    )
                }
                createScrollView(
                    title: "Conquistas",
                    items: achievementViewModel.achievements
                ) { item in
                    AchievementCardsHomeView(
                        isLocked: item.isLocked,
                        title: item.title,
                        subTitle: item.subtitle
                    )
                }
            } //: VStack
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.leading)
            .background(Color("BackgroundColor"))
        } //: Nav
    }
    
    // MARK: - ScrollView
    private func createScrollView<Item, Content: View>(
        title: String,
        items: [Item],
        @ViewBuilder content: @escaping  (Item) -> Content
    ) -> some View where Item: Identifiable {
        VStack(spacing: 0) {
            ShowAllButtonView(title: title)
            ScrollView(.horizontal) {
                LazyHStack(spacing: 15) {
                    ForEach(items) { item in
                        content(item)
                    }
                } //: LazyHStack
                .padding()
            } //: ScrollView
        } //: VStack
        .fixedSize(horizontal: false, vertical: true)
    } //: createScrollView
}


// MARK: - PreviewProvider
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView<Ticker>(
            tickersViewModel: TickersViewModel(),
            achievementViewModel: AchievementHomeViewModel()
        )
    }
}
