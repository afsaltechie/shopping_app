import 'package:flutter/material.dart';

class Show extends StatefulWidget {
  const Show({Key? key}) : super(key: key);

  @override
  State<Show> createState() => _ShowState();
}

    class _ShowState extends State<Show> {
  DateTime _pickedDate = DateTime.now();
  TimeOfDay now = TimeOfDay(hour: 10, minute: 30);

  void _datepicker() async {
    final date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2050));
    if (date != null) {
      setState(() {
        _pickedDate = date;
      });
    }
  }

  @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: _buildAppbar(context),
         body: Container(
           child: Column(
             children: [
               Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_pickedDate.toString()),
                Text(now.toString()),

                Center(
                  child: MaterialButton(
                    onPressed: () {
                      _datepicker();
                    },
                    color: Colors.red,
                    child: Text('date'),
                  ),
                ),
// showDatePicker(
//   context: context,
//    initialDate: DateTime.now(),
//     firstDate: DateTime(2000),
//     lastDate: DateTime(2050)
//     );

                TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Hola'),
                              content: Text('How are ya'),
                              actions: [],
                            );
                          });
                    },
                    child: Text('submit')),

// showDialogx(context: context, builder: (BuildContext context){

//   return AlertDialog(
//     title: Text('Hello'),
//     content: Text('hai'),
//     actions: [
//       TextButton(onPressed: (){}, child: Text('submit')
//     ],
//   );
// }

//),

TextButton(
  
  onPressed: () async{

TimeOfDay? newTime = await  showTimePicker(context: context, initialTime: now);
if (now!= null) {
setState(() {
  //now = New;
  now = TimeOfDay(hour: newTime!.hour, minute: newTime!.minute);
});

}

}, child: Text('tIME'),

)

//showSearch(context: context, delegate: delegate)
              ],
            ),


           buildItem('asamfan',12,15,Colors.red),
                      buildItem('asamfan',12,15,Colors.blue),
                                 buildItem('asamfan',12,15,Colors.green),
                                            buildItem('asamfan',12,15,Colors.orange),

          ],
        ),
      ),
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(actions: [
      IconButton(
          onPressed: () {
            showSearch(context: context, delegate: Samplesearch());
          },
          icon: Icon(Icons.search))

    ]);
    
  }


  final double kBorderRadius = 16;

  Widget buildItem(String name, double padding,double borderRadius,Color color){
    return  Container(
      margin: EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                color: color,
              ),
              padding: EdgeInsets.all(padding),
              child: Text(name),
            );
  }
}

class Samplesearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(onPressed: () {}, icon: Icon(Icons.close)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return ListView(
      children: [
        for (String name in items)
          name.startsWith(query.toLowerCase())
              ? ListTile(
                  title: Text(name),
                )
              : SizedBox.shrink(),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return SizedBox.shrink();
  }

  final List<String> items = [
    'simban',
    'simfran',
    'simbu',
    'samfan',
    'shambu',
  ];
}
