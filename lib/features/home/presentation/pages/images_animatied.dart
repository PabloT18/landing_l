import 'package:flutter/material.dart';
import 'package:landing_l/core/config/responsive/responsive_wid.dart';
import 'package:landing_l/core/config/router/app_routes_assets.dart';
import 'package:landing_l/core/config/theme/app_colors.dart';

class ImagesAnimation extends StatelessWidget {
  const ImagesAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ZoomAnimations(
          path: AppAssets.par1,
        ),
        ZoomAnimations(
          path: AppAssets.par2,
        ),
        ZoomAnimations(
          path: AppAssets.par3,
          boxfit: BoxFit.contain,
        ),
        ZoomAnimations(
          path: AppAssets.par4,
        ),
        ZoomAnimations(
          path: AppAssets.par5,
        ),
        ZoomAnimations(
          path: AppAssets.par6,
        ),
        ZoomAnimations(
          path: AppAssets.par7,
        ),
        ZoomAnimations(
          path: AppAssets.par8,
        ),
        ZoomAnimations(
          path: AppAssets.par9,
        ),
      ],
    );
  }
}

class ZoomAnimations extends StatefulWidget {
  const ZoomAnimations(
      {super.key, required this.path, this.boxfit = BoxFit.cover});

  final String path;
  final BoxFit boxfit;
  @override
  State<ZoomAnimations> createState() => _ZoomAnimationsState();
}

class _ZoomAnimationsState extends State<ZoomAnimations>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller2;
  late final Animation<AlignmentGeometry> _alignAnimation;
  late Animation sizeAnimation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));

    sizeAnimation = Tween(begin: 0.0, end: 0.2).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.40, 0.75, curve: Curves.easeOut)));
    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
    //
    _controller2 = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..repeat(reverse: true);

    _alignAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).animate(
      CurvedAnimation(
        parent: _controller2,
        curve: Curves.easeInOutCubic,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  void _showFullImage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Hero(
          tag: widget.path,
          child: ResponsiveWid(
            mobile: _buildImage(context, width: 300, height: 300),
            tablet: _buildImage(context, width: 500, height: 500),
            desktop: _buildImage(context, width: 800, height: 800),
          ),
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context,
      {double width = 300, double height = 300}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.rectangle,
          // borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: widget.boxfit,
            image: AssetImage(widget.path),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return GestureDetector(
      onTap: () => _showFullImage(context),
      child: Hero(
        tag: widget.path,
        child: SizedBox(
          width: size.width / 4,
          height: size.width / 4,
          child: AlignTransition(
            alignment: _alignAnimation,
            child: CustomOutline(
              strokeWidth: 5,
              radius: size.width * 0.2,
              padding: const EdgeInsets.all(5),
              width: size.width * sizeAnimation.value,
              height: size.width * sizeAnimation.value,
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.secondaryBlue,
                    AppColors.secondaryBlue.withOpacity(0),
                    theme.primaryColor.withOpacity(0.1),
                    theme.primaryColor
                  ],
                  stops: const [
                    0.2,
                    0.4,
                    0.6,
                    1
                  ]),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // color: Colors.black.withOpacity(0.8),
                  color: Colors.red,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: Alignment.bottomLeft,
                      image: AssetImage(widget.path)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomOutline extends StatelessWidget {
  final _GradientPainter _painter;
  final Widget _child;

  final double _width;
  final double _height;
  final EdgeInsetsGeometry _padding;

  CustomOutline({
    super.key,
    required double strokeWidth,
    required double radius,
    required Gradient gradient,
    required Widget child,
    required double width,
    required double height,
    required EdgeInsetsGeometry padding,
  })  : _painter = _GradientPainter(
            strokeWidth: strokeWidth, radius: radius, gradient: gradient),
        _child = child,
        _width = width,
        _height = height,
        _padding = padding;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _painter,
      child: Container(
        width: _width,
        height: _height,
        // ignore: sort_child_properties_last
        child: _child,
        padding: _padding,
      ),
    );
  }
}

class _GradientPainter extends CustomPainter {
  final Paint _paint = Paint();
  final double _radius;
  final double _strokeWidth;
  final Gradient _gradient;

  _GradientPainter(
      {required double strokeWidth,
      required double radius,
      required Gradient gradient})
      : _strokeWidth = strokeWidth,
        _radius = radius,
        _gradient = gradient;

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equals size
    Rect outerRect = Offset.zero & size;
    var outerRRect = RRect.fromRectAndRadius(
      outerRect,
      Radius.circular(_radius),
    );

    // create inner rectangle smaller by strokeWidth
    Rect innerRect = Rect.fromLTWH(_strokeWidth, _strokeWidth,
        size.width - _strokeWidth * 2, size.height - _strokeWidth * 2);
    var innerRRect = RRect.fromRectAndRadius(
        innerRect, Radius.circular(_radius - _strokeWidth));

    // apply gradient shader
    _paint.shader = _gradient.createShader(outerRect);

    // create difference between outer and inner paths and draw it
    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    var path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
