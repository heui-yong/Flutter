import 'package:flutter/material.dart';

void main() {
  runApp(
    const AppStateWidget(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'checkBox',
        home: MainPage(),
      ),
    ),
  );
}

class AppState {
  AppState({
    this.checkList = const <String>{},
  });

  final Set<String> checkList;

  AppState copyWith({Set<String>? checkList}) {
    return AppState(checkList: checkList ?? this.checkList);
  }
}

class AppStateScope extends InheritedWidget {
  const AppStateScope(this.data, {super.key, required super.child});

  final AppState data;
  
  static AppState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppStateScope>()!.data;
  }

  @override
  bool updateShouldNotify(AppStateScope oldWidget) {
    return data != oldWidget.data;
  }
}

class AppStateWidget extends StatefulWidget {
  const AppStateWidget({super.key, required this.child});

  final Widget child;

  static AppStateWidgetState of(BuildContext context) {
    return context.findAncestorStateOfType<AppStateWidgetState>()!;
  }

  @override
  State<AppStateWidget> createState() => AppStateWidgetState();
}

class AppStateWidgetState extends State<AppStateWidget> {
  AppState _data = AppState();

  void addToList(String id) {
    if (!_data.checkList.contains(id)) {
      final Set<String> newCheckBoxList = Set<String>.from(_data.checkList);
      newCheckBoxList.add(id);
      setState(() {
        _data = _data.copyWith(checkList: newCheckBoxList);
      });
    }
  }

  void removeToList(String id) {
    if (_data.checkList.contains(id)) {
      final Set<String> newCheckBoxList = Set<String>.from(_data.checkList);
      newCheckBoxList.remove(id);
      setState(() {
        _data = _data.copyWith(checkList: newCheckBoxList);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppStateScope(
      _data,
      child: widget.child,
    );
  }
}


class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 100,),
            CheckBoxBgWidget(),
            SizedBox(height: 50,),
            TotalCountWidget()
          ],
        ),
      )
    );
  }
}

class CheckBoxBgWidget extends StatefulWidget {
  const CheckBoxBgWidget({
    super.key,
  });

  @override
  State<CheckBoxBgWidget> createState() => _CheckBoxBgWidgetState();
}

class _CheckBoxBgWidgetState extends State<CheckBoxBgWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Container(
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.cyanAccent)
          ),
          child: GridView.count(
            crossAxisCount: 3,
            children: List.generate(30, (index) {
              return  CheckBoxWidget(index: index.toString(),);
            })
          ),
        ),
      ),
    );
  }
}

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({
    super.key, required this.index,
  });

  final String index;

  @override
  Widget build(BuildContext context) {
    void addList(String index) {
      AppStateWidget.of(context).addToList(index);
    }

    void removeList(String index) {
      AppStateWidget.of(context).removeToList(index);
    }
    return Center(
      child: Row(
        children: [
          Checkbox(
              value: AppStateScope.of(context).checkList.contains(index),
              onChanged: (value) => value! ? addList(index) : removeList(index)
          ),
          Text("item $index")
        ],
      ),
    );
  }
}

class TotalCountWidget extends StatelessWidget {
  const TotalCountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(50),
        child: Container(
          alignment: Alignment.center,
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.blue)
          ),
          child: Text("total item count : ${AppStateScope.of(context).checkList.length}"),
        )
    );
  }
}