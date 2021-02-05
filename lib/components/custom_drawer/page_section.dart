import 'package:flutter/material.dart';

import 'page_tile.dart';

class PageSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTile(
          label: 'Anúncios',
          iconData: Icons.list,
          onTap: (){},
          highlight: true,
        ),
        PageTile(
          label: 'Inserir Anúncio',
          iconData: Icons.edit,
          onTap: (){},
          highlight: false,
        ),
        PageTile(
          label: 'Chat',
          iconData: Icons.chat,
          onTap: (){},
          highlight: false,
        ),
        PageTile(
          label: 'Favorito',
          iconData: Icons.favorite,
          onTap: (){},
          highlight: false,
        ),
        PageTile(
          label: 'Minha Conta',
          iconData: Icons.person,
          onTap: (){},
          highlight: false,
        ),
      ],
    );
  }
}