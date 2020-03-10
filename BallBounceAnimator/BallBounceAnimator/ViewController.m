//
//  ViewController.m
//  BallBounceAnimator
//
//  Created by JETS Mobile Lab - 8 on 3/9/20.
//  Copyright © 2020 ITI. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //intialize animator on specific view
    self.myAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    [self addBallMoveBehavior];
}
-(void) addBallMoveBehavior{
    //create gravity behavior on specific item from view
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.redBall]];
    
    //create Collision behavior on specific item from view
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.redBall]];
    
    //set collision delegate to make action when ball bounce
    [collisionBehavior setCollisionDelegate:self];
    
    //set the bounds of boundry to be the corners of the screen
    [collisionBehavior setTranslatesReferenceBoundsIntoBoundary:YES];
    
    //create Item Behavior
    UIDynamicItemBehavior *collisionItemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.redBall]];
    
    collisionItemBehavior.elasticity=1;
    
    //add all the behaviors and item behaviors to the animator
    [self.myAnimator addBehavior:gravityBehavior];
    [self.myAnimator addBehavior:collisionBehavior];
    [self.myAnimator addBehavior:collisionItemBehavior];
}
-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p{
     printf("hi");
     [self.redBall setBackgroundColor:[UIColor redColor]];
}
-(void)collisionBehavior:(UICollisionBehavior *)behavior endedContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier{
    printf("hi");
    [self.redBall setBackgroundColor:[UIColor blueColor]];
}

@end
