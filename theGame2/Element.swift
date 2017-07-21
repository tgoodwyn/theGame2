//
//  Element.swift
//  theGame
//
//  Created by Tyler Goodwyn on 7/17/17.
//  Copyright © 2017 Tyler Goodwyn. All rights reserved.
//

import SpriteKit

class Element: SKSpriteNode {
    
    enum element {
        case fire, earth, metal, water, wood
    }
    
    enum playerName {
        case human, AI
    }
    
    
    
    static let colors: [element : UIColor] = [.fire : UIColor.red, .earth: UIColor.brown, .metal: UIColor.black, .water: UIColor.blue, .wood: UIColor.green]
    static let strengthens: [element : element] = [.fire : .earth, .earth: .metal, .metal: .water, .water: .wood, .wood: .fire]
    static let damages: [element: element] =
        [.fire: .metal, .metal: .wood, .wood: .earth, .earth: .water, .water: .fire]
    static let damagedBy: [element: element] = [.fire: .water, .water: .earth, .earth: .wood, .wood: .metal, .metal: .fire]
    
    
    var belongsTo: playerName!
    
    weak var delegate: Player!
    weak var label: SKLabelNode?
    
    
    var startingPosition: CGPoint!
    
    
    
    var health = 0 {
        didSet {
            if let label = label {
                label.text = String(health)
            }
        }
    }
    
    var type: element! {
        didSet {
            reset()
        }
    }
    
    func reset() {
        guard let delegate = delegate else {
            return
        }
        guard let type = type else {
            return
        }
        switch type {
        case .wood:
            label = delegate.greenLabel
            color = .green
            break
        case .fire:
            label = delegate.redLabel
            color = .red
            break
        case .earth:
            label = delegate.yellowLabel
            color = .brown
            break
        case.metal:
            label = delegate.blackLabel
            color = .black
            break
        case.water:
            label = delegate.blueLabel
            color = .blue
            break
        }

    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    
    /*
     static func wood() -> Element {
     let wood = Element()
     wood.type = .wood
     wood.health = redValue
     wood.belongTo = .player
     return wood
     }
     */
    
}


