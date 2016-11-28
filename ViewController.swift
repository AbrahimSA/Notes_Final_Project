//
//  ViewController.swift
//  Notes_Final_Project
//
//  Created by abrahim abrahao on 2016-11-22.
//  Copyright © 2016 abrahim abrahao. All rights reserved.
//

import UIKit
import CoreData
import AVFoundation
import CoreLocation

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource,UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate {
    let picker = UIImagePickerController()
    @IBOutlet weak var SwitchAllDay: UISwitch!
    @IBOutlet weak var txtEventName: UITextField!
    
    @IBOutlet weak var txtLocation: UITextField!
    @IBOutlet weak var txtNotes: UITextView!
    
    @IBOutlet weak var imgNotes: UIImageView!
    
    @IBOutlet weak var pickerView: UIPickerView!

    
    var nowNotes = [NSManagedObject]()

    var SubjectArray:Array  = ["School", "Work", "Todo","Appointment", "Task", "Doctor","Shopping", "Reminder", "Others"]
    var locationManager: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!
    
    let managedObjectContext = (UIApplication.shared.delegate
        as! AppDelegate).persistentContainer.viewContext
    @IBOutlet weak var DatePickerNotes: UIDatePicker!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pickerView.delegate = self
        pickerView.dataSource = self
        if (nowNotes.count != 0) {
            txtEventName.text = nowNotes[0].value(forKey: "event_name") as? String
            txtLocation.text = nowNotes[0].value(forKey: "location") as? String
            txtNotes.text = nowNotes[0].value(forKey: "event_name") as? String
            let img: NSData? = nowNotes[0].value(forKey: "photo") as? NSData
            if ((img) != nil) {
                imgNotes.image = UIImage(data: img! as Data)
            } else {
                imgNotes.image = #imageLiteral(resourceName: "no-image-icon")
            }
            if (nowNotes[0].value(forKey: "all_day") as? Bool)! {
                SwitchAllDay.setOn(true, animated: true)
            } else {
                SwitchAllDay.setOn(false, animated: true)
            }
            
            
            let eventType: String = (nowNotes[0].value(forKey: "event_type") as? String)!
            let eventTypeIndex = SubjectArray.index(of: eventType)
           // pickerView.selectedRow(inComponent: eventTypeIndex!)
            pickerView.selectRow(eventTypeIndex!, inComponent: 0, animated: true)
            
            DatePickerNotes.date = (nowNotes[0].value(forKey: "date_time") as? Date)!

            
        }

    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SwitchAllDay(_ sender: UISwitch) {
        if sender.isOn {
            DatePickerNotes.datePickerMode = .date
        } else {
            DatePickerNotes.datePickerMode = .dateAndTime
        }
    }
    
    
    @IBAction func btnSave(_ sender: UIButton) {
        
        if txtEventName.text == "" || txtLocation.text == ""   {
            print("Not OK")
       } else {
            print("Step01")
            
            if (nowNotes.count != 0) {   //update
            
                //let person = result[0] as! NSManagedObject
                
                nowNotes[0].setValue(txtEventName.text, forKey: "event_name")
                nowNotes[0].setValue(txtLocation.text, forKey: "location")
                nowNotes[0].setValue(SwitchAllDay.isOn, forKey: "all_day")
                nowNotes[0].setValue(UIImageJPEGRepresentation( imgNotes.image!,1) as NSData?, forKey: "photo")
                nowNotes[0].setValue(DatePickerNotes.date as NSDate?, forKey: "date_time")
                nowNotes[0].setValue(SubjectArray[pickerView.selectedRow(inComponent: 0)], forKey: "event_type")
                do {
                    try nowNotes[0].managedObjectContext?.save()
                    msgAlert(msg: "Notes Save!")

                } catch {let saveError = error as NSError
                    msgAlert(msg: "Contact not Save! Error: \(error)")
                    print(saveError)
                }
           } else {  //insert
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                let note = MyNotes (context:context) //User(context:context)
            
                note.event_name = txtEventName.text
                note.location = txtLocation.text
                note.all_day = SwitchAllDay.isOn
                note.photo = UIImageJPEGRepresentation( imgNotes.image!,1) as NSData?
                note.date_time = DatePickerNotes.date as NSDate?
                note.event_type = SubjectArray[pickerView.selectedRow(inComponent: 0)]
                //save the object
                do {
                    try context.save()
                    msgAlert(msg: "Contact Save!")
                
                    //   let controller:  NavControlListContactViewController = storyboard?.instantiateViewController(withIdentifier: "navControlListContact") as! NavControlListContactViewController
                    //   self.present(controller, animated: true, completion: nil)
                } catch let error as NSError  {
                    msgAlert(msg: "Could not save \(error), \(error.userInfo)")
                }
            }
        }
        
    }
    
    
    // -------------------btnLocation
    @IBAction func btnLocation(_ sender: UIButton) {
        // Location
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        startLocation = nil
        
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let latestLocation: CLLocation = locations[locations.count - 1]

        txtLocation.text = "Latitude: " + String(format: "%.4f", latestLocation.coordinate.latitude) +  " Longitude: " + String(format: "%.4f",latestLocation.coordinate.longitude)
        manager.stopUpdatingLocation()
        
    }
    
    // ------------------ btnGetImage
    
    @IBAction func btnGetImage(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            print("First selected")
            if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
                picker.allowsEditing = false
                picker.sourceType = .camera
                picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)!
                self.present(picker, animated: true, completion: nil)
            } else {
                msgAlert(msg: "The device has no camera")
            }
        case 1:
            print("Second selected")
            if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            } else {
                msgAlert(msg: "The device has no photoLibrary")
            }
        default:
            print("no one selected")
        }
        //sender.setEnabled(false, forSegmentAt: 1)
        sender.selectedSegmentIndex = -1
    }
    
    //func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        imgNotes.contentMode = .scaleAspectFit//3
        imgNotes.image = chosenImage //4
        dismiss(animated:true, completion: nil) //5
    }
    
    // ------------------  pickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return SubjectArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return SubjectArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //txtNotes.text = SubjectArray[row]
    }
    
// ------------------  pickerData
    
    
// ---- My functions
    
    func msgAlert(msg: String) {
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    


    

}

