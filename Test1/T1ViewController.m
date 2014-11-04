//
//  T1ViewController.m
//  Test1
//
//  Created by 董金亮 on 14-8-31.
//  Copyright (c) 2014年 董金亮. All rights reserved.
//

#import "T1ViewController.h"
#import "T2ViewController.h"
@interface T1ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) IBOutlet UITableView* tableView;
@property(nonatomic,strong) NSArray* arr;
@property(nonatomic,strong) NSArray* arr1;
@end

@implementation T1ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.arr = [NSArray arrayWithObjects:@"1",@"2",@"3", nil];
    self.arr1 = [NSArray arrayWithObjects:@"1",@"2",@"3", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.arr1.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* identifier = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    
    UIBezierPath* maskPath = [UIBezierPath bezierPathWithRoundedRect:cell.bounds byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(10 , 10)];
   
    CAShapeLayer* maskLayer = [CAShapeLayer new];
   
    maskLayer.frame = cell.bounds;
    maskLayer.borderWidth = 1.0;
    maskLayer.borderColor = [[UIColor yellowColor] CGColor];
   // maskLayer.strokeColor = [[UIColor yellowColor] CGColor];
    maskLayer.fillColor = [UIColor whiteColor].CGColor;
    //maskLayer.fillColor = [[UIColor yellowColor] CGColor];
    maskLayer.path = maskPath.CGPath;
    //[cell.layer addSublayer:maskLayer];
    cell.layer.mask = maskLayer;
    cell.textLabel.text = self.arr[indexPath.section];
    cell.textLabel.textColor = [UIColor blueColor];
    return cell;
}

//- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window{
//    return UIInterfaceOrientationMaskPortrait;
//}
//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
//    return toInterfaceOrientation != UIInterfaceOrientationMaskPortrait;
//}
//- (BOOL)shouldAutorotate{return YES;}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    T2ViewController* t2 = [[T2ViewController alloc]init];
    [self.view addSubview:t2.view];
}
@end
