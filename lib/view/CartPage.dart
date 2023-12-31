/* import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerr_mvvm/view_model/ProductViewModel.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  var productViewModel;

  @override
  void initState() {
   
    super.initState();
    productViewModel = Provider.of<ProductViewModel>(context,listen:false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Consumer<ProductViewModel>(builder: (context,data1,child){
              return Row(
                children: <Widget>[

                  Expanded(child: Text("Mi Carrito (${data1.countCart.toString()})")),
                  Text("Total Precio: S/ "+data1.totalPrice.toStringAsFixed(2)),

                ],
              );
            })
          ),
          body: Consumer<ProductViewModel>(builder: (context,data,child){
            return ListView.builder(
                itemCount: productViewModel.cartLists.length,
                itemBuilder: (count,index){
                  return Container(
                    margin: EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[

                        Container(
                          height: 50,
                          width: 50,
                          margin: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                  image: NetworkImage(data.cartLists[index].image!),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),

                        Expanded(child: Text(data.cartLists[index].title!+"/n"+data.cartLists[index].price.toString())),

                        InkWell(
                          onTap: (){
                            productViewModel.removeCart(data.cartLists[index]);
                          },
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.close,color: Colors.red,),
                          ),
                        )

                      ],
                    ),
                  );
                }
            );
          }),
          bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              // Lógica para procesar el pago y mostrar el mensaje
             /*  _showPaymentMessage(); */
            },
            child: Text("Check Out"),
          ),
        ),







        )
    );
  }




  
}
 */


//import 'package:flutter/cupertino.dart';


/* import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerr_mvvm/view_model/ProductViewModel.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var productViewModel;

  @override
  void initState() {
    super.initState();
    productViewModel = Provider.of<ProductViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Consumer<ProductViewModel>(
            builder: (context, data1, child) {
              return Row(
                children: <Widget>[
                  Expanded(child: Text("Mi Carrito (${data1.countCart.toString()})")),
                  Text("Total Precio: S/ " + data1.totalPrice.toStringAsFixed(2)),
                ],
              );
            },
          ),
        ),
        body: Consumer<ProductViewModel>(
          builder: (context, data, child) {
            return ListView.builder(
              itemCount: productViewModel.cartLists.length,
              itemBuilder: (count, index) {
                return Container(
                  margin: EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: 50,
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: NetworkImage(data.cartLists[index].image!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(child: Text(data.cartLists[index].title! + "\n" + data.cartLists[index].price.toString())),
                      InkWell(
                        onTap: () {
                          productViewModel.removeCart(data.cartLists[index]);
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.close, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              // Lógica para procesar el pago y mostrar el mensaje
              _showPaymentMessage();
            },
            child: Text("Check Out"),
          ),
        ),
      ),
    );
  }

  void _showPaymentMessage() {
    // Aquí puedes implementar la lógica de procesamiento de pago
    // Puedes mostrar un diálogo o un snackbar con el mensaje de pago exitoso
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Pago Exitoso"),
          content: Text("Su pago fue realizado exitosamente."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
} */


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerr_mvvm/view_model/ProductViewModel.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var productViewModel;

  // Nueva variable para almacenar la opción de pago seleccionada
  String selectedPaymentOption = "Bancario";

  @override
  void initState() {
    super.initState();
    productViewModel = Provider.of<ProductViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Consumer<ProductViewModel>(
            builder: (context, data1, child) {
              return Row(
                children: <Widget>[
                  Expanded(child: Text("Mi Carrito (${data1.countCart.toString()})")),
                  Text("Total Precio: S/ " + data1.totalPrice.toStringAsFixed(2)),
                ],
              );
            },
          ),
        ),
        body: Consumer<ProductViewModel>(
          builder: (context, data, child) {
            return ListView.builder(
              itemCount: productViewModel.cartLists.length,
              itemBuilder: (count, index) {
                return Container(
                  margin: EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: 50,
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: NetworkImage(data.cartLists[index].image!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(child: Text(data.cartLists[index].title! + "\n" + data.cartLists[index].price.toString())),
                      InkWell(
                        onTap: () {
                          productViewModel.removeCart(data.cartLists[index]);
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.close, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Menú desplegable para seleccionar la opción de pago
              DropdownButton<String>(
                value: selectedPaymentOption,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedPaymentOption = newValue!;
                  });
                },
                items: <String>['Bancario', 'Crédito', 'PayPal', 'Otros']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  // Lógica para procesar el pago y mostrar el mensaje
                  _showPaymentMessage();
                },
                child: Text("Check Out"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPaymentMessage() {
    // Aquí puedes implementar la lógica de procesamiento de pago
    // Puedes mostrar un diálogo o un snackbar con el mensaje de pago exitoso
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Pago Exitoso"),
          content: Text("Su pago fue realizado exitosamente mediante $selectedPaymentOption."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}