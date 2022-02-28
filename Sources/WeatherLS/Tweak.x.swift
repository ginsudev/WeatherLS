import Orion
import WeatherLSC

class SBFLockScreenDateViewController_Hook: ClassHook<SBFLockScreenDateViewController> {
    @Property(.nonatomic, .retain) var wls = WLSView()
    
    func viewDidLoad() {
        orig.viewDidLoad()
        wls = WLSView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        target.view.addSubview(wls)
    }
    
    func viewWillAppear(_ animated: Bool) {
        orig.viewWillAppear(animated)
        
        guard !UIDevice.currentIsIPad() else {
            return
        }
        
        var frame = wls.frame
        if UIScreen.main.bounds.width > UIScreen.main.bounds.height {
            frame.origin.y = target.view.frame.maxY
        } else {
            frame.origin.y = 0
        }
        wls.frame = frame
        
        wls.temp_label.textColor = Ivars<_UILegibilitySettings>(Ivars<SBUILegibilityLabel>(target.view as! SBFLockScreenDateView)._timeLabel)._legibilitySettings.primaryColor
    }
    
    func _startUpdateTimer() {
        orig._startUpdateTimer()
        wls.updateWeather()
    }
}

class SBFLockScreenDateView_Hook: ClassHook<SBFLockScreenDateView> {
    func setAlignmentPercent(_ arg1: CGFloat) {
        
        var percent = UIApplication.shared.userInterfaceLayoutDirection == .leftToRight ? 1.0 : -1.0
        
        if UIScreen.main.bounds.width > UIScreen.main.bounds.height && !UIDevice.currentIsIPad() {
            percent = arg1
        }
        
        orig.setAlignmentPercent(percent)
    }
}
