import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:quotes/quoteapi.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  bool _isLoading=true;
    void initState (){
    super.initState();
    _getData();
  }
  QuoteModelApi? dataFromApi;
  _getData()async{
    try{
      String url="https://dummyjson.com/quotes";
      http.Response res=await http.get(Uri.parse(url));
      if(res.statusCode==200){
        dataFromApi=QuoteModelApi.fromJson(json.decode(res.body));
        _isLoading=false;
        setState(() {
          
        });
      }
    }catch(e){
      debugPrint(e.toString());
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:_isLoading? Padding(padding: EdgeInsets.all(5),
      child: Center(child: CircularProgressIndicator(),),
      ) 
    : dataFromApi==null?
    Center(child: Text("failed to load data"),)
      
      : Column(
        children: [
          ElevatedButton(onPressed: (){}, child: Text("Quote of the DAY")),
          Expanded(
            child: ListView.builder(itemBuilder: (context,index){
              final quote=dataFromApi!.quotes[index];
              return ListTile(
                title: Text("Author:${quote.author}"),
              );
            }),
          )
        ],
      ),
    );
  }
}