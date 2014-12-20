//
//  MainScene.swift
//  startRun
//
//  Created by seehao on 14/12/19.
//  Copyright (c) 2014年 seehao. All rights reserved.
//

import Foundation
import SpriteKit

class MainScene: SKScene {

    var playerWalkingFrames = NSArray()
    var player = SKSpriteNode()
    
    override func didMoveToView(view: SKView) {
        backgroundColor = SKColor.blackColor()
        
        creatWalkingFrames()
 
        player = SKSpriteNode(texture: playerWalkingFrames[0] as SKTexture)
        player.xScale = 0.3
        player.yScale = 0.3
        player.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        self.addChild(player)
        walking()
        
        var swipeGesture = UISwipeGestureRecognizer(target: self, action: "handleSwipeGesture:")
        self.view?.addGestureRecognizer(swipeGesture)
        var swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: "handleSwipeGesture:")
        swipeLeftGesture.direction = UISwipeGestureRecognizerDirection.Left
        self.view?.addGestureRecognizer(swipeLeftGesture)
        var swipeUpGesture = UISwipeGestureRecognizer(target: self, action: "handleSwipeGesture:")
        swipeUpGesture.direction = UISwipeGestureRecognizerDirection.Up
        self.view?.addGestureRecognizer(swipeUpGesture)
        var swipeDownGesture = UISwipeGestureRecognizer(target: self, action: "handleSwipeGesture:")
        swipeDownGesture.direction = UISwipeGestureRecognizerDirection.Down
        self.view?.addGestureRecognizer(swipeDownGesture)
    
    }
    
    func handleSwipeGesture(gesture: UISwipeGestureRecognizer) {
        var direction = gesture.direction
        switch (direction){
        case UISwipeGestureRecognizerDirection.Left:
            player.removeActionForKey("walkingUp")
            player.removeActionForKey("walkingDown")
            player.removeActionForKey("walkingRight")
            player.removeActionForKey("walkingLeft")
            player.runAction(SKAction.repeatActionForever(SKAction.moveByX(-30, y: 0, duration: 1)), withKey: "walkingLeft")
            break
        case UISwipeGestureRecognizerDirection.Right:
            player.removeActionForKey("walkingUp")
            player.removeActionForKey("walkingDown")
            player.removeActionForKey("walkingRight")
            player.removeActionForKey("walkingLeft")
            player.runAction(SKAction.repeatActionForever(SKAction.moveByX(30, y: 0, duration: 1)), withKey: "walkingRight")
            break
        case UISwipeGestureRecognizerDirection.Up:
            player.removeActionForKey("walkingUp")
            player.removeActionForKey("walkingDown")
            player.removeActionForKey("walkingRight")
            player.removeActionForKey("walkingLeft")
            player.runAction(SKAction.repeatActionForever(SKAction.moveByX(0, y: 30, duration: 1)), withKey: "walkingUp")
            break
        case UISwipeGestureRecognizerDirection.Down:
            player.removeActionForKey("walkingUp")
            player.removeActionForKey("walkingDown")
            player.removeActionForKey("walkingRight")
            player.removeActionForKey("walkingLeft")
            player.runAction(SKAction.repeatActionForever(SKAction.moveByX(0, y: -30, duration: 1)), withKey: "walkingDown")
            break
        default:
            break;
        }
    }
    
    func walking(){
        player.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(playerWalkingFrames, timePerFrame: 0.1, resize: false, restore: true)), withKey: "walkingAnimation")
    }
    
    func creatWalkingFrames(){
        var playerWalkingFramesTemp = NSMutableArray()
        let playerAnimatedAtlas:SKTextureAtlas = SKTextureAtlas(named: "BearImages")
        var numImages = playerAnimatedAtlas.textureNames.count;
        for index in 1...numImages/2 {
            var textureName = NSString(format: "bear%d", index)
            var temp:SKTexture = playerAnimatedAtlas.textureNamed(textureName)
            playerWalkingFramesTemp.addObject(temp)
        }
        playerWalkingFrames = playerWalkingFramesTemp
    
    }
    
}