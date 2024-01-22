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
    @State private var isModel3DViewOn = false
    let shoeButtonString = "3D Shoe"
    let awardMetalButton = "Award Metal"
    let shoeAssetPath = "Assets.scnassets/panoramas/shoe.gltf"

    var body: some View {
        VStack {
            buttons()
        }
        if isModel3DViewOn {
            model3DView(assetPath: shoeAssetPath)
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
            Button(shoeButtonString) {
                isShoeButtonOn.toggle()
                isModel3DViewOn.toggle()
            }
            .buttonStyle(UniversalButtonStyle(isActive: isShoeButtonOn))
//            BUTTON(awardMetalButton) {
//
//            }
        }
    }
    
    func model3DView(assetPath: String) -> some View {
        Model3DView(named: assetPath)
            .transform(scale: 0.9)
            .cameraControls(OrbitControls(camera: $camera,sensitivity: 0.5))
            .background(.background)
    }
}
