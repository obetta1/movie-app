
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movi_app/model/movies.dart';
import 'package:movi_app/utils/validation.dart';
import 'package:movi_app/widgets/custom_imput_field.dart';
import 'package:movi_app/widgets/custom_text.dart';

import '../controller/auth_controller.dart';
import '../controller/movie_controller.dart';
import '../services/storage_services.dart';

Future<void> addMovies(BuildContext context) async{
  final MovieController movieController = Get.find();
  final nameController = TextEditingController();
  final movieIdController = TextEditingController();
  final directorController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  ///display a bottomsheet modal to add movie  fields
  await showModalBottomSheet(
      context: context,
      builder: (BuildContext ctx){
        return Obx(
              () => ListView(
                children: [Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
            children: [
                  ///this box is used to disp[lay options the for a user to upload a movie poster
                  SizedBox(
                    child: InkWell(
                      onTap: (){
                       _pickImage(context); ///function for picking image from the gallary
                       movieController.newMovie['imageUrl'] == null ? movieController.isLoading.value = true : false;
                        },
                      child: movieController.isLoading.value ? Column(children:  [
                        const CircularProgressIndicator(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText.greyText('image Loading...'),
                        )
                      ],): SizedBox(
                        height: 200,
                        child:  movieController.newMovie['imageUrl'] != null ?
                            Image.network(movieController.newMovie['imageUrl'],fit: BoxFit.cover, ):
                        Column(
                          children: [
                            const Icon(Icons.image_outlined, size: 140,),

                            CustomText.blackBodyText('upload movie poster')
                          ],
                        ),
                      ),
                    ),
                  ),

                Form(
                  key: formKey,
                    child: Column(
                  children: [
                    CustomInputfield( label: 'movie id',
                      controller: movieIdController,
                      validator: (value) { return Validate.validateField(value);}, ),

                    CustomInputfield(
                      label: 'movie name',
                      controller: nameController,
                      validator: (value) {return Validate.validateField(value); },),
                    CustomInputfield(label: 'movie Director',
                      controller: directorController,
                      validator: (value) {return Validate.validateField(value); },),

                    //this is used to add the movie to the firebase backend
                    ElevatedButton(
                      child: const Text('Add a movie'),
                      onPressed: () async{
                        final String name = nameController.text;
                        final String  director = directorController.text;
                        if( formKey.currentState!.validate()){
                          ///this add a new movie to the firebase database
                          movieController.addMovie(
                              Movies(
                                  id: movieIdController.text,
                                  name: name,
                                  director: director,
                                  imageUrl: movieController.newMovie['imageUrl']));
                          nameController.clear();
                          directorController.clear();
                          Navigator.of(context).pop();
                        }
                      },
                    )
                  ],
                ))
            ],
          ),
        ),]
              ),
        );
      }
  );
}
///this is used to select image from the gallery
Future<String?> _pickImage(BuildContext context) async {
  final MovieController movieController = Get.find();
  final StorageServoices storage = StorageServoices();
  ImagePicker imagePicker = ImagePicker();
  try {
    final XFile? image =
    await imagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      showSnackbar('Image picker', 'no image uploaded');
    }

    if (image != null) {
      await storage.uploadImage(image); ///uploads the image into cloud storage.Url
      var imageUrl = await storage.getDownloadImage(image.name); ///get the image url from the storage
      movieController.newMovie.update('imageUrl', (_) => imageUrl, ifAbsent: () => imageUrl);
      movieController.isLoading.value = false;
      return imageUrl;
    }
  } catch (e) {
    showSnackbar('Image picker', 'invalid image format.  ');
    movieController.isLoading.value = false;
  }
  return null;
}

///this is used to logout user from the app
void showLogoutDialog(BuildContext context){
  AuthController authController = AuthController();
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'You are About to Logout',
            style: TextStyle(
                color: Colors.redAccent, fontWeight: FontWeight.bold),
          ),
          content: const Text('are you sure you Logout '),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
                onPressed: () {
                  authController.logoutUser();
                  Navigator.pop(
                    context,
                    'OK',
                  );
                },
                child: const Text('OK',
                    style: TextStyle(
                      color: Colors.redAccent,
                    ))),
          ],
        );
      });
}
///this used to show a snack bar
  void showSnackbar(String title, String message) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.redAccent,
        colorText: Colors.white);
  }