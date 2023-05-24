//
//  OnBoardingItem.swift
//  DemoApplication_ML
//
//  Created by Aarish Khanna on 24/04/23.
//

import SwiftUI
import Lottie

struct OnboardingItem: Identifiable, Equatable{
    var id: UUID = .init()
    var title: String
    var subTitle: String
    var lottieView: LottieAnimationView = .init()
}

