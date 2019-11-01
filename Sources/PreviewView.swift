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
public class CCTVPreviewView: NSView {
    
    private let viewModel = CCTVPreviewViewModel()
    
    public var backgroundColor: NSColor? {
        didSet {
            layer?.backgroundColor = backgroundColor?.cgColor
        }
    }
    
    public var didStartLoading:    (() -> Void)?
    public var didStart:           (() -> Void)?
    public var didFailToStart:     (() -> Void)?
    public var didStop:            (() -> Void)?
    
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
public class CCTVPreviewView: UIView {
    
    private let viewModel = CCTVPreviewViewModel()
    
    public var didStartLoading:    (() -> Void)?
    public var didStart:           (() -> Void)?
    public var didFailToStart:     (() -> Void)?
    public var didStop:            (() -> Void)?
    
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

extension CCTVPreviewView {
    
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
        
        viewModel.didStartLoading = { [unowned self] in
            self.didStartLoading?()
        }
        
        viewModel.didStart = { [unowned self] in
            self.didStart?()
        }
        
        viewModel.didFailToStart = { [unowned self] in
            self.didFailToStart?()
        }
        
        viewModel.didStop = { [unowned self] in
            self.layer?.contents = nil
            self.didStop?()
        }
    }
    
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
