//
//  LoginViewController.swift
//  Rainbow
//
//  Created by Blaer on 2018/4/26.
//  Copyright © 2018 cyrusblaer. All rights reserved.
//

import UIKit
import SVProgressHUD
import Hero
import Photos

class LoginViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // MARK: Properties
    @IBOutlet var inputFields: [UITextField]!
    @IBOutlet var phoneRegionLabel: [UILabel]!
    @IBOutlet var regionButton: [UIButton]!
    
    //  Login View
    @IBOutlet var loginView: UIView!
    @IBOutlet weak var loginTapButton: UIButton!
    @IBOutlet weak var registerTapButton: UIButton!
    @IBOutlet weak var phoneTextField: RoundedTextField!
    @IBOutlet weak var passwordTextField: RoundedTextField!
    @IBOutlet weak var getPwdButton: RoundedButton!
    @IBOutlet weak var loginButton: RoundedButton!
    
    //  Register View
    @IBOutlet var registerView: UIView!
    @IBOutlet weak var inviteTextField: RoundedTextField!
    @IBOutlet weak var registerButton: RoundedButton!
    @IBOutlet weak var getRegPwdButton: RoundedButtonWithBorder!
    
    //  Info View
    @IBOutlet var infoView: UIView!
    @IBOutlet weak var profileView: RoundedImageView!
    @IBOutlet weak var doneButton: RoundedButton!
    
    //  Picker View
    @IBOutlet var pickerView: UIView!
    @IBOutlet weak var picker: UIPickerView!
    
    var loginViewTopConstraint: NSLayoutConstraint!
    var registerViewTopConstraint: NSLayoutConstraint!
    var infoViewTopConstraint: NSLayoutConstraint!
    var pickerViewBottomConstraint: NSLayoutConstraint!
    var shouldShowPage: LoginPageType = .login
    var isLoginViewVisible = true
    
    let imagePicker = UIImagePickerController()

    var regions :[String] = ["中国大陆", "香港","澳门"]
    var phoneRegions : [String] = ["+86", "+852", "+853"]
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customization()
        self.setupPickerView()
        if self.shouldShowPage == .login {
            self.view.bringSubview(toFront: self.loginView)
        }
        else if self.shouldShowPage == .register {
            self.view.bringSubview(toFront: self.registerView)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Setup
    func customization() {
        
        // LoginView Constraint
        self.view.addSubview(self.loginView)
        self.loginView.translatesAutoresizingMaskIntoConstraints = false
        self.loginView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.loginViewTopConstraint = NSLayoutConstraint.init(item: self.loginView, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 0)
        self.loginViewTopConstraint.isActive = true
        self.loginView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1).isActive = true
        self.loginView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
        
        //  Register Constraint
        self.view.insertSubview(self.registerView, belowSubview: self.loginView)
        self.registerView.translatesAutoresizingMaskIntoConstraints = false
        self.registerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.registerViewTopConstraint = NSLayoutConstraint.init(item: self.registerView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0)
        self.registerViewTopConstraint.isActive = true
        self.registerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1).isActive = true
        self.registerView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
        
        //  InfoView Constraint
        self.view.insertSubview(self.infoView, belowSubview: self.loginView)
        self.infoView.translatesAutoresizingMaskIntoConstraints = false
        self.infoView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.infoViewTopConstraint = NSLayoutConstraint.init(item: self.infoView, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 1000)
        self.infoViewTopConstraint.isActive = true
        self.infoView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1).isActive = true
        self.infoView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
        
        //  Picker Constriant
        self.view.insertSubview(self.pickerView,aboveSubview: self.loginView)
        self.pickerView.translatesAutoresizingMaskIntoConstraints = false
        self.pickerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.pickerViewBottomConstraint = NSLayoutConstraint.init(item: self.pickerView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0)
        self.pickerViewBottomConstraint.isActive = true
        self.pickerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.30).isActive = true
        self.pickerView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
        self.view.bringSubview(toFront: self.pickerView)
        
        // Views Customization
        self.loginButton.setTitleColor(.white, for: .normal)
        self.loginButton.backgroundColor = GlobalVariables.orange
        self.getPwdButton.layer.borderColor = GlobalVariables.grey.cgColor
        self.getPwdButton.setTitleColor(.black, for: .normal)
        self.getRegPwdButton.layer.borderColor = GlobalVariables.grey.cgColor
        self.getRegPwdButton.setTitleColor(.black, for: .normal)
        self.registerButton.setTitleColor(.white, for: .normal)
        self.registerButton.backgroundColor = GlobalVariables.orange
        self.doneButton.setTitleColor(.white, for: .normal)
        self.doneButton.backgroundColor = GlobalVariables.orange
    }
    
    func setupPickerView() {
        
        self.picker.dataSource = self
        self.picker.delegate = self
        //设置选择框的默认值
        picker.selectRow(1,inComponent:0,animated:true)
        self.view.addSubview(pickerView)
    }
    
    // MARK: - Action
    
    @IBAction func sendSMSCodeAction(_ button: UIButton) {
        button.isSelected = !button.isSelected
    }
    
    @IBAction func loginAction(_ button: UIButton) {
        
        self.hideAllPopups()
        
        if (self.phoneTextField.text?.isEmpty)! {
            print("电话号码不能为空")
            SVProgressHUD.showError(withStatus: "电话号码不能为空")
            return
        }
        else if (self.isTelNumber(num: self.phoneTextField.text!)) {
            print("电话号码不合法")
            SVProgressHUD.showError(withStatus: "电话号码不合法")
            return
        }
        else if (self.passwordTextField.text?.isEmpty)! {
            print("动态密码不能为空")
            SVProgressHUD.showError(withStatus: "动态密码不能为空")
            return
        }
        
        if (button.currentTitle == "登录") {
            // Log In
        }
            
        else if (button.currentTitle == "继续注册") {
//            self.loginViewTopConstraint.constant = 1000
            self.infoViewTopConstraint.constant = 0
            
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
            self.view.bringSubview(toFront: self.infoView)
        })
    }
    
    
    @IBAction func pickRegion(_ button: UIButton) {
        
        for item in inputFields {
            item.resignFirstResponder()
        }
        // show picker
//        self.pickerViewBottomConstraint.constant = 0
//        self.view.bringSubview(toFront: self.pickerView)
//        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
//            self.view.layoutIfNeeded()
//        })
        
    }
    
    @IBAction func donePick(_ sender: Any) {
        
        self.hideAllPopups()
        print("Picked \(self.regions[self.picker.selectedRow(inComponent: 0)]) and \(self.phoneRegions[self.picker.selectedRow(inComponent: 0)]))")
        for item in self.regionButton {
            item.setTitle(self.regions[self.picker.selectedRow(inComponent: 0)], for: .normal)
        }
        for item in self.phoneRegionLabel {
            item.text = self.phoneRegions[self.picker.selectedRow(inComponent: 0)]
        }
        
    }
    @IBAction func switchViews(_ button: UIButton) {
        
        self.hideAllPopups()
        
        if button.tag == 10 {

            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
                self.loginView.alpha = 0.0
                self.registerView.alpha = 1.0
            }) { (finish) in
                if finish {
                    self.view.bringSubview(toFront: self.registerView)
                     self.isLoginViewVisible = false
                }
            }
            
        }
        else if button.tag == 30 {
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
                self.loginView.alpha = 1.0
                self.registerView.alpha = 0.0
            }) { (finish) in
                if finish {
                    self.view.bringSubview(toFront: self.loginView)
                    self.isLoginViewVisible = true
                }
            }
        }
    }
    
    @IBAction func back(_ sender: Any) {
        
//        self.loginViewTopConstraint.constant = 0
        self.infoViewTopConstraint.constant = 1000
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .layoutSubviews, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func pickProfile(_ sender: Any) {
        
        let sheet = UIAlertController(title: nil, message: "Select the source", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "拍照", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.openPhotoPickerWith(source: .camera)
        })
        let photoAction = UIAlertAction(title: "相册", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.openPhotoPickerWith(source: .library)
        })
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        sheet.addAction(cameraAction)
        sheet.addAction(photoAction)
        sheet.addAction(cancelAction)
        self.present(sheet, animated: true, completion: nil)
    }
    
    //segue回调方法，获取返回参数
    @IBAction func backSegue(segue : UIStoryboardSegue){
        //获取返回的控制器
        let backVC = segue.source as! RegionViewController
        print(backVC.selectedRegion)
        //此处需要更新地区选择信息
        
    }
    
    // MARK: - Methods
    func hideAllPopups() {
        for item in inputFields {
            item.resignFirstResponder()
        }
        self.pickerViewBottomConstraint.constant = 1000
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    func isTelNumber(num: String)->Bool
    {
        let mobile = "^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$"
        let  CM = "^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$"
        let  CU = "^1(3[0-2]|5[256]|8[56])\\d{8}$"
        let  CT = "^1((33|53|8[09])[0-9]|349)\\d{7}$"
        let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        let regextestcm = NSPredicate(format: "SELF MATCHES %@",CM )
        let regextestcu = NSPredicate(format: "SELF MATCHES %@" ,CU)
        let regextestct = NSPredicate(format: "SELF MATCHES %@" ,CT)
        if ((regextestmobile.evaluate(with: num) == true)
            || (regextestcm.evaluate(with: num)  == true)
            || (regextestct.evaluate(with: num) == true)
            || (regextestcu.evaluate(with: num) == true))
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    func openPhotoPickerWith(source: PhotoSource) {
        switch source {
        case .camera:
            let status = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
            if (status == .authorized || status == .notDetermined) {
                self.imagePicker.sourceType = .camera
                self.imagePicker.allowsEditing = true
                self.present(self.imagePicker, animated: true, completion: nil)
            }
        case .library:
            let status = PHPhotoLibrary.authorizationStatus()
            if (status == .authorized || status == .notDetermined) {
                self.imagePicker.sourceType = .savedPhotosAlbum
                self.imagePicker.allowsEditing = true
                self.present(self.imagePicker, animated: true, completion: nil)
            }
        }
    }
    
    //  MARK: = Delegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.regions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.phoneRegions[row] + "  " + self.regions[row]
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
