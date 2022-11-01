import 'package:flutter/material.dart';

import '../cart/buy.dart';
import '../home.dart';
class Appbar extends StatefulWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const Appbar({ Key? key, this.scaffoldKey}) : super(key: key);

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
    backgroundColor: Colors.white,
    foregroundColor: Colors.white,
    centerTitle: true,
    leading: InkWell(
      child: Image.asset('assets/images/Menu.jpg'),
      onTap: () {
          widget.scaffoldKey?.currentState!.openDrawer();
      },
    ),
    title: InkWell(
      child: Image.asset('assets/images/logo2.jpg'),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      },
    ),
    actions: [
      InkWell(child: Image.asset('assets/images/Search.jpg'),
      onTap: (){
        showSearch(context: context, delegate: ItemsSearchExample());
      },),
      InkWell(
        child: Image.asset('assets/images/shopping bag.jpg'),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (Context) => Buy()));
        },
      ),
    ],
  );
}
}



class ItemsSearchExample extends SearchDelegate{
   
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [IconButton(onPressed: (){
    query = '';
    }, icon: Icon(Icons.close)),];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return
    
     IconButton(onPressed: (){
        Navigator.pop(context);
     }, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    
    // TODO: implement buildResults
    // return ListView(children: [
    //   for(String name in names)
    //   name.toLowerCase().startsWith(query.toUpperCase())?ListTile(title: Text(name),):SizedBox.shrink(),
    // ],);
     final namedata= names.where((element) {
      return element.toLowerCase().toString().contains(query.toLowerCase().toString());
    });
    return query.isEmpty?
    Center(child: Text("Loading...."),):
   
    ListView.builder(
      shrinkWrap: true,
      itemCount: namedata.length,
      itemBuilder:(context,position){
      return ListTile(
        title: Text(namedata.elementAt(position)),
        

      );


    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final namedata= names.where((element) {
      return element.toLowerCase().toString().contains(query.toLowerCase().toString());
    });
    return query.isEmpty?
    Center(child: Text('')):
    ListView.builder(
      //shrinkWrap: true,
      shrinkWrap: false,
      itemCount: namedata.length,
      itemBuilder:(context,Index){
      return ListTile(
        title: Text(namedata.elementAt(Index))

      );


    });
    // return ListView(children: [
    //   for(String name in names)
    //   name.toLowerCase().startsWith(query.toLowerCase())?Container(child: ListTile(title: Text(name),)):SizedBox.shrink(),
    // ],);
  }
}


final List<String> names = [
  'afsal',
  'Samfan',
  'ashique',
  'amitha',
  'gulab',
  'griezmann',
  'joao',
  'oblak',
  'sunny',
  'sunmi',
  'h20',
  'mouse',
  'johny',
  'keyboard',
  'iphone',
  'earphone',
  'notebook',
];


//STring methods