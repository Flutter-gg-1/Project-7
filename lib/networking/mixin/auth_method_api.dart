import 'package:dio/dio.dart';
import 'package:tuwaiq_project/networking/networking_constant.dart';

mixin AuthMethodApi on NetworkingConstant {
  // checked
  createUserPost(
      {required String email,
      required String fName,
      required String lName}) async {



        
    try{

       final res = await dio.post("$baseUrl$endCreateUser",
        data: {"email": email, "f_name": fName, "l_name": lName});

    print(res.data);

    }  on DioException  catch(err){

      print(err.response?.data["data"]);

    }

    
    
    
    catch(err){

      // print(err);

    }
   
  }




  loginPost({required String email}) async {




    try{
       final res = await dio.post("$baseUrl$endCreateUser",
        data: {"email": email});

    print(res.data);

    }catch(err){

    }


   

  }




  verifyPost({required String email, required String otp}) async{


    try{

      final res = await dio.post("$baseUrl$endCreateUser",
        data: {
          
          "email": email  ,

          "otp" :otp
        
        
        }  );

    print(res.data);

    }catch(err){

    }


    

  }
}
