//
//  ContentView.swift
//  MetalFusion
//
//  Created by Roderick Lizardo on 1/19/24.
//

import SwiftUI
import Model3DView

struct ContentView: View {
    @State private var camera = PerspectiveCamera()

    var body: some View {
        Model3DView(named: "Assets.scnassets/panoramas/shoe.gltf")
            .transform(scale: 0.9)
            .cameraControls(OrbitControls(camera: $camera,sensitivity: 0.5))
            .background(.background)
    }
}
