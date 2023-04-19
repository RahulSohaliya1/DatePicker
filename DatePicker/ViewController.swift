//
//  ViewController.swift
//  DatePicker
//
//  Created by Rahul on 14/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bookingDatePickerTextField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configureDatePicker()
    }

    private func setup() {
        bookingDatePickerTextField.delegate = self
    }
    
    private func configureDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Calendar.current.date(byAdding: .day, value: 15, to: Date())
        datePicker.minimumDate = Date()
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        print(sender.date)
        bookingDatePickerTextField.text = sender.date.convertToString(format: "dd MMM yyyy")
        Calendar.current.date(byAdding: .day,value: 15, to: sender.date)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            datePicker.isHidden = false
            return false
        }
        return true
    }
}

extension String {
    func convertToDate(format: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: self) ?? Date()
    }
}

extension Date {
    func convertToString(format: String) -> String {
       let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

//print(Date())

//Date().convertToString(format: "dd/MM/yyyy")
//Date().convertToString(format: "dd-MM-yyyy")
//Date().convertToString(format: "dd MMM yyyy")
//Date().convertToString(format: "dd MMM yyyy hh:mm")
//Date().convertToString(format: "dd MMM yyyy hh:mm a")
//Date().convertToString(format: "dd MMM yyyy HH:mm") // 24 Hours

// 2021-11-21 -> 21 Nov 2021


//"2021-11-21".convertToDate(format: "yyyy-MM-dd").convertToString(format: "MM-dd-yyyy")
//"2021-11-21".convertToDate(format: "yyyy-MM-dd").convertToString(format: "dd-MM-yyyy")
//"2021-11-21".convertToDate(format: "yyyy-MM-dd HH:mm").convertToString(format: "dd-MM-yyyy hh:mm a")

