import Bar from '../common/component/Bar'
import HomeHeader from '../view/HomeHeader'
import HomeMenber from '../view/HomeMenber'
import HomeNav from '../view/HomeNav'
import HomeSearch from '../view/HomeSearch'
import HomeShop from '../view/HomeShop'

@Entry
@Component
struct Index {
  scroller: Scroller = new Scroller()
  @State arriveLocation: number = 0

  build() {
    Column() {
      // 头部
      HomeHeader()

      Scroll(this.scroller) {
        Column() {

          // welcome和 查找
          HomeSearch({ arriveLocation: this.arriveLocation })
            .zIndex(1)
          // Nav部分
          HomeNav()

          // 会员
          HomeMenber()

          //商铺
          HomeShop()
        }

      }
      // 关闭滑动栏
      .scrollBar(BarState.Off)
      // 获取位置信息
      .onWillScroll(() => {
        this.arriveLocation = this.scroller.currentOffset().yOffset
      })

      // 选择页面
      Bar({ current: 0 })

    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Start)
    .backgroundImage($r('app.media.HeaderBackground'))
    .backgroundImageSize({
      width: '100%',
      height: 75
    })
    .backgroundColor('#F4F8FB')
  }
}
