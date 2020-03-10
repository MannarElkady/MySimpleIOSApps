//
//  ViewController.h
//  BallBounceAnimator
//
//  Created by JETS Mobile Lab - 8 on 3/9/20.
//  Copyright © 2020 ITI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollisionBehaviorDelegate>
@property (weak, nonatomic) IBOutlet UIView *redBall;
@property (nonatomic, strong) UIDynamicAnimator* myAnimator;

-(void) addBallMoveBehavior;
@end

