import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _ControllerAlcool = TextEditingController();
  TextEditingController _ControllerGasolina = TextEditingController();
  String _resultado = "";

  void _calcular()
  {
    double? precoAlcool = double.tryParse(_ControllerAlcool.text);
    double? precoGas = double.tryParse(_ControllerGasolina.text);

    if ( precoAlcool != null && precoGas != null)
    {
        if ( precoAlcool / precoGas >= 0.7 )
        {
            setState(()
            {
              _resultado = "Melhor usar gasolina";
            });
        }
        else
        {
          setState(()
          {
            _resultado = "Melhor usar gasolina";
          });
        }
    }
    else
    {
      setState(()
      {
        _resultado = "Número inválido, digete números positivos e utilizando ponto.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 35,
              centerTitle: true,
              title: const Text("Álcool ou Casolina"),
              backgroundColor: Colors.black12,
          ),
          body: Container(
            //alignment: Alignment.center,
            color: Colors.white54,
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 30, top: 0, right: 30, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                //mainAxisAlignment: MainAxisAlignment.,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "🚗",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 250,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Descubra a melhor opção para abastecer o carro",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      _resultado,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                        color: Colors.orange
                      ),
                    ),
                  ),
                  TextField(
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Preço do álcool:",

                    ),
                    controller: _ControllerAlcool,
                  ),
                  TextField(
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Preço da gasolina:",
                    ),
                    controller: _ControllerGasolina,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: _calcular,
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.black)
                      ),
                      child: const Text(
                        "Calcular",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        )
    );
  }
}