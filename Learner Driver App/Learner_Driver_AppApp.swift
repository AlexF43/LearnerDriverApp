//
//  Learner_Driver_AppApp.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 7/1/22.
//

import SwiftUI

@main
struct LearnerDriverApp: App {
    @StateObject private var drivesContainer = DrivesContainer()
    @StateObject private var personalContainer = PersonalContainer()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(drivesContainer)
                .environmentObject(personalContainer)
        }
    }
}
//
//import UIKit
//class ViewController: UIViewController {
//    @IBOutlet weak var containerView: UIView!
//    var circularView: DriveProgressBars!
//    var duration: TimeInterval!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        circularView = DriveProgressBars()
//        circularView.center = view.center
//        containerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
//        view.addSubview(circularView)
//    }
//
//    @objc func handleTap() {
//        duration = 3.0
//        circularView.progressAnimation(duration: duration)
//    }
//}
