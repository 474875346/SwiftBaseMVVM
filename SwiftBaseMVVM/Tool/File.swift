/*Swift 常用声明*/
import UIKit
import Foundation
let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
let deviceUUID = UIDevice.current.identifierForVendor?.uuidString
extension UIColor {
    static func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
        return UIColor.init(red: r / 255,
                            green: g / 255,
                            blue: b / 255,
                            alpha: 1.0)
    }
    static func colorFromHex(_ Hex: UInt32) -> UIColor {
        return UIColor.init(red: CGFloat((Hex & 0xFF0000) >> 16) / 255.0,
                            green: CGFloat((Hex & 0xFF00) >> 8) / 255.0,
                            blue: CGFloat((Hex & 0xFF)) / 255.0,
                            alpha: 1.0)
    }
}
//取数据的key
let ZToken = "access_token"
let ZCollegeName = "CollegeName"
let ZLogInOut = "LogInOut"
let ZregistID = "registID"
let ZhaveBieMing = "haveBieMing"
let CompressionVideoPaht = "\(NSHomeDirectory())/Library/Viedo"
let Zlatitude = "latitude"
let Zlongitude = "longitude"
let Zrefresh_token = "refresh_token"
let ZLocationSave = "LocationSave"

//存数据
func UserDefaultSave(_ Key:String,Value:String?) {
    UserDefaults().set(Value, forKey: Key)
}
//取数据
func UserDefauTake(_ Key:String) -> String? {
    return UserDefaults().object(forKey: Key) as! String?
}
//删除数据
func UserDefaultRemove(_ Key:String) {
    UserDefaults().removeObject(forKey: Key)
}
//边框
func LRViewBorderRadius(_ view:UIView,Radius:CGFloat,Width:CGFloat,Color:UIColor) {
    view.layer.cornerRadius=Radius
    view.layer.masksToBounds=true
    view.layer.borderWidth=Width
    view.layer.borderColor=Color.cgColor
}
//获取当前时间
func CurrentDate() -> String {
    let date = NSDate()
    let timeFormatter = DateFormatter()
    timeFormatter.dateFormat = "yyy-MM-dd"
    let strNowTime = timeFormatter.string(from: date as Date) as String
    return strNowTime
}

//UI工厂
class CreateUI {
    //标签
    class func Label( _ textColor : UIColor , backgroundColor : UIColor , title : String , frame : CGRect , font : Int) -> UILabel {
        let label = UILabel()
        label.textColor = textColor;
        label.backgroundColor = backgroundColor;
        label.text = title;
        label.frame = frame
        label.font =  UIFont.systemFont(ofSize: CGFloat(font))
        return label
    }
    //按钮
    class func Button(_ title:String, action:Selector, sender:UIViewController, frame : CGRect, backgroundColor : UIColor ,textColor : UIColor)->UIButton {
        let button = UIButton(frame: frame)
        button.backgroundColor = backgroundColor
        button.setTitle(title, for:.normal)
        button.setTitleColor(textColor, for: .normal)
        button.titleLabel!.font = UIFont.systemFont(ofSize: 14)
        button.addTarget(sender, action:action, for:UIControlEvents.touchUpInside)
        return button
    }
    //文本框
    class func TextField( _ placeholder:String, action:Selector, delegate:UITextFieldDelegate , frame : CGRect , backgroundColor : UIColor , textColor : UIColor, sender:UIViewController) -> UITextField {
        let textField = UITextField(frame: frame)
        textField.backgroundColor = backgroundColor
        textField.textColor = textColor
        textField.placeholder = placeholder
        textField.borderStyle = UITextBorderStyle.roundedRect
        textField.adjustsFontSizeToFitWidth = true
        textField.delegate = delegate
        textField.addTarget(sender, action: action, for: .editingChanged)
        return textField
    }
    //分段
    class func Segment(_ items: [String], action:Selector, sender:UIViewController,frame : CGRect) ->UISegmentedControl {
        let segment = UISegmentedControl(items:items)
        segment.frame = frame
        segment.isMomentary = false
        segment.addTarget(sender, action:action, for:UIControlEvents.valueChanged)
        return segment
    }
    //表格
    class func TableView(_ delegate : UITableViewDelegate , dataSource : UITableViewDataSource , frame : CGRect , style : UITableViewStyle) -> UITableView {
        let  tableview = UITableView(frame: frame, style: style)
        tableview.delegate = delegate
        tableview.dataSource = dataSource
        return tableview
    }
}
