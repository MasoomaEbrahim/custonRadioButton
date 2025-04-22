import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 147, 173, 218), // Set AppBar color
          titleTextStyle: const TextStyle(
            color: Colors.white, // Title text color
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
        ),
        ),
      home: homePage(),
        
    );
  }
}

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Simple Radio Buttons'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Radio(value: 1, groupValue: _value, onChanged: (value){
                  setState(() {
                    _value = value!;
                  });
                },
                ),
                SizedBox(width: 10.0,),
                Text("Radio 1"),//text widget for the radio button 
              ],
            ),
             Row(
              children: [
                Radio(value: 2, groupValue: _value, onChanged: (value){
                  setState(() {
                    _value = value!;
                  });
                },
                ),
                SizedBox(width: 10.0,),
                Text("Radio 2"),//text widget for the radio button 
              ],
            ),
             Row(
              children: [
                Radio(value: 3, groupValue: _value, onChanged: (value){
                  setState(() {
                    _value = value!; // whaen using! => you're asserting that 'value' is not null.
                  });
                },
                ),
                SizedBox(width: 10.0,),
                Text("Radio 3"),//text widget for the radio button 
              ],
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => pageTwo()),
                );
              }, 
              child: Text('Go To Custom Radio Buttons Page'),),
          ],
        ),

        
        );
  }
}
class pageTwo extends StatefulWidget {
  const pageTwo({super.key});

  @override
  State<pageTwo> createState() => _pageTwoState();
}

class _pageTwoState extends State<pageTwo> {
  int selected = 0;
  Widget customRadio(String text, int index){
    return OutlinedButton(
      onPressed: (){
        setState(() {
          selected = index;
        });
      },
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(20), // padding around the text
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        side: BorderSide(
          color: (selected == index) ? Colors.greenAccent : Colors.blueGrey,
          
        ),
      ), // onPressed 
      child: Text(
        text, 
        style: TextStyle(
          color: (selected == index)? Colors.greenAccent : Colors.blueGrey,
       ),
      ),
        );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Radio Button'),
      ),
      body: Center(child: Column( 
        mainAxisAlignment: MainAxisAlignment.center,
        
        children:[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: customRadio("Radio Button 1", 1),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: customRadio("Radio Button 2", 2),
          ),
          Padding( // padding between the buttons
            padding: const EdgeInsets.all(8.0),
            child: customRadio("Radio Button 3", 3),
          ),
      ],),),
    );
  }
}
