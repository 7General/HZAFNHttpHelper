# HZAFNHttpHelper
* AFN网络请求
* 方便跨界搞定网络请求
* 本工具类，展示了封装好的POST和GET请求
* 供大家一块学习



## <a id="HZAFNHttpHelper"></a>HZAFNHttpHelper

  ### 发起GET请求
  ```objc
  [self.view showHUDIndicatorViewAtCenter:@"HelperGET加载"];
    
    NSDictionary * parameterslist = @{@"client_id":@"qyer_android",@"client_secret":@"9fcaae8aefc4f9ac4915",@"forum_id":@"1"};
        [[AFNHttpHelper defaultManager] requestHttpByUserWithString:@"list" parameters:parameterslist success:^(id responseObject) {
            NSLog(@"---->>>>%@",responseObject);
            [self.view hideHUDIndicatorViewAtCenter];
            [self.view showHUDIndicatorViewSuccessAtCenter:@"加载成功"];
        } failure:^(id error) {
            NSLog(@"----<<<<<<<%@",error);
         [self.view showHUDViewErrorAtCenter:@"加载失败"];
        }];

  ```
  ### 发起POST 请求
  ```objc
  [self.view showHUDIndicatorViewAtCenter:@"HelperPOST加载"];
    NSDictionary *parameters = @{@"phone":@"15010206793",@"pwd":@"123456",@"device_token":@"71c26d22d85686e37658524adc1541ce88bc05c4f0e788b0ffe315e9e3f98378",@"client_type":@1};
        [[AFNHttpHelper defaultManager] requestHttpByUserWithString:@"login" parameters:parameters success:^(id responseObject) {
            NSLog(@"---->>>>%@",responseObject);
            [self.view hideHUDIndicatorViewAtCenter];
            [self.view  showHUDViewSuccessAtCenter:@"加载成功"];
        } failure:^(id error) {
            NSLog(@"----<<<<<<<%@",error);
            [self.view showHUDViewErrorAtCenter:@"加载失败"];
        }];

  ```

简单易用，易扩展，方便，还是洲洲哥好


## <a id="AFHttpTool"></a>AFHttpTool

这里设置了一个类似一个栈区的管理数组，方便获取，和取消

### 发起GET请求
```objc
[self.view showHUDIndicatorViewAtCenter:@"加载中"];
    NSDictionary * parameters = @{@"client_id":@"qyer_android",@"client_secret":@"9fcaae8aefc4f9ac4915",@"forum_id":@"1"};
    [[AFHttpTool defaultManager] requestHttpByUserWithString:@"list" parameters:parameters success:^(id responseObject) {
        NSLog(@"----->>>>%@",responseObject);
        [self.view hideHUDIndicatorViewAtCenter];
    } failure:^(NSError *error) {
        NSLog(@"---<<<<<<%@",error);
        [self.view hideHUDIndicatorViewAtCenter];
    }];
```

### 发起POST请求
```objc
[self.view showHUDIndicatorViewAtCenter:@"加载中"];
    NSDictionary *parameters = @{@"phone":@"15010206793",@"pwd":@"123456",@"device_token":@"71c26d22d85686e37658524adc1541ce88bc05c4f0e788b0ffe315e9e3f98378",@"client_type":@1};
    [[AFHttpTool defaultManager] requestHttpByUserWithString:@"login" parameters:parameters success:^(id responseObject) {
        NSLog(@"----->>>>%@",responseObject);
        [self.view hideHUDIndicatorViewAtCenter];
    } failure:^(NSError *error) {
        NSLog(@"---<<<<<<%@",error);
        [self.view hideHUDIndicatorViewAtCenter];
    }];

```
里面具体的函数，各位看官请下载源代码，研究！！！不懂得地方可添加洲洲哥的QQ号：1290925041


## 更多消息
 更多信iOS开发信息 请以关注洲洲哥 的微信公众号，不定期有干货推送：
 
 ![(logo)](https://mmbiz.qlogo.cn/mmbiz/wFa30ADx7kLiboiaPKbKSTypo5VSAOShxYUf5zZ4JgQqadyy8J6GzHFvfAYicu5F8Ew0ngVibRM8qcaSxtjyX3blPA/0?wx_fmt=jpeg)

