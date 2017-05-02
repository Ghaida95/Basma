//
//  ParentControlPanel.swift
//  بســمة
//
//  Created by ShahadR on 4/14/17.
//  Copyright © 2017 iWAN. All rights reserved.
//

import Foundation
import UIKit

class ParentControlPanel : UIViewController {

    
    //alaa//
    @IBOutlet weak var ChildNameInParentLabel: UILabel!
    @IBOutlet weak var AddChildButton: UIButton!
    @IBOutlet weak var EditChildButton: UIButton!
    

    @IBOutlet weak var AvatarPic: UIImageView!
    
    //alaa//
    
    //ghaida//
    // Time text fields
    @IBOutlet weak var datePickerTxt1: UITextField!
    
    @IBOutlet weak var datePickerTxt2: UITextField!
    
    @IBOutlet weak var datePickerTxt3: UITextField!
    
    @IBOutlet weak var datePickerTxt4: UITextField!
    
    @IBOutlet weak var datePickerTxt5: UITextField!
    
    // Time enabling switches
    @IBOutlet weak var switchBtn1: UISwitch!
    
    @IBOutlet weak var switchBtn2: UISwitch!
    
    @IBOutlet weak var switchBtn3: UISwitch!
    
    @IBOutlet weak var switchBtn4: UISwitch!
    
    @IBOutlet weak var switchBtn5: UISwitch!
    
    
    // Chart
    var lineChart: LineChart!
    

    //ghaida//
    
    
    override func viewDidLoad() {
     super.viewDidLoad()

        
        // create chart and view data
       createChart()
        
        // Date picker
       createDatePicker()
        
        // set switches (on/off) with time
        setSwitches()
        
        
        
        //to control add/edit button
        if UserDefaults.standard.bool(forKey: "SaveButton") == false {
            EditChildButton.isHidden=true
            AddChildButton.isHidden=false
        }else{
            EditChildButton.isHidden=false
            AddChildButton.isHidden=true
            ChildNameInParentLabel.text = UserDefaults.standard.string(forKey: "ChildName")
            if UserDefaults.standard.bool(forKey: "Box1") == true {
                AvatarPic.image = UIImage( named: "avatar1")}
            else if UserDefaults.standard.bool(forKey: "Box2") == true {AvatarPic.image = UIImage( named: "avatar2")}
            else if UserDefaults.standard.bool(forKey: "Box3") == true {AvatarPic.image = UIImage( named: "avatar3")}
        }
        

        
    }// End view load
    
    
    //ghaida//

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func createChart() {
        
        
        // Chart Code (Child progress)
        var views: [String: AnyObject] = [:]
        
        // simple array of chart values
        let data: [CGFloat] = [5, 4, 3, 11, 13]
        
        // simple line with custom x axis labels
        
        let xLabels: [String] = ["صباح", "مساء", "تفريش الأسنان", "تقبيل الوالدين", "أذكار النوم"]
        
        lineChart = LineChart()
        lineChart.animation.enabled = true
        lineChart.area = false
        lineChart.x.labels.visible = false
        lineChart.x.labels.values = xLabels
        lineChart.y.labels.visible = false 
        lineChart.addLine(data)
        lineChart.x.grid.visible = false
        lineChart.y.grid.visible = false
        lineChart.dots.color = UIColor.magenta
        lineChart.colors = [UIColor.magenta]
        lineChart.translatesAutoresizingMaskIntoConstraints = false
        lineChart.delegate = self as? LineChartDelegate
        self.view.addSubview(lineChart)
        views["chart"] = lineChart
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-74-[chart(==300)]", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[chart(==370)]-125-|", options: [], metrics: nil, views: views))
        
        
    }
    
    
    let datePicker1 = UIDatePicker()
    let datePicker2 = UIDatePicker()
    let datePicker3 = UIDatePicker()
    let datePicker4 = UIDatePicker()
    let datePicker5 = UIDatePicker()
    
    
    func createDatePicker() {
        
        // format for picker
        datePicker1.datePickerMode = .time
        datePicker2.datePickerMode = .time
        datePicker3.datePickerMode = .time
        datePicker4.datePickerMode = .time
        datePicker5.datePickerMode = .time
        
        
        //toolbar
        let toolbar1 = UIToolbar()
        toolbar1.sizeToFit()
        
        let toolbar2 = UIToolbar()
        toolbar2.sizeToFit()
        
        let toolbar3 = UIToolbar()
        toolbar3.sizeToFit()
        
        let toolbar4 = UIToolbar()
        toolbar4.sizeToFit()
        
        let toolbar5 = UIToolbar()
        toolbar5.sizeToFit()
        
        
        // bar button item
        let doneButton1 = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed1))
        toolbar1.setItems([doneButton1], animated: false)
        
        let doneButton2 = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed2))
        toolbar2.setItems([doneButton2], animated: false)
        
        let doneButton3 = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed3))
        toolbar3.setItems([doneButton3], animated: false)
        
        let doneButton4 = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed4))
        toolbar4.setItems([doneButton4], animated: false)
        
        let doneButton5 = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed5))
        toolbar5.setItems([doneButton5], animated: false)
        
        
        datePickerTxt1.inputAccessoryView = toolbar1
        datePickerTxt2.inputAccessoryView = toolbar2
        datePickerTxt3.inputAccessoryView = toolbar3
        datePickerTxt4.inputAccessoryView = toolbar4
        datePickerTxt5.inputAccessoryView = toolbar5
        
        // assigning date picker to text field
        datePickerTxt1.inputView = datePicker1
        datePickerTxt2.inputView = datePicker2
        datePickerTxt3.inputView = datePicker3
        datePickerTxt4.inputView = datePicker4
        datePickerTxt5.inputView = datePicker5
        
    }
    
    
    func setSwitches() {
        // SET switch 1
        let stat1 = UserDefaults.standard.string(forKey: "switchBtn1Stat")
        if ( stat1 == "on") {
            switchBtn1.isOn = true
            datePickerTxt1.isHidden = false
            datePickerTxt1.text = UserDefaults.standard.string(forKey: "switchBtn1Time")
        }
        else {
            switchBtn1.isOn = false
            datePickerTxt1.isHidden = true
            // datePickerTxt1.text = ""
        }
        
        
        // SET switch 2
        let stat2 = UserDefaults.standard.string(forKey: "switchBtn2Stat")
        if ( stat2 == "on") {
            switchBtn2.isOn = true
            datePickerTxt2.isHidden = false
            datePickerTxt2.text = UserDefaults.standard.string(forKey: "switchBtn2Time")
        }
        else {
            switchBtn2.isOn = false
            datePickerTxt2.isHidden = true
        }
        
        // SET switch 3
        let stat3 = UserDefaults.standard.string(forKey: "switchBtn3Stat")
        if ( stat3 == "on") {
            switchBtn3.isOn = true
            datePickerTxt3.isHidden = false
            datePickerTxt3.text = UserDefaults.standard.string(forKey: "switchBtn3Time")
        }
        else {
            switchBtn3.isOn = false
            datePickerTxt3.isHidden = true
        }
        
        // SET switch 4
        let stat4 = UserDefaults.standard.string(forKey: "switchBtn4Stat")
        if ( stat4 == "on") {
            switchBtn4.isOn = true
            datePickerTxt4.isHidden = false
            datePickerTxt4.text = UserDefaults.standard.string(forKey: "switchBtn4Time")
        }
        else {
            switchBtn4.isOn = false
            datePickerTxt4.isHidden = true
        }
        
        // SET switch 5
        let stat5 = UserDefaults.standard.string(forKey: "switchBtn5Stat")
        if ( stat5 == "on") {
            switchBtn5.isOn = true
            datePickerTxt5.isHidden = false
            datePickerTxt5.text = UserDefaults.standard.string(forKey: "switchBtn5Time")
        }
        else {
            switchBtn5.isOn = false
            datePickerTxt5.isHidden = true
        }
        
    }
    
    
    @IBAction func switch1Changed(_ sender: UISwitch) {
        
        if switchBtn1.isOn {
            datePickerTxt1.isHidden = false
            UserDefaults.standard.set("on", forKey: "switchBtn1Stat")
            
        }
        else {
            datePickerTxt1.isHidden = true
            UserDefaults.standard.set("off", forKey: "switchBtn1Stat")
            UserDefaults.standard.set("", forKey: "switchBtn1Time")
        }
    }
    
    @IBAction func switch2Changed(_ sender: UISwitch) {
        if switchBtn2.isOn {
            datePickerTxt2.isHidden = false
            UserDefaults.standard.set("on", forKey: "switchBtn2Stat")
            
        }
        else {
            datePickerTxt2.isHidden = true
            UserDefaults.standard.set("off", forKey: "switchBtn2Stat")
            UserDefaults.standard.set("", forKey: "switchBtn2Time")
        }
    }
    
    
    @IBAction func switch3Changed(_ sender: UISwitch) {
        if switchBtn3.isOn {
            datePickerTxt3.isHidden = false
            UserDefaults.standard.set("on", forKey: "switchBtn3Stat")
            
        }
        else {
            datePickerTxt3.isHidden = true
            UserDefaults.standard.set("off", forKey: "switchBtn3Stat")
            UserDefaults.standard.set("", forKey: "switchBtn3Time")
        }
    }
    
    
    @IBAction func switch4Changed(_ sender: UISwitch) {
        if switchBtn4.isOn {
            datePickerTxt4.isHidden = false
            UserDefaults.standard.set("on", forKey: "switchBtn4Stat")
            
        }
        else {
            datePickerTxt4.isHidden = true
            UserDefaults.standard.set("off", forKey: "switchBtn4Stat")
            UserDefaults.standard.set("", forKey: "switchBtn4Time")
        }
    }
    
    
    @IBAction func switch5Changed(_ sender: UISwitch) {
        if switchBtn5.isOn {
            datePickerTxt5.isHidden = false
            UserDefaults.standard.set("on", forKey: "switchBtn5Stat")
            
        }
        else {
            datePickerTxt5.isHidden = true
            UserDefaults.standard.set("off", forKey: "switchBtn5Stat")
            UserDefaults.standard.set("", forKey: "switchBtn5Time")
        }
    }
    
    
    func donePressed1() {
        
        //format date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        datePickerTxt1.text=dateFormatter.string(from: datePicker1.date)
        self.view.endEditing(true)
        // save time to storage
        let time = dateFormatter.string(from: datePicker1.date)
        UserDefaults.standard.set(time, forKey: "switchBtn1Time")
        
    }
    
    func donePressed2() {
        
        //format date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        datePickerTxt2.text=dateFormatter.string(from: datePicker2.date)
        self.view.endEditing(true)
        // save time to storage
        let time = dateFormatter.string(from: datePicker1.date)
        UserDefaults.standard.set(time, forKey: "switchBtn2Time")
    }
    
    func donePressed3() {
        
        //format date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        datePickerTxt3.text=dateFormatter.string(from: datePicker3.date)
        self.view.endEditing(true)
        // save time to storage
        let time = dateFormatter.string(from: datePicker1.date)
        UserDefaults.standard.set(time, forKey: "switchBtn3Time")
        
    }
    
    func donePressed4() {
        
        //format date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        datePickerTxt4.text=dateFormatter.string(from: datePicker4.date)
        self.view.endEditing(true)
        // save time to storage
        let time = dateFormatter.string(from: datePicker1.date)
        UserDefaults.standard.set(time, forKey: "switchBtn4Time")
        
    }
    
    func donePressed5() {
        
        //format date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        datePickerTxt5.text=dateFormatter.string(from: datePicker5.date)
        self.view.endEditing(true)
        // save time to storage
        let time = dateFormatter.string(from: datePicker1.date)
        UserDefaults.standard.set(time, forKey: "switchBtn5Time")
        
    }
    
    /**
     * Line chart delegate method.
     */
    func didSelectDataPoint(_ x: CGFloat, yValues: Array<CGFloat>) {
        // label.text = "x: \(x)     y: \(yValues)"
    }
    
    
    
    /**
     * Redraw chart on device rotation.
     */
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        if let chart = lineChart {
            chart.setNeedsDisplay()
        }
    }
    
    
    
 
    //ghaida//
    
    /*
    func userDidEnterData(data: String) {
        ChildNameInParentLabel.text = data
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSendingVC" {
            let sendingVC: EditAddChild = segue.destination as! EditAddChild
            sendingVC.delegate = self
            
        }
    }
    
    */
    
    
    @IBAction func GoToChildViewPressed(_ sender: UIButton) {
        if ChildNameInParentLabel.text == ""{
            let alert = UIAlertController(title: "تنبيه", message: " الرجاء تسجيل بيانات طفلتك", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "حسناً", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        
        }
    }//end GoToChildViewPressed func

}
