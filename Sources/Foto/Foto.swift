import Photos
import Combine

@available(iOS 13.0, *)
public final class Foto: NSObject, ObservableObject {
    
    @Published private(set) public var isAuthorized: Bool = PHPhotoLibrary.authorizationStatus() == .authorized
    
    private let library = PHPhotoLibrary.shared()
    
    public override init() {
        super.init()
        
        library.register(self as PHPhotoLibraryAvailabilityObserver)
    }
    
}

extension Foto: PHPhotoLibraryAvailabilityObserver {
    
    public func photoLibraryDidBecomeUnavailable(_ photoLibrary: PHPhotoLibrary) {
        isAuthorized = false
    }
    
}
