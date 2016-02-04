//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  带Placeholder的TextView
//
//___COPYRIGHT___
//

#import <UIKit/UIKit.h>

@interface JDPlaceholderTextView : UITextView

@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, retain) UIColor *placeholderColor;

-(void)textChanged:(NSNotification*)notification;

@end
