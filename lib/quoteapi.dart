// To parse this JSON data, do
//
//     final quoteModelApi = quoteModelApiFromJson(jsonString);

import 'dart:convert';

QuoteModelApi quoteModelApiFromJson(String str) => QuoteModelApi.fromJson(json.decode(str));


class QuoteModelApi {
    List<Quote> quotes;

    QuoteModelApi({
        required this.quotes,
    });

    factory QuoteModelApi.fromJson(Map<String, dynamic> json) => QuoteModelApi(
        quotes: List<Quote>.from(json["quotes"].map((x) => Quote.fromJson(x))),
    );

   
}

class Quote {
   
    String quote;
    String author;

    Quote({
       
        required this.quote,
        required this.author,
    });

    factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        
        quote: json["quote"],
        author: json["author"],
    );

    Map<String, dynamic> toJson() => {
        
        "quote": quote,
        "author": author,
    };
}
