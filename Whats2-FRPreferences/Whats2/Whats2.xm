#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "SCLAlertView.h"
#import "ViewController.h"
#import "FRPrefs.h"

%config(generator=internal)

#define greenColor [UIColor colorWithRed:1/255.0f green:152/255.0f blue:117/255.0f alpha:1.0f]


// بداية اكواد الواتس


@interface WAMessage : NSObject
    @property(retain, nonatomic) NSString *text; // @dynamic text;
    @end

@interface WAChatCellData : NSObject
- (id)message;
    @end

@interface WAMessageCell : UITableViewCell
    @property(readonly, nonatomic) WAChatCellData *cellData; // @synthesize cellData=_cellData;
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
    
    @property(nonatomic) _Bool disabled; // @synthesize disabled=_disabled;
    @property(nonatomic, getter=isEditable) _Bool editable; // @synthesize editable=_editable;
    @property(retain, nonatomic) UITableViewCell *cell; // @synthesize cell=_cell;
    @property(copy, nonatomic) id handler; // @synthesize handler=_handler;
    
    @end

@interface WATableSection : NSObject
    {
        NSMutableArray *_rows;
        NSString *_headerText;
        NSString *_footerText;
    }
    
    @property(retain, nonatomic) NSString *footerText; // @synthesize footerText=_footerText;
    @property(retain, nonatomic) NSString *headerText; // @synthesize headerText=_headerText;
    @property(retain, nonatomic) NSArray *rows; // @synthesize rows=_rows;
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
    
    @property(retain, nonatomic) NSArray *sections; // @synthesize sections=_sections;
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

/* نهاية اكواد الواتس*/


%hook WASettingsViewController
- (void)viewDidAppear:(_Bool)arg1{
    SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
    alert.backgroundType = SCLAlertViewBackgroundBlur;
    
        alert.customViewColor = [UIColor colorWithRed:101/255.0f green:188/255.0f blue:84/225.0f alpha:1.0f];
    [alert addButton:@"إعدادات الواتس اب" actionBlock:^{
        %orig;
    }];
    
    [alert addButton:@"إعدادات واتس بلس" target:self selector:@selector(loadNewSettings:)];
    [alert showQuestion:nil subTitle:@"مرحباً بك في اعدادات الواتس اب" closeButtonTitle:@"إلغاء" duration:0.0f];


}

%new
- (void)loadNewSettings:(id)sender{

    FRPViewSection *headerSection = [FRPViewSection sectionWithHeight:70
    initBlock:^(UITableViewCell *cell) {
        /* design your cell as you wish */
        /* block of code executed during cell initialization */
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
      /* block of code executed during cell layoutSubviews */
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
    //    [switchCell.switchView setOnTintColor:[UIColor colorWithRed:0 green:0.545 blue:0.894 alpha:1]];
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
    
    
    /* ANOTHER SECTION */
    
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
    //    table.plistPath = @"some/path/to/file.plist"; // You can set a plistPath if you wish to save values into plist file
    
    UIBarButtonItem *heart = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"heart.png"] style:UIBarButtonItemStylePlain target:self action:@selector(shareTapped:)];
    table.navigationItem.rightBarButtonItem = heart;
    
    [self.navigationController pushViewController:table animated:YES];
    
    table.navigationController.navigationBar.tintColor = greenColor;
    
    
}

%end
