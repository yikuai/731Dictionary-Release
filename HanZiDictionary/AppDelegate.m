//
//  AppDelegate.m
//  HanZiDictionary
//
//  Created by ibokan on 13-6-21.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "MainViewController.h"

#import "SpellRetrieveViewController.h"
#import "DetailBasicViewController.h"
//分享=============先导入第三方类库，再导入以下文件
#import <ShareSDK/ShareSDK.h>
#import<TencentOpenAPI/QQApiInterface.h>
#import<TencentOpenAPI/TencentOAuth.h>
#import "WBApi.h"
#import "WXApi.h"
@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    /**
     注册SDK应用，此应用请到http://www.sharesdk.cn中进行注册申请。
     此方法必须在启动时调用，否则会限制SDK的使用。
     **/
    [ShareSDK registerApp:@"51b22a65db0"];
    [ShareSDK convertUrlEnabled:NO];
    [self initializePlat];
    
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];    
    self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] autorelease];    
//    OpenViewController *open=[[OpenViewController alloc]init];
    MainViewController *main=[[[MainViewController alloc]init]autorelease];
    UINavigationController *nav=[[[UINavigationController alloc]initWithRootViewController:main]autorelease];
    nav.navigationBarHidden=YES;
    self.window.rootViewController = nav;
    
    
    //+++++++++++++
    
    
    
    [self.window makeKeyAndVisible];
    return YES;
}
- (void)initializePlat
{
    //添加新浪微博应用sinaweibosso.3201194191
    [ShareSDK connectSinaWeiboWithAppKey:@"3201194191" appSecret:@"0334252914651e8f76bad63337b3b78f"
                             redirectUri:@"http://appgo.cn"];
    
    //添加QQ空间应用
    [ShareSDK connectQZoneWithAppKey:@"100371282"
                           appSecret:@"aed9b0303e3ed1e27bae87c33761161d"
                   qqApiInterfaceCls:[QQApiInterface class]
                     tencentOAuthCls:[TencentOAuth class]];
    
    //腾讯微博
    [ShareSDK connectTencentWeiboWithAppKey:@"801307650"
                                  appSecret:@"ae36f4ee3946e1cbb98d6965b0b2ff5c"
                                redirectUri:@"http://www.sharesdk.cn"
                                   wbApiCls:[WBApi class]];
    
    
    //添加开心网
    //    [ShareSDK connectKaiXinWithAppKey:@"358443394194887cee81ff5890870c7c"
    //                            appSecret:@"da32179d859c016169f66d90b6db2a23"
    //                          redirectUri:@"http://www.sharesdk.cn/"];
    [ShareSDK connectKaiXinWithAppKey:@"5675714382538d1a2f6e98cc7403df0f"
                            appSecret:@"e702245017c19ab1bc80deefc27b2079"
                          redirectUri:@"http://www.sharesdk.cn/"];
    
    //人人网
    [ShareSDK connectRenRenWithAppKey:@"fc5b8aed373c4c27a05b712acba0f8c3"
                            appSecret:@"f29df781abdd4f49beca5a2194676ca4"];
    
    //网易微博
    [ShareSDK connect163WeiboWithAppKey:@"T5EI7BXe13vfyDuy"
                              appSecret:@"gZxwyNOvjFYpxwwlnuizHRRtBRZ2lV1j"
                            redirectUri:@"http://www.shareSDK.cn"];
    
    //添加搜狐微博应用
    [ShareSDK connectSohuWeiboWithConsumerKey:@"SAfmTG1blxZY3HztESWx"
                               consumerSecret:@"yfTZf)!rVwh*3dqQuVJVsUL37!F)!yS9S!Orcsij" redirectUri:@"http://www.sharesdk.cn"];
    
    
    
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
