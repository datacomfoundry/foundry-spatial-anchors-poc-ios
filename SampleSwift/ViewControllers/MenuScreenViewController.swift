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
    @IBOutlet weak var scenePreviewView2: SCNView!

    override func viewDidLoad() {
        super.viewDidLoad()

        scenePreviewView1.delegate = self
        scenePreviewView1.autoenablesDefaultLighting = true
        scenePreviewView1.allowsCameraControl = true
        scenePreviewView1.scene = self.setupScene1()

        scenePreviewView2.delegate = self
        scenePreviewView2.autoenablesDefaultLighting = true
        scenePreviewView2.allowsCameraControl = true
        scenePreviewView2.scene = self.setupScene2()

    }

    func setupScene1() -> SCNScene? {

        guard let scene = SCNScene(named: "art.scnassets/toy_biplane.usdz")
        else { return nil }

        return scene
    }

    func setupScene2() -> SCNScene? {

        guard let scene = SCNScene(named: "art.scnassets/ship.scn")
        else { return nil }

        return scene
    }
}
