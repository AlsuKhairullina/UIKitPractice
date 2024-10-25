//
//  SuperVipPromoViewModel.swift
//  BadgesTutorial
//
//  Created by Alexander Korchak on 15.11.2023.
//

import Combine
import Foundation

class SuperVipPromoViewModel: ObservableObject {

    @Published var modelPublisher: SuperVipPromoModel?
    @Published var isSubscribed: Bool = false

    private var cancellables = Set<AnyCancellable>()


    func sendDataToView() {
        modelPublisher = mockData
    }
}

private extension SuperVipPromoViewModel {
    var mockData: SuperVipPromoModel {
        SuperVipPromoModel(
            mainLabelText: "Супер VIP на 30 дней",
            descriptionLabelText: "Только до 15 января вы можете подключить Супер VIP на 30 дней вместо 90 дней. Попробуйте полный безлимит всего за 45 000 UZS.",
            imageName: "premium",
            cashbackLabelText: "Вы получите кешбэк до 15%",
            connectButtonText: isSubscribed ? "Изменить сейчас" : "Подключить",
            bottomButtonText: "Изменить с 6 октября"
        )
    }
}
