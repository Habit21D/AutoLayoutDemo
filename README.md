# AutoLayoutDemo

### 语言OC，autolayout采用Masonry

未做swift的demo，swift可以选择snapKit，约束语法同Masonry

[效果](https://github.com/a96369928/AutoLayoutDemo/blob/master/demo.gif)

demo中介绍了以下内容：
* UIView：superView根据subView适配宽高，变高动画
* UILabel：label根据文字内容自动适配大小（支持富文本）
* UIImageView：imageView根据image适配大小
* UITextView： textView根据输入内容动态变换高度
* UITableView： tableView的cell不用计算大小，根据cell内容自动变高。并实现了cell中嵌套textView实现变高
* UICollectionView：cell根据内容确定size
* UIScrollView：scrollView根据内容自己计算contentSize

**autolayout主要的使用都在了，其他视图大家可以举一反三，大同小异**
