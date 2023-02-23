import 'package:flutter/material.dart' ;
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController nameController =  TextEditingController() ;
  TextEditingController emailController =  TextEditingController() ;
  TextEditingController passwordController =  TextEditingController() ;

  final _formkey = GlobalKey<FormState>() ;
  bool _isObscure = true  ;



  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose() ;
    passwordController.dispose() ;

    super.dispose() ;
  }

  @override
  Widget build(BuildContext context) {

    var height =MediaQuery.of(context).size.height ;
    var width =MediaQuery.of(context).size.width ;


    TextTheme textTheme =  Theme.of(context).textTheme ;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                  
              Lottie.asset('images/waveloop.json' ,  height: height*0.2 ,  width: double.infinity ,  fit: BoxFit.fill) ,
              SizedBox(height: height*0.01),
              Padding(
                  padding:EdgeInsets.only(left: 20) ,
                  child: Text('SignUp' ,
                               style:GoogleFonts.ubuntu(fontSize: height*0.035 , color: Theme.of(context).unselectedWidgetColor , fontWeight: FontWeight.bold) ,),
              ) ,
              SizedBox(height: height*0.01),
              Padding(
                padding:EdgeInsets.only(left: 20) ,
                child: Text('Create Account' ,
                  style:GoogleFonts.ubuntu(fontSize: height*0.035 , color: Theme.of(context).unselectedWidgetColor , fontWeight: FontWeight.bold) ,),
              ) ,
              SizedBox(height: height*0.03,),
              Padding(
                  padding: EdgeInsets.only(left: 20 , right: 20) ,
                  child: Form(
                        key: _formkey,
                        child: Column(
                            children: [
                                TextFormField(
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.person) ,
                                      hintText: 'Username' ,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(20)) ,
                                      ),
                                    ),
                                    controller: nameController,
                                    validator: (value){
                                      if(value==null || value.isEmpty)
                                      {
                                          return 'Please Enter UserName ' ;
                                      }
                                      else if(value.length<4)
                                      {
                                          return 'at least Enter 4 characters ' ;
                                      }
                                      else if(value.length>13)
                                      {
                                        return 'maximum character is 13' ;
                                      }

                                      return null ;
                                    },
                                ),
                                SizedBox(height: height*0.02,) ,
                                TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.email_rounded) ,
                                    hintText: 'Email' ,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20)) ,
                                    ),
                                  ),
                                  controller: emailController,
                                  validator: (value){
                                    if(value==null || value.isEmpty)
                                    {
                                      return 'Please Enter Email ' ;
                                    }
                                    else if(!value.endsWith('@gmail.com'))
                                    {
                                      return 'Please Enter valid Email ' ;
                                    }

                                    return null ;
                                  },
                                ),
                                SizedBox(height: height*0.02,) ,
                                Consumer(
                                  builder: (BuildContext context, value, Widget? child) {
                                    return TextFormField(
                                      controller: passwordController,
                                      obscureText: _isObscure,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.lock_open) ,
                                        suffixIcon: IconButton(
                                          icon: Icon( _isObscure ? Icons.visibility : Icons.visibility_off),
                                          onPressed: (){
                                            setState(() {
                                              _isObscure = !_isObscure;
                                            });
                                          },
                                        ),
                                        hintText: 'Password' ,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(20)) ,
                                        ),
                                      ),
                                      validator: (value){
                                        if(value==null || value.isEmpty)
                                        {
                                          return 'Please Enter Password ' ;
                                        }
                                        else if(value.length<7)
                                        {
                                          return 'at least Enter 6 characters ' ;
                                        }
                                        else if(value.length>13)
                                        {
                                          return 'maximum character is 13' ;
                                        }

                                        return null ;
                                      },
                                    );
                                  },

                                ),
                                SizedBox(height: height * 0.01,),
                                Text('Creating an account means you\'re okay with our Terms of Services and our Privacy Policy',style: GoogleFonts.ubuntu(fontSize: 15,color: Colors.grey,height: 1.5),textAlign: TextAlign.center,),
                                SizedBox(height: height * 0.02,),
                                signupBtn()


                            ],
                        ),
                  ),
              ) ,
          ],
        ),
    );


  }

  Widget signupBtn()
  {
    return SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                )
            ),
            onPressed: () {
              if (_formkey.currentState!.validate()) {}

            } ,
            child: Text('SignUp'),
        ),
    ) ;
  }
}
