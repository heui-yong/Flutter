import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: const Text(
                      '부산역',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '부산광역시, 동구, 초량동',
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  )
                ],
            )
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColum(color, Icons.call, 'call'),
          _buildButtonColum(color, Icons.near_me, 'call'),
          _buildButtonColum(color, Icons.share, 'call'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        '부산역은 1905년 1월 1일 남대문~초량 구간의 경부선 개통이 시작된지 3년 후인 1908년에 초량~ 부산역 구간이 개통되면서 1908년 4월 1일 중앙동 임시 부산 역사를 마련하여 영업을 개시하였으며 중앙동 부산 역사는 1910년 10월에 준공되었다.'
            '당시 역사는 비잔틴풍이 가미된 르네상스 양식의 웅장한 건물로 약한 지반 때문에 땅속 깊이 말뚝을 박아 세워졌다.'
            '1953년 대화재로 역사가 전소되어 중앙동에 임시가설 역사를 지어 사용하다가 1969년 초량동에 새 역사를 세웠다. 현재의 역사는 경부고속철도 개통에 맞추어 2003년 9월 다시 증개축 된 것이다.'
            ' 그리고 2019년, 부산역 광장은 한반도를 넘어 세계로 나아가는 철도의 미래를 상징하는 부산 유라시아 플랫폼으로 새롭게 탄생하였다.'
      ),
    );

    return MaterialApp(
      title: 'Simple Map Info',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple Map Info'),
        ),
        body: ListView (
          children: [
            Image.asset(
              'image/busan.png',
              width: 600,
              height: 240,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
  
  Column _buildButtonColum(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color
            ),
          ),
        )
      ],
    );
  }
}

