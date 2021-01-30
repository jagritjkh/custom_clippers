# custom_clippers

custom_clippers is a package that contains multiple custom clippers and different types of message clippers which you can give to clipper property of ClipPath.


## Getting Started

To use this package, add `custom_clippers` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).


## Add dependency
```
dependencies:
  custom_clippers: ^0.0.1
```

## Import
```
import 'package:custom_clippers/custom_clippers.dart';
```

## Usage
```
ClipPath(
    clipper: MultiplePointsClipper(Sides.BOTTOM, heightOfPoint: 50),
    child: Container(
             height: 160,
             padding: EdgeInsets.all(20),
             color: Colors.red,
             alignment: Alignment.center,
             child: Text(
               'Multiple Points Clipper Bottom Only',
               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
             ),
       ),
),
```

## Output
![custom_clipper](https://user-images.githubusercontent.com/32562337/106357504-781fe880-632c-11eb-924a-9e39b3e9b943.jpg)

## Supported Clippers
![custom_clipper1](https://user-images.githubusercontent.com/32562337/106357508-7bb36f80-632c-11eb-984b-e5f06e95458a.jpg)
![custom_clipper2](https://user-images.githubusercontent.com/32562337/106357509-7c4c0600-632c-11eb-853b-4300676a45bc.jpg)
![custom_clipper3](https://user-images.githubusercontent.com/32562337/106357510-7d7d3300-632c-11eb-8460-41fff634e4d1.jpg)
![custom_clipper4](https://user-images.githubusercontent.com/32562337/106357511-7d7d3300-632c-11eb-9268-c544d3c804ad.jpg)