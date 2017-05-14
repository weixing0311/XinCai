//
//  UIViewController+Swizzle.m
//  designer
//
//  Created by wujunyang on 16/3/2.
//  Copyright © 2016年 zhangchun. All rights reserved.
//

#import "UIViewController+Swizzle.h"


@implementation UIViewController (Swizzle)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL origSel = @selector(viewDidAppear:);
        SEL swizSel = @selector(swiz_viewDidAppear:);
        [UIViewController swizzleMethods:[self class] originalSelector:origSel swizzledSelector:swizSel];
        
        SEL vcWillAppearSel=@selector(viewWillAppear:);
        SEL swizWillAppearSel=@selector(swiz_viewWillAppear:);
        [UIViewController swizzleMethods:[self class] originalSelector:vcWillAppearSel swizzledSelector:swizWillAppearSel];
        
        SEL vcDidDisappearSel=@selector(viewDidDisappear:);
        SEL swizDidDisappearSel=@selector(swiz_viewDidDisappear:);
        [UIViewController swizzleMethods:[self class] originalSelector:vcDidDisappearSel swizzledSelector:swizDidDisappearSel];
        
        SEL vcWillDisappearSel=@selector(viewWillDisappear:);
        SEL swizWillDisappearSel=@selector(swiz_viewWillDisappear:);
        [UIViewController swizzleMethods:[self class] originalSelector:vcWillDisappearSel swizzledSelector:swizWillDisappearSel];
    });
}

+ (void)swizzleMethods:(Class)class originalSelector:(SEL)origSel swizzledSelector:(SEL)swizSel
{
    Method origMethod = class_getInstanceMethod(class, origSel);
    Method swizMethod = class_getInstanceMethod(class, swizSel);
    
    //class_addMethod will fail if original method already exists
    BOOL didAddMethod = class_addMethod(class, origSel, method_getImplementation(swizMethod), method_getTypeEncoding(swizMethod));
    if (didAddMethod) {
        class_replaceMethod(class, swizSel, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    } else {
        //origMethod and swizMethod already exist
        method_exchangeImplementations(origMethod, swizMethod);
    }
}

- (void)swiz_viewDidAppear:(BOOL)animated
{
    //可以对控制器名称做过滤 达到过滤哪些是不操作
    NSString *curClassName=NSStringFromClass([self class]);
//    if (curClassName.length>0&&([curClassName isEqualToString:@"ZUHomeRecommendViewController"]||[curClassName isEqualToString:@"ZUHomeServiceViewController"]||[curClassName isEqualToString:@"ZUHomeBroadcastViewController"]||[curClassName isEqualToString:@"ZUHomeMineViewController"])) {
//        [self.rdv_tabBarController setTabBarHidden:NO animated:YES];
//    }
    [self swiz_viewDidAppear:animated];
}

-(void)swiz_viewWillAppear:(BOOL)animated
{
    
    if ([[self.navigationController childViewControllers] count] > 1) {
    }
    
    [self swiz_viewWillAppear:animated];
}

-(void)swiz_viewDidDisappear:(BOOL)animated
{
    [self swiz_viewDidDisappear:animated];
}

-(void)swiz_viewWillDisappear:(BOOL)animated
{
    [self swiz_viewWillDisappear:animated];
}

@end
