import class Foundation.Bundle

extension Foundation.Bundle {
    static let module: Bundle = {
        let mainPath = Bundle.main.bundleURL.appendingPathComponent("GLTFSceneKit_GLTFSceneKit.bundle").path
        let buildPath = "/Users/rodericklizardo/dev/ri-izdo/MetalFusion/MetalFusion/MetalFusion/.build/arm64-apple-macosx/debug/GLTFSceneKit_GLTFSceneKit.bundle"

        let preferredBundle = Bundle(path: mainPath)

        guard let bundle = preferredBundle ?? Bundle(path: buildPath) else {
            fatalError("could not load resource bundle: from \(mainPath) or \(buildPath)")
        }

        return bundle
    }()
}