//
//  HZTScreenDapter.h
//  DYDemo
//
//  Created by wangxw on 2020/12/9.
//  Copyright © 2020 wangxw. All rights reserved.
//

#ifndef HZTScreenDapter_h
#define HZTScreenDapter_h
/**屏幕宽度*/
#define kScreenW  [UIScreen mainScreen].bounds.size.width
/**屏幕高度*/
#define kScreenH  [UIScreen mainScreen].bounds.size.height
/**状态栏高度*/
#define StatusHeight  [[UIApplication sharedApplication] statusBarFrame].size.height
/**导航栏高度*/
#define  NavBarHeight  StatusHeight + 44

#define IS_PAD (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)

#endif /* HZTScreenDapter_h */
