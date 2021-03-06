import 'package:denario/Models/Expenses.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ExpenseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final expenses = Provider.of<List<Expenses>>(context);

    if (expenses == null) {
      return Center();
    }
    if (expenses.length == 0) {
      return Container(
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Icon
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage('images/EmptyState.png'),
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(height: 15),
              //Text
              Text(
                'Nada para mostrar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
      );
    }

    List<Expenses> expenseList = expenses.reversed.toList();

    return Container(
      width: double.infinity,
      child: ListView.builder(
          itemCount: (expenseList.length > 7) ? 7 : expenseList.length,
          shrinkWrap: true,
          reverse: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, i) {
            return Container(
              height: 60,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //Fecha
                  Container(
                      //width: 50,
                      child: Text(
                    DateFormat.MMMd().format(expenseList[i].date).toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                  SizedBox(width: 10),
                  //Detail
                  Container(
                    //width: 250,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Desc
                          Container(
                              child: Text(
                            '${expenseList[i].product}',
                            style: TextStyle(fontWeight: FontWeight.w400),
                          )),
                          SizedBox(height: 5),
                          //Vendor + Cat
                          Container(
                              child: Text(
                            '${expenseList[i].vendor} • ${expenseList[i].category}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                            ),
                          )),
                        ]),
                  ),
                  SizedBox(width: 10),
                  //Cost Type
                  Container(
                      //width: 150,
                      child: Center(
                    child: Text(
                      '${expenseList[i].costType}',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  )),
                  SizedBox(width: 10),
                  //Total
                  Container(
                      //width: 75,
                      child: Center(
                    child: Text('\$${expenseList[i].total}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  )),
                ],
              ),
            );
          }),
    );
  }
}
