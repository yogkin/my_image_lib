import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  //资源路径
  final String assetPath;

  //网络图片url
  final String imageUrl;
  //宽
  final double width;
  //高
  final double height;
  //image fix
  final BoxFit fit;

  final int cacheWidth;
  final int cacheHeight;
  final Rect centerSlice;

  ///可选构建器，进一步自定义图像的显示。
  final ImageWidgetBuilder imageBuilder;

  ///加载目标 [imageUrl] 时显示的Widget。
  final PlaceholderWidgetBuilder placeholder;

  ///加载目标 [imageUrl] 时显示的Widget。
  final ProgressIndicatorBuilder progressIndicatorBuilder;

  ///目标 [imageUrl] 加载失败时显示的Widget。
  final LoadingErrorWidgetBuilder errorWidget;

  ///[占位符] 的淡入动画的持续时间。
  final Duration placeholderFadeInDuration;

  ///[placeholder] 的淡出动画的持续时间。
  final Duration fadeOutDuration;

  ///[placeholder] 的淡出动画曲线。
  final Curve fadeOutCurve;

  ///[imageUrl] 的淡入动画的持续时间。
  final Duration fadeInDuration;

  ///[imageUrl] 的淡入动画曲线。
  final Curve fadeInCurve;

  ///如何在其边界内对齐图像。
  ///
  ///对齐将图像中的给定位置与给定位置对齐
  ///在布局范围内。例如，一个 [Alignment] 对齐 (-1.0,
  ///-1.0) 将图像对齐到其布局边界的左上角，而
  ///[Alignment] 对齐 (1.0, 1.0) 对齐右下角
  ///具有布局边界右下角的图像。同样，一个
  ///(0.0, 1.0)的对齐方式将图像的底部中间对齐
  ///其布局边界的底部边缘的中间。
  ///
  ///如果 [alignment] 依赖于 [TextDirection]（即，如果它是
  ///[AlignmentDirectional])，然后是环境 [Directionality] Widget
  ///必须在范围内。
  ///
  ///默认为 [Alignment.center]。
  ///
  ///也可以看看：
  ///
  ///*[Alignment]，一个带有方便常量的类，通常用于
  ///指定一个 [AlignmentGeometry]。
  ///*[AlignmentDirectional]，类似于 [Alignment] 用于指定对齐方式
  ///相对于文本方向。
  final AlignmentGeometry alignment;

  ///如何绘制图像未覆盖的布局边界的任何部分。
  final ImageRepeat repeat;

  ///是否在[TextDirection]的方向上绘制图像。
  ///
  ///如果这是真的，那么在 [TextDirection.ltr] 上下文中，图像将是
  ///原点在左上角绘制（“正常”的绘制方向为
  ///孩子们）;在 [TextDirection.rtl] 上下文中，将使用
  ///水平方向的比例因子为-1，因此原点为
  ///在右上角。
  ///
  ///这偶尔会在从右到左的环境中与孩子一起使用，因为
  ///为从左到右的语言环境设计的子项。小心，当
  ///使用这个，不翻转带有完整阴影、文本或其他的子元素
  ///翻转时看起来不正确的效果。
  ///
  ///如果这是真的，那么必须有一个环境 [Directionality] Widget
  ///范围。
  final bool matchTextDirection;

  //图片 url 的 http 请求的可选标头
  final Map<String, String> httpHeaders;

  ///当设置为true时，它将从旧图像动画到新图像
  ///如果网址发生变化。
  final bool useOldImageOnUrlChange;

  ///如果非空，则使用 [colorBlendMode] 将此颜色与每个图像像素混合。
  final Color color;

  ///用于将 [color] 与此图像结合。
  ///
  ///默认为 [BlendMode.srcIn]。在混合模式方面，[颜色]是
  ///源，这个图像是目标。
  ///
  ///也可以看看：
  ///
  ///*[BlendMode]，其中包括每种混合模式效果的图示。
  final BlendMode colorBlendMode;

  ///针对图像缩放的插值质量。
  ///
  ///如果没有给定值，默认为 FilterQuality.low。
  final FilterQuality filterQuality;

  ///本地图片加载
  ///
  ///[assetPath] 图片资源路径
  ///[width] 图片宽
  ///[height] 图片高
  ///[fit] 图片缩放方式
  ///[errorAssetPath] 图片加载失败时显示的图片
  ///[placeholderAssetPath] 图片加载时显示的图片
  ///
  MyImage.asset(this.assetPath,
      {this.width,
      this.height,
      this.fit,
      this.cacheWidth,
      this.cacheHeight,
      this.centerSlice})
      : assert(assetPath != null),
        imageUrl = null,
        placeholder = null,
        progressIndicatorBuilder = null,
        errorWidget = null,
        placeholderFadeInDuration = null,
        fadeOutDuration = null,
        fadeOutCurve = null,
        fadeInDuration = null,
        fadeInCurve = null,
        alignment = null,
        repeat = null,
        matchTextDirection = null,
        imageBuilder = null,
        httpHeaders = null,
        useOldImageOnUrlChange = null,
        color = null,
        colorBlendMode = null,
        filterQuality = null;

  ///网络图片加载加载
  MyImage.network(this.imageUrl,
      {this.width,
      this.height,
      this.fit,
      this.cacheWidth,
      this.cacheHeight,
      this.centerSlice,
      this.assetPath,
      this.imageBuilder,
      this.placeholder,
      this.progressIndicatorBuilder,
      this.errorWidget,
      this.placeholderFadeInDuration,
      this.fadeOutDuration,
      this.fadeOutCurve,
      this.fadeInDuration,
      this.fadeInCurve,
      this.alignment,
      this.repeat,
      this.matchTextDirection,
      this.httpHeaders,
      this.useOldImageOnUrlChange,
      this.color,
      this.colorBlendMode,
      this.filterQuality})
      : assert(imageUrl != null);

  @override
  Widget build(BuildContext context) {
    if (assetPath == null && imageUrl != null) {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        imageBuilder: imageBuilder,
        placeholder: placeholder,
        progressIndicatorBuilder: progressIndicatorBuilder,
        errorWidget: errorWidget,
        placeholderFadeInDuration: placeholderFadeInDuration,
        fadeOutDuration: fadeOutDuration,
        fadeOutCurve: fadeOutCurve,
        fadeInDuration: fadeInDuration,
        fadeInCurve: fadeInCurve,
        alignment: alignment,
        repeat: repeat,
        matchTextDirection: matchTextDirection,
        httpHeaders: httpHeaders,
        useOldImageOnUrlChange: useOldImageOnUrlChange,
        color: color,
        colorBlendMode: colorBlendMode,
        filterQuality: filterQuality,
      );
    } else {
      return Image.asset(
        assetPath,
        width: width,
        height: height,
        fit: fit,
        centerSlice: centerSlice,
        cacheHeight: cacheHeight,
        cacheWidth: cacheWidth,
      );
    }
  }
}
