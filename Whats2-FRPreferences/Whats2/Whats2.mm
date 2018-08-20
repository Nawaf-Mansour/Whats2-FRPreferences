#line 1 "/Users/nawafmansour/Desktop/Whats2-SCLAlertView/Whats2/Whats2.xm"
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "SCLAlertView.h"
#import "ViewController.h"
#import "FRPrefs.h"



#define greenColor [UIColor colorWithRed:1/255.0f green:152/255.0f blue:117/255.0f alpha:1.0f]





@interface WAMessage : NSObject
    @property(retain, nonatomic) NSString *text; 
    @end

@interface WAChatCellData : NSObject
- (id)message;
    @end

@interface WAMessageCell : UITableViewCell
    @property(readonly, nonatomic) WAChatCellData *cellData; 
- (id)referenceViewForPopupMenu;
- (CGRect)targetRectForPopupMenu;
- (id)popUpMenuItems;
- (void)willShowPopupMenu;
- (id)starMessagePopupMenuItemWithAction:(SEL)arg1;
- (id)parentMessageCell;
    @end

@interface WAChatBar : UIView
    @property(retain, nonatomic) WAMessage *quotedMessage;
    @end

@interface WAChatBarManagerImpl : NSObject
    @property(retain, nonatomic) WAMessage *quotedMessage;
    @end

@interface ChatViewController : UIViewController
    @end

@interface WAMessageReplyContext : NSObject
    @property(readonly, copy, nonatomic) WAMessage *quotedMessage;
    @property(readonly, copy, nonatomic) NSAttributedString *attributedString;
    @end

@interface WAMessageCellReplyContextView : UIView
    @end

@interface WATableRow : NSObject
    {
        _Bool _editable;
        _Bool _disabled;
        id _editHandler;
        id _handler;
        UITableViewCell *_cell;
    }
    
    @property(nonatomic) _Bool disabled; 
    @property(nonatomic, getter=isEditable) _Bool editable; 
    @property(retain, nonatomic) UITableViewCell *cell; 
    @property(copy, nonatomic) id handler; 
    
    @end

@interface WATableSection : NSObject
    {
        NSMutableArray *_rows;
        NSString *_headerText;
        NSString *_footerText;
    }
    
    @property(retain, nonatomic) NSString *footerText; 
    @property(retain, nonatomic) NSString *headerText; 
    @property(retain, nonatomic) NSArray *rows; 
- (void)deleteRow:(id)arg1;
- (id)addTableRowWithCellStyle:(long long)arg1;
- (id)addDefaultTableRow;
- (void)addRow:(id)arg1;
- (id)init;
    
    @end

@interface WAStaticTableViewController : UITableViewController
    {
        NSMutableArray *_sections;
    }
    
    @property(retain, nonatomic) NSArray *sections; 
- (void)deselectActiveCell;
- (void)wa_fontSizeDidChange;
- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2;
- (id)tableView:(id)arg1 willSelectRowAtIndexPath:(id)arg2;
- (id)tableView:(id)arg1 titleForFooterInSection:(int)arg2;
- (id)tableView:(id)arg1 titleForHeaderInSection:(int)arg2;
- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2;
- (int)tableView:(id)arg1 numberOfRowsInSection:(int)arg2;
- (int)numberOfSectionsInTableView:(id)arg1;
- (id)rowAtIndexPath:(id)arg1;
- (id)addSection;
- (void)setupTableView;
- (void)viewDidLoad;
- (id)initWithStyle:(int)arg1;
    
    @end

@interface WAStaticTableViewController (WASendAny9)
- (WATableSection *)addSectionAtTop;
    @end

@interface DebugViewController : WAStaticTableViewController
- (id)init;
    @end

@interface WASettingsViewController : WAStaticTableViewController
    @end






#include <objc/message.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

__attribute__((unused)) static void _logos_register_hook$(Class _class, SEL _cmd, IMP _new, IMP *_old) {
unsigned int _count, _i;
Class _searchedClass = _class;
Method *_methods;
while (_searchedClass) {
_methods = class_copyMethodList(_searchedClass, &_count);
for (_i = 0; _i < _count; _i++) {
if (method_getName(_methods[_i]) == _cmd) {
if (_class == _searchedClass) {
*_old = method_getImplementation(_methods[_i]);
*_old = method_setImplementation(_methods[_i], _new);
} else {
class_addMethod(_class, _cmd, _new, method_getTypeEncoding(_methods[_i]));
}
free(_methods);
return;
}
}
free(_methods);
_searchedClass = class_getSuperclass(_searchedClass);
}
}
@class WASettingsViewController; 
static Class _logos_superclass$_ungrouped$WASettingsViewController; static void (*_logos_orig$_ungrouped$WASettingsViewController$viewDidAppear$)(_LOGOS_SELF_TYPE_NORMAL WASettingsViewController* _LOGOS_SELF_CONST, SEL, _Bool);

#line 124 "/Users/nawafmansour/Desktop/Whats2-SCLAlertView/Whats2/Whats2.xm"

static void _logos_method$_ungrouped$WASettingsViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL WASettingsViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, _Bool arg1){
    SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
    alert.backgroundType = SCLAlertViewBackgroundBlur;
    
        alert.customViewColor = [UIColor colorWithRed:101/255.0f green:188/255.0f blue:84/225.0f alpha:1.0f];
    [alert addButton:@"إعدادات الواتس اب" actionBlock:^{
        (_logos_orig$_ungrouped$WASettingsViewController$viewDidAppear$ ? _logos_orig$_ungrouped$WASettingsViewController$viewDidAppear$ : (__typeof__(_logos_orig$_ungrouped$WASettingsViewController$viewDidAppear$))class_getMethodImplementation(_logos_superclass$_ungrouped$WASettingsViewController, @selector(viewDidAppear:)))(self, _cmd, arg1);
    }];
    
    [alert addButton:@"إعدادات واتس بلس" target:self selector:@selector(loadNewSettings:)];
    [alert showQuestion:nil subTitle:@"مرحباً بك في اعدادات الواتس اب" closeButtonTitle:@"إلغاء" duration:0.0f];


}


static void _logos_method$_ungrouped$WASettingsViewController$loadNewSettings$(_LOGOS_SELF_TYPE_NORMAL WASettingsViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id sender){

    FRPViewSection *headerSection = [FRPViewSection sectionWithHeight:70
    initBlock:^(UITableViewCell *cell) {
        
        
        cell.backgroundColor = [UIColor clearColor];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:48];
        [label setText:@"FRPreferences"];
        [label setTextColor:[UIColor blackColor]];
        [label setShadowColor:[UIColor colorWithRed:1/255.0f green:152/255.0f blue:117/255.0f alpha:1.0f]];
        [label setShadowOffset:CGSizeMake(1,1)];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setTag:111];
        
        UILabel *underLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [underLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:14]];
        [underLabel setText:@"Thank you for using our preferences!"];
        [underLabel setTextColor:[UIColor grayColor]];
        [underLabel setTextAlignment:NSTextAlignmentCenter];
        [underLabel setTag:222];
        
        [cell.contentView addSubview:label];
        [cell.contentView addSubview:underLabel];
    }
  layoutBlock:^(UITableViewCell *cell) {
      
      [[cell.contentView viewWithTag:111] setFrame:CGRectMake(0, -5, cell.frame.size.width, 60)];
      [[cell.contentView viewWithTag:222] setFrame:CGRectMake(0, 30, cell.frame.size.width, 60)];
  }];
    
    
    
    FRPSection *section1 = [FRPSection sectionWithTitle:@"Section 1 Title" footer:@"Some footer for section 1"];
    
    
    
    FRPSwitchCell *switchCell = [FRPSwitchCell cellWithTitle:@"Switch 1"
                                                     setting:[FRPSettings settingsWithKey:@"Switch1" defaultValue:@NO]
                                            postNotification:nil
                                                 changeBlock:^(UISwitch *switchView) {
                                                     NSLog(@"switch 1 is: %@",[(UISwitch *)switchView isOn]?@"ENABLED":@"DISABLED");
                                                 }];
    
    [section1 addCell:switchCell];
    
    
    
    FRPTextFieldCell *textFieldCell = [FRPTextFieldCell cellWithTitle:@"Text Field 1"
                                                              setting:[FRPSettings settingsWithKey:@"Field1" defaultValue:@""]
                                                          placeholder:@"Enter Some text"
                                                     postNotification:nil
                                                          changeBlock:^(UITextField *sender) {
                                                              NSLog(@"textfield 1 text is: %@",[(UITextField *)sender text]);
                                                          }];
    [section1 addCell:textFieldCell];
    
    
    
    [section1 addCell:[FRPLinkCell cellWithTitle:@"Link Cell" selectedBlock:^(id sender) {
        NSLog(@"%@ is selected",[sender class]);
    }]];
    
    
    
    FRPListCell *listCell = [FRPListCell cellWithTitle:@"List Cell"
                                               setting:[FRPSettings settingsWithKey:@"ListCellKey" defaultValue:@"Value1"]
                                                 items:@[@"Item 1",@"Item 2",@"Item 3",@"Item 4"]
                                                 value:@[@"value1",@"value2",@"value3",@"value4"]
                                       popViewOnSelect:YES
                                      postNotification:nil
                                          changedBlock:^(NSString *value) {
                                              NSLog(@"Did Select Value: %@",value);
                                          }];
    [section1 addCell:listCell];
    
    
    
    FRPSliderCell *sliderCell = [FRPSliderCell cellWithTitle:@"Slider Cell"
                                                     setting:[FRPSettings settingsWithKey:@"SliderKey" defaultValue:[NSNumber numberWithFloat:150]]
                                                         min:0.0
                                                         max:255.0
                                            postNotification:nil
                                                 changeBlock:^(UISlider *slider) {
                                                     NSLog(@"Slider Value changed: %f",[(UISlider *)slider value]);
                                                 }];
    [section1 addCell:sliderCell];
    
    
    
    FRPSegmentCell *segmentCell = [FRPSegmentCell cellWithTitle:@"Segment Cell"
                                                        setting:[FRPSettings settingsWithKey:@"SegmentValue" defaultValue:@"6"]
                                                         values:@[@"2",@"5",@"6",@"All"]
                                                displayedValues:@[@"Two",@"Five",@"Six",@"All"]
                                               postNotification:nil
                                                    changeBlock:^(NSString *item) {
                                                        NSLog(@"Selected Item: %@",item);
                                                    }];
    [section1 addCell:segmentCell];
    
    
    FRPViewCell *viewCell = [FRPViewCell cellWithHeight:60
                                              initBlock:^(UITableViewCell *cell) {
                                                  cell.backgroundColor = [UIColor colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:1.0f];
                                                  UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
                                                  label.text = @"Customized Cell View";
                                                  label.textColor = greenColor;
                                                  label.textAlignment = NSTextAlignmentCenter;
                                                  label.tag = 123;
                                                  [cell.contentView addSubview:label];
                                              }
                                            layoutBlock:^(UITableViewCell *cell) {
                                                UILabel *label = (UILabel *)[cell.contentView viewWithTag:123];
                                                label.frame = CGRectMake(0, 0, cell.contentView.frame.size.width, 60);
                                            }];
    
    
    [section1 addCell:viewCell];
    
    
    [section1 addCell:[FRPValueCell cellWithTitle:@"Title" detail:@"Detail Text"]];
    
    
    
    
    FRPSection *section2 = [FRPSection sectionWithTitle:@"Section 2 Title" footer:@"Some footer for section 2"];
    
    
    [section2 addCell:[FRPSwitchCell cellWithTitle:@"Switch 2" setting:[FRPSettings settingsWithKey:@"Switch1" defaultValue:@NO] postNotification:nil changeBlock:^(id sender) {
        NSLog(@"switch 1 is: %@",[(UISwitch *)sender isOn]?@"ENABLED":@"DISABLED");
    }]];
    
    
    FRPLinkCell *subTableLinkCell = [FRPLinkCell cellWithTitle:@"New Settings Window" selectedBlock:^(id sender) {
        
        FRPSection *subSection1 = [FRPSection sectionWithTitle:@"Section 1 Title" footer:@"Some footer for section 1"];
        [subSection1 addCell:[FRPSwitchCell cellWithTitle:@"Switch 1" setting:[FRPSettings settingsWithKey:@"Switch1" defaultValue:@NO] postNotification:nil changeBlock:^(id sender) { }]];
        
        FRPSection *subSection2 = [FRPSection sectionWithTitle:@"Section 2 Title" footer:@"Some footer for section 1"];
        [subSection2 addCell:[FRPSwitchCell cellWithTitle:@"Switch 2" setting:[FRPSettings settingsWithKey:@"Switch2" defaultValue:@NO] postNotification:nil changeBlock:^(id sender) { }]];
        
        FRPreferences *subTable = [FRPreferences tableWithSections:@[subSection1,subSection2] title:@"Sub Table" tintColor:greenColor];
        [self.navigationController pushViewController:subTable animated:YES];
        
    }];
    
    [section2 addCell:subTableLinkCell];
    
    [section2 addCell:[FRPDeveloperCell cellWithTitle:@"Fouad Raheb" detail:@"@iF0u4d" image:[UIImage imageNamed:@"logo.png"] url:@"http://f0u4d.com/twitter"]];
    
    
    FRPreferences *table = [FRPreferences tableWithSections:@[headerSection,section1,section2]
                                                      title:@"FRPreferences"
                                                  tintColor:greenColor];
    
    
    UIBarButtonItem *heart = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"heart.png"] style:UIBarButtonItemStylePlain target:self action:@selector(shareTapped:)];
    table.navigationItem.rightBarButtonItem = heart;
    
    [self.navigationController pushViewController:table animated:YES];
    
    table.navigationController.navigationBar.tintColor = greenColor;
    
    
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$WASettingsViewController = objc_getClass("WASettingsViewController"); _logos_superclass$_ungrouped$WASettingsViewController = class_getSuperclass(_logos_class$_ungrouped$WASettingsViewController); { _logos_register_hook$(_logos_class$_ungrouped$WASettingsViewController, @selector(viewDidAppear:), (IMP)&_logos_method$_ungrouped$WASettingsViewController$viewDidAppear$, (IMP *)&_logos_orig$_ungrouped$WASettingsViewController$viewDidAppear$);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$WASettingsViewController, @selector(loadNewSettings:), (IMP)&_logos_method$_ungrouped$WASettingsViewController$loadNewSettings$, _typeEncoding); }} }
#line 310 "/Users/nawafmansour/Desktop/Whats2-SCLAlertView/Whats2/Whats2.xm"
