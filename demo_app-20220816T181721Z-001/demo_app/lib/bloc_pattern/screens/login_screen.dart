
import 'package:flutter/material.dart';
import 'package:demo_app/bloc_pattern/blocs/bloc.dart';
import 'package:demo_app/bloc_pattern/blocs/providers.dart';
import 'package:validators/sanitizers.dart';

///one of the difference between bloc is statelessWidget is used instead of stateful
class LoginScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    // var arr = [12, 11, 13, 5, 6, 7 ];
    // print('given array $arr');
    //
    // sort(arr, 0, arr.length-1);
    // print('sorted array $arr');

    ///to access scoped bloc provider we use of
    final bloc = Provider.of(context);
    return Container(
      margin: EdgeInsets.all(
          16.0
      ),
      child: Column(
        children: [
          emailField(bloc),
          Container(
            margin: EdgeInsets.only(bottom: 16),
          ),
          passwordField(bloc),
          Container(
            margin: EdgeInsets.only(bottom: 16),
          ),
          loginButton(bloc)
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
        builder: (context,AsyncSnapshot<String> snapshot){
      return TextField(
        keyboardType: TextInputType.emailAddress,
        onChanged:  bloc.addEmail,
        decoration: InputDecoration(
          hintText: 'email',
          labelText: 'User Email',
          errorText: snapshot.hasError ? snapshot.error.toString() : null,
          labelStyle: TextStyle(
              fontSize: 16,
              height: .9//distance between label and TextField
          ),

        ),

      );
    });

  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, AsyncSnapshot<String>snapshot){
          return TextField(
            onChanged: bloc.addPassword,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'password',
              labelText: 'User Password',
              errorText: snapshot.hasError ? snapshot.error.toString() : null,
              labelStyle: TextStyle(
                  fontSize: 16,
                  height: .75
              ),

            ),

          );
        }
    );
  }

  Widget loginButton(Bloc bloc) {
    return ElevatedButton(onPressed: (){

    },
        child: Text(
            'Login'
        )
    );
  }

  sort(List<int> arr, int first, int last){

    if (first < last) {
      // Find the middle point
      var mid = (first+ (last-first)~/2);

      print(mid);
      // Sort first and second halves
      sort(arr, first, mid);
      sort(arr, mid + 1, last);

      // Merge the sorted halves
      merge(arr, first, mid, last);
    }
  }


  void merge(List<int> arr, int first, int mid, int last) {
    num n1 = mid - first + 1;
    int n2 = last - mid;

    /* Create temp arrays */
    var L = [n1];
    var R = [n2];


    /*Copy data to temp arrays*/
    for (int i = 0; i < n1; ++i)
      L[i] = arr[first + i];
    for (int j = 0; j < n2; ++j)
      R[j] = arr[mid + 1 + j];

    /* Merge the temp arrays */

    // Initial indexes of first and second subarrays
    int i = 0, j = 0;

    // Initial index of merged subarray array
    int k = first;
    while (i < n1 && j < n2) {
      if (L[i] <= R[j]) {
        arr[k] = L[i] as int;
        i++;
      }
      else {
        arr[k] = R[j];
        j++;
      }
      k++;
    }

    /* Copy remaining elements of L[] if any */
    while (i < n1) {
      arr[k] = L[i] as int;
      i++;
      k++;
    }

    /* Copy remaining elements of R[] if any */
    while (j < n2) {
      arr[k] = R[j];
      j++;
      k++;
    }

  }

}