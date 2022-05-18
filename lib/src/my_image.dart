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
  //错误图片资源
  final String errorAssetPath;
  //初始化图片资源
  final String placeholderAssetPath;

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
      this.errorAssetPath,
      this.placeholderAssetPath})
      : imageUrl = null;

  @override
  Widget build(BuildContext context) {
    if (assetPath == null && imageUrl != null) {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
      );
    } else {
      return Image.asset(
        assetPath,
        width: width,
        height: height,
        fit: fit,
      );
    }
  }
}
