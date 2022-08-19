//
//  ViewController.swift
//  AnkiiOS
//
//  Created by Arnav Shah on 8/17/22.
//

import UIKit



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

class Card {
    
    static let srstimes : [Double] = [1, 2, 5, 7, 14, 28]
    
    var front : String?
    var back : String?
    var date : Date //might want to change this so it doesnt do seconds etc
    var srsindex : Int?
    
    init(_ front : String,_ back: String) {
        self.date = Date.now
        self.front = front
        self.back = back
    }
    
    func getvalue(_ index : Int) -> Double{
        return Card.srstimes[index]
    }
    
    func GoodDate() {
        guard var index = srsindex else {
            srsindex = 0
            date = date.addingTimeInterval(86400)
            return
        }
        if (index == 5){
            date = date.addingTimeInterval(86400 * getvalue(index))
        }
        
        index+=1
        srsindex = index
        date = date.addingTimeInterval(86400*getvalue(index))
        
    }//add time
    
    func BadDate(){
        guard srsindex != nil else {
            return
        }
        date = Date.now
        srsindex = nil
    }//get rid of accumulated time
    
}

class Deck {
    
    var thisDeck : [Card]?
    
    private func AddCard(_ card : Card) {
        thisDeck?.append(card);
    }
    
    func makeCard(front: String, back: String){
        let card = Card(front, back)
        AddCard(card)
    }
    
    
}
