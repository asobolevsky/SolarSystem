//
//  ViewController.swift
//  SolarSystem
//
//  Created by Aleksei Sobolevskii on 2020-10-14.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    // MARK: - Outlets
    
    @IBOutlet private var statusLabel: UILabel!
    @IBOutlet private var sceneView: ARSCNView!
    
    
    // MARK: - Properties
    
    
    // MARK: - View cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        sceneView.showsStatistics = true
        let scene = SCNScene(named: "SolarSystem.scnassets/SolarSystemScene.scn")!
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
    }
    
    // MARK: - Actions
    
    @IBAction private func handleStyleButtonTap(_ button: UIButton) {
        
    }
    
    @IBAction private func handleResetButtonTap(_ button: UIButton) {
        
    }

    // MARK: - ARSCNViewDelegate
    
    internal func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    internal func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    internal func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
