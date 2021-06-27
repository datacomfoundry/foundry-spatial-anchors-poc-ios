//
//  MenuScreenViewController.swift
//  SampleSwift
//
//  Created by Dipesh Trikam on 27/06/21.
//  Copyright © 2021 Microsoft. All rights reserved.
//

import ARKit
import Foundation
import SceneKit
import UIKit

class MenuScreenViewController: UIViewController, SCNSceneRendererDelegate {

    @IBOutlet weak var scenePreviewView1: SCNView!

    override func viewDidLoad() {
        super.viewDidLoad()

        scenePreviewView1.delegate = self
        scenePreviewView1.autoenablesDefaultLighting = true
        scenePreviewView1.allowsCameraControl = true
        scenePreviewView1.scene = self.setupScene()

    }

    func setupScene() -> SCNScene? {

        guard let scene = SCNScene(named: "art.scnassets/toy_biplane.usdz")
        else { return nil }

        return scene
    }
}
