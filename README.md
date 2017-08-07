# CoreRouter
The router - to switch between controllers

##### EN:
CoreRouter - is my implementation of the entity which carries out the coordination between controllers in the project. This approach can be used in MVC projects and MVVM

----

##### RU:
CoreRouter - это реализация сущности, которая осуществляет координацию между контроллерами в проекте. Этот подход может быть использован в проектах MVC и mvvm

----

##### DE:
CoreRouter - ist meine Umsetzung der Entität, die durch die Koordination zwischen Controllern in das Projekt. Dieser Ansatz kann verwendet werden, in MVC-Projekten und MVVM

----

##### PL:
CoreRouter - to realizacja istocie, która realizuje koordynację między kontrolerami w projekcie. Podejście to może być stosowane w projektach MVC ta MVVM

----

##### JP:
CoreRouter - は私の実施の主体との連携のコントローラのプロジェクトです。 この手法を使用することができMVCプロジェクトやョ

----

##### CH:
CoreRouter-是我的执行情况的实体，其执行之间的协调，控制该项目。 这种方法可用于视的项目。

----

<br><br><br>
The scheme of interaction:
![alt text](https://raw.githubusercontent.com/HackDeveloperUA/CoreRouter/master/Documentation/Short-Doc.png)


<br>

## Quick Start:

#### Step 1: - Create a class inherited from CoreRouter
```objective-c
@interface Router : CoreRouter
...
@end
```
<br>
<br>

#### Step 2: - Subscribe to protocol CoreRouterProtocol

```objective-c
@interface Router : CoreRouter <CoreRouterProtocol>
....
@end
```
<br>
<br>

#### Step 3: - Implement the methods:
              + (CoreRouter*) shardRouter
              - (void) openApplication

```objective-c

@implementation Router

#pragma mark - Core

+ (Router*) sharedRouter {
    
    static Router* manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[Router alloc] init];
        manager.window = [Router getApplicationWindow];
    });
    return manager;
}

- (void) openApplication
{
    // Debug version
    BOOL isLogin = NO;
    BOOL isLearningOnBoarding = NO;
    
    if (!isLogin){
        [self openYourControllerName];
    }
    else if (!isLearningOnBoarding)
    {
        [self openYourControllerName];
    } else {
        [self openYourControllerName];
    }
}

@end
```
<br>
<br>

#### Step 4: - In the Appdelegate do the import of your router. And in -didFinishLaunchinWithOptions: call the [Router sharedManager] openApplication];

```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    [self.window makeKeyAndVisible];


    [[Router sharedRouter] openApplication];
    return YES;
}
```
<br>
<br>

#### Step 5: - Begin use !

```objective-c
- (void) openLoginVC
{
    LoginVC* vc = [[LoginVC alloc] init];
    //vc.myViewModel =  [LoginViewModel new];
    [Router setToRootView:vc andAnimationOptions:UIViewAnimationOptionTransitionFlipFromLeft];
}
```

## How work navigation in app using CoreRouter

[Link on full size picture](https://raw.githubusercontent.com/HackDeveloperUA/CoreRouter/master/Documentation/HowWorkNavigationWithRouter.png)
![alt text](https://raw.githubusercontent.com/HackDeveloperUA/CoreRouter/master/Documentation/HowWorkNavigationWithRouter.png)
