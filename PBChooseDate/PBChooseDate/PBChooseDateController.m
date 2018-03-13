//
//  PBChooseDateController.m
//  PBChooseDate
//
//  Created by Playboy on 2018/1/8.
//  Copyright © 2018年 tmkj. All rights reserved.
//

#import "PBChooseDateController.h"
#import "ZYCalendarView.h"

@interface PBChooseDateController ()
@property (strong, nonatomic) IBOutlet UILabel *firstWeakLabel;
@property (strong, nonatomic) IBOutlet UILabel *firstDateLabel;
@property (strong, nonatomic) IBOutlet UILabel *secWeakLabel;
@property (strong, nonatomic) IBOutlet UILabel *secDateLabel;
@property (strong, nonatomic) IBOutlet UILabel *sumNumLabel;


@end

@implementation PBChooseDateController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self configure];
}
- (void)configure {
    [self configureView];
    [self configureData];
}

- (void)configureView {
    
    ZYCalendarView *view = [[ZYCalendarView alloc] initWithFrame:CGRectMake(0, 64+190, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-190)];
    
    // 不可以点击已经过去的日期
    view.manager.canSelectPastDays = false;
    // 可以选择时间段
    view.manager.selectionType = ZYCalendarSelectionTypeRange;
    
    // 设置被选中颜色
    view.manager.selectedBackgroundColor = [UIColor lightGrayColor];
    
    // 设置当前日期 请在所有参数设置完之后设置日期
    view.date = [NSDate date];
    
    view.dayViewBlock = ^(ZYCalendarManager *manager, NSDate *dayDate) {
        
        if (manager.selectedDateArray.count == 1) {
            self.firstDateLabel.text = [manager.dateFormatter stringFromDate:manager.selectedDateArray[0]];
            self.firstWeakLabel.text = [self getWeakFromDate:manager.selectedDateArray[0]];
            self.secWeakLabel.text = @"";
            self.secDateLabel.text = @"";
            self.sumNumLabel.text = @"";
        }else {
            self.firstDateLabel.text = [manager.dateFormatter stringFromDate:manager.selectedDateArray[0]];
            self.secDateLabel.text = [manager.dateFormatter stringFromDate:manager.selectedDateArray[1]];
            self.firstWeakLabel.text = [self getWeakFromDate:manager.selectedDateArray[0]];
            self.secWeakLabel.text = [self getWeakFromDate:manager.selectedDateArray[1]];
            NSTimeInterval time = [manager.selectedDateArray[1] timeIntervalSinceDate:manager.selectedDateArray[0]];
            NSInteger days = (NSInteger)time/(3600*24);
            self.sumNumLabel.text = [NSString stringWithFormat:@"共%zd晚",days];
        }
        for (NSDate *date in manager.selectedDateArray) {
            NSLog(@"%@\n", [manager.dateFormatter stringFromDate:date]);
        }
    };
    [self.view addSubview:view];
    
}
- (void)configureData {
    
}

- (NSString *)getWeakFromDate:(NSDate *)date {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    comps = [calendar components:unitFlags fromDate:date];
    if ([comps weekday] == 1) {
        return @"星期日";
    }else if ([comps weekday] == 2) {
        return @"星期一";
    }else if ([comps weekday] == 3) {
        return @"星期二";
    }else if ([comps weekday] == 4) {
        return @"星期三";
    }else if ([comps weekday] == 5) {
        return @"星期四";
    }else if ([comps weekday] == 6) {
        return @"星期五";
    }else if ([comps weekday] == 7) {
        return @"星期六";
    }
    return @"";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
