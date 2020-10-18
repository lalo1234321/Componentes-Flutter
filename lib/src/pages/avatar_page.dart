import 'package:flutter/material.dart';


class AvatarPage extends StatelessWidget {
  const AvatarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://estaticos.muyinteresante.es/media/cache/1140x_thumb/uploads/images/gallery/594a1ced5bafe85dfd3c9869/gato-romano_0.jpg'),
              radius: 25.0,
            ),
          ),
          Container(
            //Container tiene margenes
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child:Text('EC'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body:Center(
        child:FadeInImage(
          image: NetworkImage('https://www.infobae.com/new-resizer/uNiXguPtw9j0rrP_0Pita7pbaio=/1200x900/filters:format(jpg):quality(85)/s3.amazonaws.com/arc-wordpress-client-uploads/infobae-wp/wp-content/uploads/2017/01/23111821/gato-1920.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
        )
      )
    );
  }
}