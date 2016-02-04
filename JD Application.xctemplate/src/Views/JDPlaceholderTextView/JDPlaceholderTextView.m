//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  显示未读消息
//
//___COPYRIGHT___
//

#import "JDPlaceholderTextView.h"

@interface JDPlaceholderTextView ()
@property (nonatomic, retain) UILabel *placeholderLabel;
@end

@implementation JDPlaceholderTextView
#define DEFAULT_INTERVAL        0.25

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    if (!self.placeholder) {
        [self setPlaceholder:@""];
    }
    if (!self.placeholderColor) {
        [self setPlaceholderColor:[UIColor lightGrayColor]];
    }
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textChanged:)
                                                 name:UITextViewTextDidChangeNotification
                                               object:nil];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setPlaceholder:@""];
        [self setPlaceholderColor:[UIColor lightGrayColor]];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(textChanged:)
                                                     name:UITextViewTextDidChangeNotification
                                                   object:nil];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    if([[self placeholder] length] > 0) {
        if (_placeholderLabel == nil) {
            _placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(8,8,self.bounds.size.width,10)];
            _placeholderLabel.lineBreakMode = NSLineBreakByWordWrapping;
            _placeholderLabel.font = self.font;
            _placeholderLabel.backgroundColor = [UIColor clearColor];
            _placeholderLabel.textColor = self.placeholderColor;
            _placeholderLabel.alpha = 0;
            _placeholderLabel.tag = 999;
            [self addSubview:_placeholderLabel];
        }
        _placeholderLabel.text = self.placeholder;
        [_placeholderLabel sizeToFit];
        [self sendSubviewToBack:_placeholderLabel];
    }
    if([[self text] length] == 0 && [[self placeholder] length] > 0) {
        [[self viewWithTag:999] setAlpha:1];
    }
    [super drawRect:rect];
}

- (void)setText:(NSString *)text {
    [super setText:text];
    [self textChanged:nil];
}

- (void)textChanged:(NSNotification *)notification {
    if([[self placeholder] length] == 0) return;

    [UIView animateWithDuration:DEFAULT_INTERVAL animations:^{
        if([[self text] length] == 0) {
            [[self viewWithTag:999] setAlpha:1];
        }
        else {
            [[self viewWithTag:999] setAlpha:0];
        }
    }];
}

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    _placeholderLabel.text = placeholder;
    [_placeholderLabel sizeToFit];
}

@end
