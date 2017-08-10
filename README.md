# RuntimeWeak
> 使用Runtime为现有的类添加Weak属性
> 
> [blog地址]()

## 写在前面
> 在为现有的类`增加属性`时，我们实现会想到使用`Runtime`的对象绑定来处理，`对象绑定`也是我们在平时的开发中经常使用的`伎俩`,但是这里想增加的是`weak`类型的属性，查看`Apple API` 在对象绑定时没有提供此类型，如果有，那就没有这篇blog了，那么`weak`有扫描特殊性呢？最简单的是`引用计数不加1，不存在相互引用的问题` `在属性释放时自动置nil` `用于对象`等。

## 思考🤔与实现
### 方案1
#### 方案描述
> 那么我们怎么实现类似的功能呢？当然是`从assign`出手，其特性是`引用计数不加1，不存在相互引用的问题` `在属性释放时不自动置nil`等。那么我们可以使用`assign`来模拟实现`weak`属性，只需要在属性释放时自动置nil即可。

#### 方案实现
>简单封装为如下的使用方式

```c
- (void)bm_setWeekAssociatedObjectWithKey:(const void *)key value:(id)value OBJC_AVAILABLE(10.6, 3.1, 9.0, 1.0);

- (id)bm_getWeakAssociatedObjectWithKey:(const void *)key OBJC_AVAILABLE(10.6, 3.1, 9.0, 1.0);
```
>[具体实现请查看Demo](https://github.com/asiosldh/RuntimeWeak)

### 方案2
> 使用`NSPointerArray`处理

## 参考
[https://github.com/ChenYilong/iOSInterviewQuestions](https://github.com/ChenYilong/iOSInterviewQuestions)

## 声明
>感谢收看，有任何疑问和建议可在下方留言（如果不显示评论，搭个梯子就有了），欢迎[Github](https://github.com/asiosldh)点[Star](https://github.com/asiosldh)😁，本文发布于[梁大红的技术Blog](http://idhong.com/)，转载注明出处即可。
