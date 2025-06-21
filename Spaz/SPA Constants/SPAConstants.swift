//
//  SPAConstants.swift
//  Spaz
//
//  Created by Muhammad Waqas Rafeeq on 10/08/2022.
//

import UIKit

struct SPAConstants {
    let appUser = "bunyanik-app"
    let appPassword = "b87c01a9f1fbc6a6d2960992eae27d1e"
    let deviceToken = "crWj3usMU:APA91bHJ6RtLy9FFLLcax4QFSgE0ALpzB3aHRzTkg1_Yux7DEBJKRdIgzoif_DFbkXJriYT4NxsxgzbGPkS8p3S2fHbW0LFAB_3hjpJeWSUFN75VQj7Cy2iOnh29SMfgYD07Iluqw1g3FLX"
    let deviceType = "iOS"
    let appName = "Spaz"
    let appColor = #colorLiteral(red: 0.262745098, green: 0.5843137255, blue: 0.9843137255, alpha: 1)
    let redColor = #colorLiteral(red: 0.8823529412, green: 0.2117647059, blue: 0.2470588235, alpha: 1)
    let textFieldBorderColor = #colorLiteral(red: 0.4470588235, green: 0.8196078431, blue: 0.5450980392, alpha: 1)
    let darkGreen = #colorLiteral(red: 0, green: 0.6549019608, blue: 0.3490196078, alpha: 1)
}

enum Envoirment {
    case Test
    case Live
}

//Here setup app envoirment for TEST or LIVE
func appEnvoirment() -> Envoirment {
    return Envoirment.Test
}
