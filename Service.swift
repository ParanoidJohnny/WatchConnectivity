import Foundation
import WatchConnectivity

class SyncService : NSObject, WCSessionDelegate {
    
    
    private var session: WCSession = .default

    init(session: WCSession = .default) {
        
        
        super.init()
        self.session = session
        self.session.delegate = self
        print("Reachable :",session.isReachable)
        #if os(iOS)
        print("Paired :",session.isPaired)
        print("Connection provider initialized on phone")
        #endif
        #if os(watchOS)
        print("Connection provider initialized on watch")
        #endif
        self.connect()
        print("Details",self.session)
    }
    
    func connect() {
        guard WCSession.isSupported() else {
            print("WCSession is not supported")
            return
        }
        switch self.session.activationState {
                case .activated:
                    print("WCSession activated successfully")
                case .inactive:
                    print("Unable to activate the WCSession. Error:")
                case .notActivated:
                    print("Unexpected .notActivated state received after trying to activate the WCSession")
                @unknown default:
                    print("Unexpected state received after trying to activate the WCSession")
                }
        session.activate()
        
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }

    #if os(iOS)
    func sessionDidBecomeInactive(_ session: WCSession) { }
    
    func sessionDidDeactivate(_ session: WCSession) { }
    #endif
    
        
     //   func sendMessage(_ key: String, _ message: String, _ errorHandler: ((Error) -> Void)?) {
        //    if session.isReachable {
        //        session.sendMessage([key : message], replyHandler: nil) { (error) in
         //           print(error.localizedDescription)
         //           if let errorHandler = errorHandler {
           ///             errorHandler(error)
            //        }
        //        }
       //     }
   //     }
        
    

        
        
    }

    
    

