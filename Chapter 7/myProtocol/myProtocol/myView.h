//
//  myView.h
//  myProtocol
//
//  Created by Amos Bannister on 19/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol animationNotification

- (void)animationHasFinishedWithView:(UIView *)animatedView;

@optional

- (void)animationStartedWithView:(UIView *)animatedView;

@end

@interface myView : UIView {
    id <animationNotification> delegate;
    UIView *boxView;
}

@property (nonatomic, assign) id delegate;

- (void)animate;

@end
