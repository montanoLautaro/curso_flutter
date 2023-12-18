import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    //* PageView es un widget que nos permite un scroll (lateral o vertical) de la pantalla completa
    //* ta fino
    return PageView.builder(
      scrollDirection: Axis.vertical,
      // fisicas al scrollear
      physics: const BouncingScrollPhysics(),

      itemCount: videos.length,

      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];

        //* Permite colocar un widget encima del otro
        return Stack(
          children: [
            // Video player + gradientes
            //* SizedBox.expand toma todo el tamaño del contenedor
            SizedBox.expand(
              child: FullScreenPlayer(
                  videoUrl: videoPost.videoUrl, caption: videoPost.caption),
            ),
            // botones
            //* Widget para ubicar a un elemento en pantalla
            Positioned(
                bottom: 40, right: 20, child: VideoButtons(video: videoPost))
          ],
        );
      },
    );
  }
}
