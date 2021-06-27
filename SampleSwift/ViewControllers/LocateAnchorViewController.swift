//
//  LocateAnchorViewController.swift
//  SampleSwift
//
//  Created by Dipesh Trikam on 23/06/21.
//  Copyright © 2021 Microsoft. All rights reserved.
//

// This demo creates and saves an anchor. It then locates it with its identifier.
class LocateAnchorViewController: BaseViewController {

    override func onCloudAnchorCreated() {
        ignoreMainButtonTaps = false
        step = .lookForAnchor

        DispatchQueue.main.async {
            self.feedbackControl.isHidden = true
            self.mainButton.setTitle("Tap to start next Session & look for Anchor", for: .normal)
        }
    }

    override func onLocateAnchorsCompleted() {
        ignoreMainButtonTaps = false
        step = .stopSession

        DispatchQueue.main.async {
            self.feedbackControl.isHidden = true
            self.mainButton.setTitle("Anchor found! Tap to stop session", for: .normal)
        }
    }

    @objc override func mainButtonTap(sender: UIButton) {
        if (ignoreMainButtonTaps) {
            return
        }

        switch (step) {
        case .prepare:
            mainButton.setTitle("Tap to start Session", for: .normal)
            step = .lookForAnchor
        case .createCloudAnchor:
            ignoreMainButtonTaps = true
            currentlyPlacingAnchor = true
            saveCount = 0

            startSession()

            // When you tap on the screen, touchesBegan will call createLocalAnchor and create a local ARAnchor.
            // We will then put that anchor in the anchorVisuals dictionary with a special key and call CreateCloudAnchor when there is enough data for saving.
            // CreateCloudAnchor will call onCloudAnchorCreated when its async method returns to move to the next step.
            mainButton.setTitle("Tap on the screen to create an Anchor ☝️", for: .normal)
        case .lookForAnchor:
            ignoreMainButtonTaps = true
//            stopSession()
            startSession()

            // We will get a call to onLocateAnchorsCompleted which will move to the next step when the locate operation completes.
            locateAnchorWithId(targetIds: ["57c3008b-38c2-44ee-8c4f-0177c25c0749"])
        case .deleteFoundAnchors:
            ignoreMainButtonTaps = true

            // DeleteFoundAnchors will move to the next step when its async method returns
            deleteFoundAnchors()
        case .stopSession:
            stopSession()
            moveToMainMenu()
        default:
            assertionFailure("Demo has somehow entered an invalid state")
        }
    }
//    override func onLocateAnchorsCompleted() {
//        ignoreMainButtonTaps = false
//
//        DispatchQueue.main.async {
//            self.feedbackControl.isHidden = true
//            self.mainButton.setTitle("Anchor found!", for: .normal)
//        }
//    }
//
//    @objc override func mainButtonTap(sender: UIButton) {
//
//        startSession()
//
//            // We will get a call to onLocateAnchorsCompleted which will move to the next step when the locate operation completes.
//        locateAnchorWithId(targetIds: ["57c3008b-38c2-44ee-8c4f-0177c25c0749"])
//    }
}

