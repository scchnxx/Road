#if os(OSX)
import Cocoa
#else
import UIKit
#endif

extension CCTVPreviewView {
    
    public enum State: Int {
        case loading
        case playing
        case stopped
    }
    
}

#if os(OSX)

// MARK: - macOS

public class CCTVPreviewView: NSView {
    
    private let viewModel = CCTVPreviewViewModel()
    
    public var backgroundColor: NSColor? {
        didSet {
            layer?.backgroundColor = backgroundColor?.cgColor
        }
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    public init() {
        super.init(frame: .zero)
        commonInit()
    }
    
}
#else

// MARK: - iOS

public class CCTVPreviewView: UIView {
    
    private let viewModel = CCTVPreviewViewModel()
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    public init() {
        super.init(frame: .zero)
        commonInit()
    }
    
}
#endif

// MARK: - Shared

extension CCTVPreviewView {
    
    // MARK: Properties
    
    private var mainLayer: CALayer? {
        #if os(OSX)
        return layer
        #else
        return layer
        #endif
    }
    
    public var state: State {
        State(rawValue: viewModel.state.rawValue)!
    }
    
    // MARK: Event Handlers
    
    public var didStartLoadingHandler: (() -> Void)? {
        get {
            viewModel.didStartLoading
        }
        set {
            viewModel.didStartLoading = newValue
        }
    }
    
    public var didStartHandler: (() -> Void)? {
        get {
            viewModel.didStart
        }
        set {
            viewModel.didStart = newValue
        }
    }
    
    public var didFailToStartHandler: (() -> Void)? {
        get {
            viewModel.didFailToStart
        }
        set {
            viewModel.didFailToStart = newValue
        }
    }
    
    public var didStopHandler: (() -> Void)? {
        get {
            viewModel.didStop
        }
        set {
            viewModel.didStop = { [weak self] in
                self?.layer?.contents = nil
                newValue?()
            }
        }
    }
    
    // MARK: Init
    
    private func commonInit() {
        #if os(OSX)
        wantsLayer = true
        #endif
        
        layer?.contentsGravity = .resizeAspect
        
        backgroundColor = .black
        
        viewModel.didOutputImageData = { [unowned self] data in
            #if os(OSX)
            let image = NSImage(data: data)
            #else
            let image = UIImage(data: data)
            #endif
            self.layer?.contents = image
        }
        
        viewModel.didStop = { [weak self] in
            self?.layer?.contents = nil
        }
    }
    
    // MARK: Funcs
    
    public func play(cctv: CCTVList.CCTV) {
        viewModel.play(cctv: cctv)
    }
    
    public func resume() {
        viewModel.resume()
    }
    
    public func stop() {
        viewModel.stop()
    }
    
}
