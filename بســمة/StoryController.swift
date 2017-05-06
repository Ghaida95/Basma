//
//  StoryController.swift
//  بســمة
//
//  Created by Ghaida on 8/8/1438 AH.
//  Copyright © 1438 iWAN. All rights reserved.
//

import UIKit

class StoryController: UIViewController {


    @IBOutlet weak var storyImg: UIImageView!
    
    
    // define arrays which contain picture names
    
    var imagesArray1: [String] = ["1", "2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22"]
    
    var imagesArray2: [String] = ["29", "30","31"]
    
    var imagesArray3: [String] = ["50","51","52","53"]
    
    var imagesChoice1_a: [String] = ["23a", "24a"]
    
    var imagesChoice1_b: [String] = ["23b", "24b","25b","26b","27b","28b"]
    
    var imagesChoice2_a: [String] = ["32a", "33a","34a","35a","36a","37a", "38a","39a","40a","41a","42a","43a","44a"]
    
    var imagesChoice2_b: [String] = ["32b", "33b","34b","35b","36b","37b", "38b","39b","40b","41b","42b","43b","44b","45b","46b","47b","48b","49b"]
    
    
    var imagePosition = 0
    var currentArray = "imagesArray1"
    var currentImage = ""
    var firstChoice = "b"
    var secondChoice = "b"
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func rightPressed(_ sender: UIButton) {
        
        
        // here choose between brance 1-a or 1-b
        if(currentImage == "22") {

            // take first choice
            if (firstChoice == "a") {
                currentArray = "imagesChoice1_a"
            }
                
            else if (firstChoice == "b") {
            currentArray = "imagesChoice1_b"
            }
            
            imagePosition = 0
        
        }
        // check if its one of the two pictures that are the end of the FIRST branch
        else if (currentImage == "24a") || (currentImage == "28b"){
        currentArray = "imagesArray2"
        imagePosition = 0
        
        }
        
        // here choose between brance 2-a or 2-b
        else if (currentImage == "31") {
            
        // take second choice
            if (secondChoice == "a") {
                currentArray = "imagesChoice2_a" }
            else if (secondChoice == "b") {
                currentArray = "imagesChoice2_b"
            }
            
            imagePosition = 0
        
        }
            // check if its one of the two pictures that are the end of the SECOND branch
            else if (currentImage == "44a") || (currentImage == "49b") {
            currentArray = "imagesArray3"
            imagePosition = 0
            
            }
        else if (currentImage == "53") {
        storyImg.isHidden = true
        nextButton.isHidden = true
        return
        
        }
            // In case its only the next picture
        else {
            imagePosition += 1
        }
        
        // method to display the picture
        changeImage(position: imagePosition, currentArray: currentArray)
        
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }
    
    


    
    func changeImage(position: Int, currentArray: String) {
        
    // check which array
        switch currentArray {
            case "imagesArray1":
             currentImage = imagesArray1[position]
            case "imagesArray2":
            currentImage = imagesArray2[position]
            case "imagesArray3":
            currentImage = imagesArray3[position]
            // choice 1 - a
            case "imagesChoice1_a":
            currentImage = imagesChoice1_a[position]
            // choice 1 - b
            case "imagesChoice1_b":
            currentImage = imagesChoice1_b[position]
            // choice 2 - a
            case "imagesChoice2_a":
            currentImage = imagesChoice2_a[position]
            // choice 2 - b
            case "imagesChoice2_b":
            currentImage = imagesChoice2_b[position]
            
           default: break
          
        }
        
  
        // display image
        storyImg.image = UIImage(named: currentImage);
    
    
    }








}
