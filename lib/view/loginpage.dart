import 'package:cursoflutter/utils/firebaseController.dart' as firebaseAuth;
import 'package:cursoflutter/utils/resize.dart';

//  import 'package:cursoflutter/utils/styles.dart';
import 'package:cursoflutter/view/widgets/app_button.dart';
import 'package:cursoflutter/view/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool logButton = false;
  bool eyePass = false;
  TextEditingController _textEdControlEmail = new TextEditingController();
  TextEditingController _textEdControlPsw = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      //  SingleChildScrollView() //  Opción para que no se arme problema de traslapo cuando sale el teclado.
      //  Convierte lo encapsulado en un scroll, no recomendado. Se wrappea el body en este Widget
      body: Container(
        child: Stack(
          children: [
            //  Container para imagen de fondo
            Container(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/img/backbit.jpeg'),
                ),
              ),
            ),

            //  Container para la capa con opacidad
            Container(
              height: _height,
              width: _width,
              color: Colors.white.withAlpha(90),
            ),

            //  Container para el cuerpo del formulario
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: resV(medV: _height, size: 30),
                    left: resH(medH: _width, size: 15),
                    right: resH(medH: _width, size: 15),
                  ),
                  height: _height * 0.625,
                  width: _width,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 20,
                        //  offset: Offset(0, 5), Para asignar el sentido de la sombre
                      ),

                      /*
                      Para aplicar más de una sombra al mismo objeto
                      BoxShadow(
                        color: Colors.red,
                        blurRadius: 15,
                        offset: Offset(-15, 5), // Para asignar el sentido de la sombre
                      ),
                      */
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(90),
                      bottomRight: Radius.circular(90),
                    ),
                  ),
                  child: Column(
                    //  Para alineación a izquierda
                    crossAxisAlignment: CrossAxisAlignment.start,

                    //  Arreglo de hijos dependientes del child Column
                    children: [
                      //  Widget texto
                      Text(
                        "Wellcome to",
                        style: GoogleFonts.signika(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: resH(medH: _width, size: 15),
                        ),
                      ),

                      //  Widget imagen
                      Image.asset(
                        'assets/img/logobit.png',
                        width: resH(medH: _width, size: 157),
                        height: resV(medV: _height, size: 55),
                        fit: BoxFit.contain,
                      ),

                      //  Widget texto
                      Text(
                        'Please login to continue',
                        style: GoogleFonts.signika(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: resH(medH: _width, size: 15),
                        ),
                      ),

                      SizedBox(
                        height: 15,
                      ),

                      /*
                      27FEB2021.
                      Widget para anclar el campo de texto desde un módelo definido.
                      En el ejercio está ubicado en view/widgets/app_texfield.dart
                      No se comenta la importación de la librería porque se deja un campo con modelo y otro sin modelo.
                      Se hace para facilitar el seguimiento al curso con tutor original.
                      Align(
                        alignment: Alignment.center,
                        child: BitTextField(
                          hintText: 'Username',
                          icon: Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      */

                      Align(
                        alignment: Alignment.center,
                        child: TextField(
                          controller: _textEdControlEmail,
                          obscureText: false,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: 'Usuario',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusColor: Colors.black,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 15,
                      ),

                      Align(
                        alignment: Alignment.center,
                        child: BitTextField(
                          controller: _textEdControlPsw,
                          hintText: 'Password',
                          icon: Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                          obscureText: true,
                        ),
                      ),

                      SizedBox(
                        height: 15,
                      ),

                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),

                      SizedBox(
                        height: 15,
                      ),

                      /*
                      27FEB2021.
                      Widget para anclar el botón desde un módelo definido.
                      En el ejercio está ubicado en view/widgets/app_button.dart
                      No se comenta la importación de la librería porque se deja un botón con modelo y otro sin modelo.
                      Se hace para facilitar el seguimiento al curso con tutor original.

                      Align(
                        alignment: Alignment.center,
                        child: BitButton(
                          texto: 'LOGIN',
                          onPressed: () {},
                          fontSize: 20,
                        ),
                      )
                      */
                      Align(
                        alignment: Alignment.center,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 20,
                              ),
                            ],
                          ),
                          child: FlatButton(
                            minWidth: 200,
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () {
                              setState(() {
                                logButton = !logButton;

                                if (_textEdControlEmail.text.isEmpty ||
                                    _textEdControlPsw.text.isEmpty) {
                                  print("VACIO");
                                } else {
                                  logButton = !logButton;
                                  firebaseAuth.signIn(
                                    email: _textEdControlEmail.text,
                                    password: _textEdControlPsw.text,
                                  );
                                  firebaseAuth.stateFirebase(context);
                                }
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //  Para abrir una separación
                SizedBox(
                  height: 50,
                ),

                /*
                Ejemplo para abrir un cuadro con sombras
                Container(
                  height: 60,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green,
                        blurRadius: 20,
                      )
                    ],
                  ),
                ),

                //  Para abrir una separación
                SizedBox(
                  height: 20,
                ),
                 */

                Text(
                  'OR',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(
                  height: 50,
                ),

                /*
                Otra opción de hacer un botón. Verificar otras propiedades del Widget RaisedButton
                SizedBox(
                  width: 200,
                  height: 45,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(
                      'SIGN UP 1',
                      textAlign: TextAlign.center,
                    ),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                */

                BitButton(
                  texto: 'SIGN UP',
                  onPressed: () {},
                  fontSize: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
