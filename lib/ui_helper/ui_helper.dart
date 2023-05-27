
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movi_app/model/movies.dart';
import 'package:movi_app/widgets/custom_imput_field.dart';
import 'package:movi_app/widgets/custom_text.dart';

import '../controller/movie_controller.dart';
import '../services/storage_services.dart';

Future<void> addMovies(BuildContext context) async{
  final MovieController movieController = Get.find();
  final nameController = TextEditingController();
  final movieIdController = TextEditingController();
  final directorController = TextEditingController();

  ///display a bottomsheet modal to add movie  fields
  await showModalBottomSheet(
      context: context,
      builder: (BuildContext ctx){
        return Obx(
              () => Padding(
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
                      CircularProgressIndicator(),
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

                  CustomInputfield(label: 'movie id', controller: movieIdController),

                CustomInputfield(label: 'movie name', controller: nameController),

                CustomInputfield(label: 'movie Director', controller: directorController),

                //this is used to add the movie to the firebase backend
                ElevatedButton(
                  child: const Text('Add a movie'),
                  onPressed: () async{
                    final String name = nameController.text;
                    final String  director = directorController.text;
                    if( name.isNotEmpty && director.isNotEmpty && movieIdController.text.isNotEmpty){
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
          ),),
        );
      }
  );
}

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
}

  void showSnackbar(String title, String message) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.black,
        colorText: Colors.white);
  }