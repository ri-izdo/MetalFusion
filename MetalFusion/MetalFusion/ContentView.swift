//
//  ContentView.swift
//  MetalFusion
//
//  Created by Roderick Lizardo on 1/19/24.
//

import SwiftUI
import Model3DView

struct UniversalButtonStyle: ButtonStyle {
    var isActive: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(isActive ? Color.green : Color.gray)
            .foregroundColor(.white)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}


struct ContentView: View {
    @State private var camera = PerspectiveCamera()
    @State private var isToggled = false
    @State private var isShoeButtonOn = false
    @State private var isAwardMetalButtonOn = false
    @State private var isMonsterraButtonOn = false
    @State private var isModel3DViewOn = false
    @State private var assetPath = ""
    @State private var isShuttlecockButtonOn = false
    let shoeButtonString = "Shoe"
    let awardMetalButton = "Gold"
    let monsterraButtonString = "Plant"
    let shuttlecockString = "Shuttlecock"
    let shuttlecockAssetPath = "Assets.scnassets/Shuttlecock/Shuttlecock.gltf"
    let monsteraAssetPath = "Assets.scnassets/Monsterra/monsterra.gltf"
    let shoeAssetPath = "Assets.scnassets/panoramas/shoe.gltf"
    let awardAssetPath = "Assets.scnassets/panoramas/Gold.gltf"
    let backgroundImage = "Assets.scnassets/panoramas/studio_small_09_4k.exr"

    var body: some View {
        VStack {
            buttons()
        }
        if isModel3DViewOn {
            model3DView(assetPath: assetPath)
                .frame(maxWidth: 400, maxHeight: 500)
        } else {
            Rectangle()
                .fill(Color.gray)
                .frame(maxWidth: 400, maxHeight: 500)
                .opacity(0.0)
        }
    }
    
    func buttons() -> some View {
        HStack {
            Button(shuttlecockString) {
                if !isShuttlecockButtonOn {
                    isShuttlecockButtonOn.toggle()
                    isModel3DViewOn = true
                    isMonsterraButtonOn = false
                    isShoeButtonOn = false
                    isAwardMetalButtonOn = false
                    assetPath = shuttlecockAssetPath
                }
            }
            .buttonStyle(UniversalButtonStyle(isActive: isAwardMetalButtonOn))
            
            Button(monsterraButtonString) {
                if !isMonsterraButtonOn {
                    isMonsterraButtonOn.toggle()
                    isModel3DViewOn = true
                    isShoeButtonOn = false
                    isAwardMetalButtonOn = false
                    isShuttlecockButtonOn = false
                    assetPath = monsteraAssetPath
                }
            }
            .buttonStyle(UniversalButtonStyle(isActive: isAwardMetalButtonOn))
            
            Button(shoeButtonString) {
                if !isShoeButtonOn{
                    isShoeButtonOn.toggle()
                    assetPath = shoeAssetPath
                    isModel3DViewOn = true
                    isAwardMetalButtonOn = false
                    isMonsterraButtonOn = false
                    isShuttlecockButtonOn = false
                }
            }
            .buttonStyle(UniversalButtonStyle(isActive: isShoeButtonOn))
            
            Button(awardMetalButton) {
                if !isAwardMetalButtonOn {
                    isAwardMetalButtonOn.toggle()
                    assetPath = awardAssetPath
                    isModel3DViewOn = true
                    isShoeButtonOn = false
                    isMonsterraButtonOn = false
                    isShuttlecockButtonOn = false
                }
            }
            .buttonStyle(UniversalButtonStyle(isActive: isAwardMetalButtonOn))
        }
    }
    
    func model3DView(assetPath: String) -> some View {
        Model3DView(named: assetPath)
            .transform(scale: 0.9)
            .cameraControls(OrbitControls(camera: $camera,sensitivity: 0.5))
            .background(Color.black)
            .ibl(named: backgroundImage, intensity: 0.4)
            
        
    }
}
