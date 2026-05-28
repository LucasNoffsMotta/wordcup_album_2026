import 'package:flutter/material.dart';

class ExportOptionsScreen extends StatelessWidget {
  const ExportOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: [
            Container(
              color: const Color.fromARGB(255, 201, 201, 201),
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 15,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.grey,
                        elevation: 10,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(24),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(Icons.share),
                          Text('Exportar', style: TextStyle(fontSize: 8)),
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.grey,
                        elevation: 10,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(24),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(Icons.delete_forever),
                          Text('Deletar tudo', style: TextStyle(fontSize: 8)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.grey,
                        elevation: 10,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(24),
                      ),
                      onPressed: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(Icons.add_chart),
                          Text('Estatisticas', style: TextStyle(fontSize: 8)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
