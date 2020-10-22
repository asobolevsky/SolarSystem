//
//  ViewController.swift
//  SolarSystem
//
//  Created by Aleksei Sobolevskii on 2020-10-14.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private var statusLabel: UILabel!
    @IBOutlet private var sceneView: ARSCNView!
    
    
    // MARK: - Properties
    
    var trackingStatus: String = "" {
        didSet {
            updateUI()
        }
    }
    
    // MARK: - View cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        sceneView.showsStatistics = true
        let scene = SCNScene(named: "SolarSystem.scnassets/SolarSystemScene.scn")!
        sceneView.scene = scene
        sceneView.allowsCameraControl = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard ARWorldTrackingConfiguration.isSupported else {
            print("*** ARConfig: AR World Tracking Not Supported")
            return
        }
        
        let config = ARWorldTrackingConfiguration()
        config.worldAlignment = .gravity
        config.providesAudioData = false
        sceneView.session.run(config)
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
    
    // MARK: - Private
    
    private func updateUI() {
        print("Setting status: \(trackingStatus)")
        statusLabel.text = trackingStatus
    }
    
}


extension ViewController: ARSCNViewDelegate {
    
    // MARK: - SCNSceneRendererDelegate
    
    // Is called 60 t/sec
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
    }
    
    
    // MARK: - ARSCNViewDelegate
    
    internal func session(_ session: ARSession, didFailWithError error: Error) {
        trackingStatus = "AR Session Failure: \(error)"
    }
    
    internal func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        trackingStatus = "AR Session Was Interrupted!"
    }
    
    internal func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        trackingStatus = "AR Session Interruption Ended"
    }
    
    func session(_ session: ARSession, cameraDidChangeTrackingState camera: ARCamera) {
        switch camera.trackingState {
        case .notAvailable:
            trackingStatus = "Tacking: Not available!"
            break
            
        case .normal:
            trackingStatus = ""
            break
            
        case .limited(let reason):
            switch reason {
            case .excessiveMotion:
                trackingStatus = "Tracking: Limited due to excessivemotion!"
            case .insufficientFeatures:
                trackingStatus = "Tracking: Limited due to insufficient features!"
            case .initializing:
                trackingStatus = "Tracking: Initializing..."
            case .relocalizing:
                trackingStatus = "Tracking: Relocalizing..."
            @unknown default:
                trackingStatus = "Tracking: Unknown..."
            }
        }
    }
    
}
