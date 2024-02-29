import 'dart:convert';
import 'dart:io';

import 'package:get/get_connect/http/src/request/request.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:secure_app/models/api_response.dart';

class APIService {
  static Map<String, String> doHeaders() {
    return {
      'Content-Type': 'application/json',
      'x-custom-lang': 'fr',
    };
  }

  static Map<String, String> doAuthHeaders(String token) {
    return {
      'Content-Type': 'application/json',
      'x-custom-lang': 'fr',
      'Authorization': 'Bearer $token',
    };
  }

  Future<APIResponse> getDataOnPost(
      {Map<String, dynamic>? data,
      required String method,
      required String uri,
      bool isImage = false,
      required String token}) async {
    try {
      final request = http.Request(method, Uri.parse(uri));
      if (data != null) {
        request.body = json.encode(data);
      }
      request.headers.addAll(doAuthHeaders(token));

      final response = await request.send();
      // Convertir le flux en un flux diffusable
      final broadcastStream = response.stream.asBroadcastStream();

      // Maintenant, vous pouvez écouter le flux autant de fois que nécessaire
      final responseBody = await broadcastStream.bytesToString();
      final responseData =
          responseBody.isNotEmpty ? jsonDecode(responseBody) : "";
      print(response);
      print(responseBody);
      print(responseData);

      if (response.statusCode == 201 ||
          response.statusCode == 200 ||
          response.statusCode == 204) {
        if (responseBody.isNotEmpty && responseData["data"] != null) {
          print(responseData["data"].toString());
          return APIResponse(
              error: false,
              data: responseData["data"],
              token: responseData["token"] ?? "");
        } else {
          return APIResponse(error: false, data: responseData);
        }
      } else {
        return APIResponse(
          error: true,
          data: responseData,
          errorMessage: responseData["message"],
          statusCode: response.statusCode,
        );
      }
    } on SocketException catch (_) {
      print(_);
      return APIResponse(
        error: true,
        data: {'message': 'Connexion internet instable'},
        errorMessage: 'Connexion internet instable',
      );
    } catch (e) {
      print(e);
      return APIResponse(
        error: true,
        data: {'message': 'Une erreur s\'est produite, veuillez réessayer'},
        errorMessage: 'Une erreur s\'est produite',
      );
    }
  }

  Future<APIResponse> getDataOnGet({
    required String uri,
    required String token,
  }) async {
    try {
      final request = http.Request('GET', Uri.parse(uri));
      request.headers.addAll(doAuthHeaders(token));

      final response = await request.send();

      final responseBody = await response.stream.bytesToString();
      final responseData = jsonDecode(responseBody);

      if (response.statusCode == 201 || response.statusCode == 200) {
        if (responseData["data"] != null) {
          print(responseData["data"]);
          return APIResponse(
              error: false,
              data: responseData["data"],
              token: responseData["token"] ?? "");
        } else {
          return APIResponse(error: false, data: responseData);
        }
      } else {
        return APIResponse(
          error: true,
          data: responseData,
          errorMessage: response.reasonPhrase,
          statusCode: response.statusCode,
        );
      }
      // if (response.statusCode == 200) {
      //   if (responseData["data"] != null) {
      //     print(responseData["data"]);
      //     return APIResponse(error: false, data: responseData["data"]);
      //   } else {
      //     return APIResponse(error: false, data: responseData);
      //   }
      //   // return APIResponse(error: false, data: responseData["data"]);
      // } else {
      //   print(responseData);
      //   return APIResponse(
      //     error: true,
      //     data: responseData,
      //     errorMessage: response.reasonPhrase,
      //     statusCode: response.statusCode,
      //   );
      // }
    } on SocketException catch (_) {
      print(_);
      return APIResponse(
        error: true,
        data: {'message': 'Connexion internet instable'},
        errorMessage: 'Connexion internet instable',
      );
    } catch (e) {
      print(e);
      return APIResponse(
        error: true,
        data: {'message': 'Connexion internet instable'},
        errorMessage: 'Une erreur s\'est produite: $e',
      );
    }
  }

// var headers = {
//   'Content-Type': 'application/json',
//   'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NWJjYTVhYzc3ODY3NDhjNzI3YWI5ZSIsImlhdCI6MTcwMTk2ODcyOCwiZXhwIjoxNzA5NzQ0NzI4fQ.nb8W9Q0MnR_bIKO3B1KRU6BhwOpcJ06sVNzbeYkJ3Mo',
//   'Cookie': 'jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NWJjYTVhYzc3ODY3NDhjNzI3YWI5ZSIsImlhdCI6MTcwMTk2ODcyOCwiZXhwIjoxNzA5NzQ0NzI4fQ.nb8W9Q0MnR_bIKO3B1KRU6BhwOpcJ06sVNzbeYkJ3Mo'
// };
// var request = http.MultipartRequest('PATCH', Uri.parse('https://sekure.onrender.com/api/v1/users/uploadPicture'));
// request.files.add(await http.MultipartFile.fromPath('photo', '/C:/Users/ARKEV/Pictures/pro.jpg'));
// request.headers.addAll(headers);

// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }

  Future<APIResponse> postDataWithImage({
    required String method,
    required String uri,
    required String token,
    // required Map<String, String> data,
    required String imagePath,
    List<String> imagesPath = const [],
  }) async {
    try {
      final request = http.MultipartRequest(method, Uri.parse(uri));

      // Ajouter les données non-image à la requête
      // request.fields.addAll(data);
      final mimeType = lookupMimeType(imagePath, headerBytes: [0xFF, 0xD8]) ??
          'application/octet-stream';
      if (imagesPath.isNotEmpty) {
        for (var image in imagesPath) {
          request.files.add(await http.MultipartFile.fromPath('idImages', image,
              contentType: MediaType.parse(mimeType)));
        }
      } else {
        // Ajouter l'image à la requête sous forme de fichier
        request.files.add(await http.MultipartFile.fromPath('photo', imagePath,
            contentType: MediaType.parse(mimeType)));
      }

      // request.files.add(
      //   http.MultipartFile(
      //     'photo', // Nom du champ où l'image sera envoyée (dépend du backend)
      //     http.ByteStream.fromBytes(imagePath),
      //     imageBytes.length,
      //     // filename: 'image.jpg', // Nom du fichier (peut être différent)
      //     // contentType: MediaType('image', 'jpeg'), // Type de contenu de l'image
      //   ),
      // );

      // Ajouter les en-têtes d'authentification
      request.headers.addAll(doAuthHeaders(token));

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      final responseData = jsonDecode(response.body);
      print(responseData);

      if (response.statusCode == 201 || response.statusCode == 200) {
        if (responseData['data'] != null) {
          print(responseData['data'].toString());
          return APIResponse(
            error: false,
            data: responseData['data'],
            token: responseData['token'] ?? '',
          );
        } else {
          return APIResponse(error: false, data: responseData);
        }
      } else {
        return APIResponse(
          error: true,
          data: responseData,
          errorMessage: responseData['message'],
          statusCode: response.statusCode,
        );
      }
    } on SocketException catch (_) {
      print(_);
      return APIResponse(
        error: true,
        data: {'message': 'Connexion internet instable'},
        errorMessage: 'Connexion internet instable',
      );
    } catch (e) {
      print(e);
      return APIResponse(
        error: true,
        data: {'message': 'Une erreur s\'est produite, veuillez réessayer'},
        errorMessage: 'Une erreur s\'est produite',
      );
    }
  }

  Future<bool> checkIfImageExists(String imageUrl) async {
    try {
      final response = await http.head(Uri.parse(imageUrl));

      if (response.statusCode == 200) {
        // Statut 200 indique que l'image existe et est accessible
        return true;
      } else {
        // Statut différent de 200 indique que l'image est introuvable
        return false;
      }
    } catch (e) {
      // En cas d'erreur lors de la requête
      print('Erreur : $e');
      return false; // Considéré comme introuvable en cas d'erreur
    }
  }
}
