import 'package:flutter/material.dart';
import 'package:stripe_front/services/payment_service.dart';
import 'package:progress_dialog/progress_dialog.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // ignore: slash_for_doc_comments
  /**Acción de de presionar cualquier item en la pantalla home, 
   * los parametros requeridos son el constructor del contexto 
   * y la variable indice para elegir una opción, 
   * el método será asincrono */
  onItemPress(BuildContext context, int index) async {
    switch (index) {
      case 0:
        payViaNewCard(context);
        break;
      case 1:
        Navigator.pushNamed(context, '/existing-cards');
        break;
      case 2:
        Navigator.pushNamed(context, '/paypal');
        break;
      case 3:
        Navigator.pushNamed(context, '/efective');
        break;
    }
  }

  // ignore: slash_for_doc_comments
  /**
   * Método para pagar con una nueva tarjeta: 
   * Se incorpora una muestra de dialogo para indicar
   * que esta cargando la pagina, en esta pantalla se 
   * despliega el Scaffold con contenido de la libreria
   * "Stripe service"
   */
  payViaNewCard(BuildContext context) async {
    ProgressDialog dialog = new ProgressDialog(context);
    dialog.style(message: 'Please wait...');
    await dialog.show();
    var response =
        await StripeService.payWithNewCard(amount: '15000', currency: 'USD');
    await dialog.hide();
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(response.message),
      duration:
          new Duration(milliseconds: response.success == true ? 1200 : 3000),
    ));
  }

  @override
  void initState() {
    super.initState();
    StripeService.init();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stripe App',
          style: TextStyle(
              color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.separated(
            itemBuilder: (context, index) {
              Icon icon;
              Text text;

              switch (index) {
                case 0:
                  icon = Icon(Icons.add_circle, color: theme.primaryColor);
                  text = Text('Pagar con nueva tarjeta');
                  break;
                case 1:
                  icon = Icon(Icons.credit_card, color: theme.primaryColor);
                  text = Text('Pagar con una tarjeta existente');
                  break;
                case 2:
                  icon = Icon(Icons.payments, color: theme.primaryColor);
                  text = Text('Paypal');
                  break;
                case 3:
                  icon = Icon(Icons.money, color: theme.primaryColor);
                  text = Text('Efectivo');
                  break;
              }

              return InkWell(
                onTap: () {
                  onItemPress(context, index);
                },
                child: ListTile(
                  title: text,
                  leading: icon,
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
                  color: theme.primaryColor,
                ),
            itemCount: 4),
      ),
    );
  }
}
