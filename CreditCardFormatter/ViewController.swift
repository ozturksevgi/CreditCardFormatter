//
//  ViewController.swift
//  CreditCardFormatter
//
//  Created by Sevgi OZTURK on 25/09/16.
//  Copyright © 2016 Sevgi OZTURK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func lastDateFormatted(sender: UITextField) {
        
        var last_date = sender.text!
        if last_date.characters.count < 8 {
            let characterset_number = NSCharacterSet(charactersInString: "0123456789/")
            
            last_date = last_date.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
            sender.text = last_date
            
            if last_date.rangeOfCharacterFromSet(characterset_number.invertedSet) != nil {
                let index = last_date.startIndex.advancedBy(last_date.characters.count-1)
                last_date = last_date.substringToIndex(index)
                sender.text = last_date
            }
            
            let characters = Array(last_date.characters)
            var character_array = [String]()
            var index = 0
            
            if characters.count > 0 {
                for i in 0...(characters.count-1) {
                    if(!"/".isEqual(String(characters[i]))){
                        character_array.append(String(characters[i]))
                        index += 1
                    }
                }
            }
            
            var result = ""
            if character_array.count > 0 {
                for i in 0...(character_array.count-1) {
                    if !(character_array[i].rangeOfCharacterFromSet(characterset_number.invertedSet) != nil) {
                        
                        if(result.characters.count == 2) {
                            result = "\(result)/"
                        }
                        result = "\(result)\(character_array[i])"
                    }
                }
            }
            
            sender.text = result
        } else {
            sender.deleteBackward()
        }
        
    }
    
    
    @IBAction func CardFormated(sender: UITextField) {
        
        var card_number = sender.text!
        if card_number.characters.count < 20 {
            let characterset_number = NSCharacterSet(charactersInString: "0123456789 ")
            
            card_number = card_number.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
            sender.text = card_number
            
            if card_number.rangeOfCharacterFromSet(characterset_number.invertedSet) != nil {
                let index = card_number.startIndex.advancedBy(card_number.characters.count-1)
                card_number = card_number.substringToIndex(index)
                sender.text = card_number
            }
            
            let characters = Array(card_number.characters)
            var character_array = [String]()
            var index = 0
            
            if characters.count > 0 {
                for i in 0...(characters.count-1) {
                    if(!" ".isEqual(String(characters[i]))){
                        character_array.append(String(characters[i]))
                        index += 1
                    }
                }
            }
            
            var result = ""
            index = 0
            
            if character_array.count > 0 {
                for i in 0...(character_array.count-1) {
                    if (i % 4 == 0) && i != 0 {
                        if !(character_array[index].rangeOfCharacterFromSet(characterset_number.invertedSet) != nil) {
                            result = "\(result) \(character_array[index])"
                        }
                    } else {
                        if !(character_array[index].rangeOfCharacterFromSet(characterset_number.invertedSet) != nil) {
                            result = "\(result)\(character_array[index])"
                        }
                        
                    }
                    index = index + 1
                }
            }
            
            sender.text = result
        } else {
            sender.deleteBackward()
        }
    }
    
    
    @IBAction func phoneFormated(sender: UITextField) {
        
        var phone = sender.text!
        if phone.characters.count < 13 {
            let characterset_number = NSCharacterSet(charactersInString: "0123456789 ")
            
            phone = phone.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
            sender.text = phone
            
            if phone.rangeOfCharacterFromSet(characterset_number.invertedSet) != nil {
                let index = phone.startIndex.advancedBy(phone.characters.count-1)
                phone = phone.substringToIndex(index)
                sender.text = phone
            }
            
            let characters = Array(phone.characters)
            var character_array = [String]()
            var index = 0
            
            if characters.count > 0 {
                for i in 0...(characters.count-1) {
                    if(!" ".isEqual(String(characters[i]))){
                        character_array.append(String(characters[i]))
                        index += 1
                    }
                }
            }
            
            var result = ""
            index = 0
            
            if character_array.count > 0 {
                for i in 0...(character_array.count-1) {
                    
                    if i == 3 {
                        if !(character_array[index].rangeOfCharacterFromSet(characterset_number.invertedSet) != nil) {
                            result = "\(result) \(character_array[index])"
                        }
                    } else if i == 6 {
                        if !(character_array[index].rangeOfCharacterFromSet(characterset_number.invertedSet) != nil) {
                            result = "\(result) \(character_array[index])"
                        }
                    } else {
                        if !(character_array[index].rangeOfCharacterFromSet(characterset_number.invertedSet) != nil) {
                            result = "\(result)\(character_array[index])"
                        }
                        
                    }
                    
                    index = index + 1
                }
            }
            
            sender.text = result
        } else {
            sender.deleteBackward()
        }
    }
}

