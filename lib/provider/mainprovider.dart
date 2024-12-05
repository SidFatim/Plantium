import 'dart:collection';

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plantium/constant/mycolos.dart';
import 'package:plantium/modelclass/mymodels.dart';
import 'package:plantium/provider/loginprovider.dart';
import 'package:provider/provider.dart';

import '../constant/myfunction.dart';

class MainProvider extends ChangeNotifier {
  Reference indoorimagestorage = FirebaseStorage.instance.ref("Indoor Images");
  FirebaseFirestore db = FirebaseFirestore.instance;
  DatabaseReference mRoot = FirebaseDatabase.instance.ref();

  File? IndoorImages;
  String indoorimages = "";

  List<IndoorModel> IndoorList = [];
  List<IndoorModel> filterIndoorList = [];

  TextEditingController indoornameController = TextEditingController();
  TextEditingController indoordescriptionController = TextEditingController();
  TextEditingController indoorpriceController = TextEditingController();




  Future<void> addIndoor(String Infrom, String InId) async {
    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    HashMap<String, Object> Map = HashMap();
    Map["NAME"] = indoornameController.text.toString();
    Map["DESCRIPTION"] = indoordescriptionController.text.toString();
    Map["ADDED_BY"] = '';
    Map["TIME"] = DateTime.now();
    Map["INDOOR_ID"] = id;
    Map["CATEGORY"] = "INDOOR_PLANTS";
    Map["PRICE"] = indoorpriceController.text.toString();
    if (IndoorImages != null) {
      String ctgryimgid = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();
      indoorimagestorage = FirebaseStorage.instance.ref().child(ctgryimgid);
      await indoorimagestorage.putFile(IndoorImages!).whenComplete(() async {
        await indoorimagestorage.getDownloadURL().then((value) {
          Map["Indoor Images"] = value;
          notifyListeners();
        });
        notifyListeners();
      });
    } else {
      Map["Indoor Images"] = indoorimages;
    }
    if (Infrom == "New") {
      db.collection("PLANTIUMINDOOR").doc(id).set(Map);
      db.collection("PLANTS").doc(id).set(Map);
    } else {
      db.collection("PLANTIUMINDOOR").doc(InId).update(Map);
      db.collection("PLANTS").doc(InId).update(Map);
    }
    notifyListeners();
    getIndoor();
  }

  Future getImagegalleryIn() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropImageIn(pickedImage.path,);
    }
  }

  Future getImagecameraIn() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      // print("dfghjk"+pickedImage.path);
      cropImageIn(pickedImage.path);
      // setImage(File(pickedImage.path));

    }
    // else {
    //   print('No image selected.');
    // }
  }

  Future<void> cropImageIn(String path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      IndoorImages = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }

  void getIndoor() {
    db.collection("PLANTIUMINDOOR").get().then((value1) {
      print(value1);
      if (value1.docs.isNotEmpty) {
        IndoorList.clear();
        for (var value in value1.docs) {
          print(value.get("NAME"));
          IndoorList.add(IndoorModel(
              value.id, value.get("NAME"), value.get("Indoor Images"),value.get("PRICE"),value.get("DESCRIPTION")));
          filterIndoorList = IndoorList;
          notifyListeners();
        }
        notifyListeners();
      }
      notifyListeners();
    });
  }

  void clearindoor() {
    IndoorImages = null;
    indoorimages = "";
    indoornameController.clear();
    indoordescriptionController.clear();
    indoorpriceController.clear();
  }

  void getEditindoor(inId) {
    db.collection("PLANTIUMINDOOR").doc(inId).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic> map = value.data() as Map;
        indoornameController.text = map["NAME"].toString();
        indoorpriceController.text = map["PRICE"].toString();
        indoordescriptionController.text = map["DESCRIPTION"].toString();
        indoorimages = map["Indoor Images"].toString();
        notifyListeners();
      }
    });
  }

  void getDeleteindoor(context, id) {
    db.collection("PLANTIUMINDOOR").doc(id).delete();
    db.collection("PLANTS").doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Delete"),
      backgroundColor: Colors.blue,));
    getIndoor();
    notifyListeners();
  }

  void searchIndoor(item) {
    IndoorList = filterIndoorList
        .where((a) => a.Inname.toLowerCase().contains(item.toLowerCase()))
        .toList();
    notifyListeners();
  }


  Reference outdoorimagestorage = FirebaseStorage.instance.ref("Outdoor Images");


  File? OutdoorImages;
  String outdoorimages = "";

  List<OutdoorModel> OutdoorList = [];
  List<OutdoorModel> filterOutdoorList = [];

  TextEditingController outdoornameController = TextEditingController();
  TextEditingController outdoordescriptionController = TextEditingController();
  TextEditingController outdoorpriceController = TextEditingController();


  Future<void> addOutdoor(
      String Outfrom, String OutId) async {
    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    HashMap<String, Object> Map = HashMap();
    Map["NAME"] = outdoornameController.text.toString();
    Map["DESCRIPTION"] = outdoordescriptionController.text.toString();
    Map["ADDED_BY"] = '';
    Map["TIME"] = DateTime.now();
    Map["OUTDOOR_ID"] = id;
    Map["CATEGORY"] = "OUTDOOR_PLANTS";
    Map["PRICE"] = outdoorpriceController.text.toString();
    if (OutdoorImages != null) {
      String ctgryimgid = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();
      outdoorimagestorage = FirebaseStorage.instance.ref().child(ctgryimgid);
      await outdoorimagestorage.putFile(OutdoorImages!).whenComplete(() async {
        await outdoorimagestorage.getDownloadURL().then((value) {
          Map["Outdoor Images"] = value;
          notifyListeners();
        });
        notifyListeners();
      });
    } else {
      Map["Outdoor Images"] = outdoorimages;
    }
    if (Outfrom == "New") {
      db.collection("PLANTIUMOUTDOOR").doc(id).set(Map);
      db.collection("PLANTS").doc(id).set(Map);
    } else {
      db.collection("PLANTIUMOUTDOOR").doc(OutId).update(Map);
      db.collection("PLANTS").doc(OutId).update(Map);
    }
    getOutdoor();
    notifyListeners();
  }

  Future getImagegalleryOut() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropImageOut(pickedImage.path,);
    }
  }

  Future getImagecameraOut() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      // print("dfghjk"+pickedImage.path);
      cropImageOut(pickedImage.path);
      // setImage(File(pickedImage.path));

    }
    // else {
    //   print('No image selected.');
    // }
  }

  Future<void> cropImageOut(String path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      OutdoorImages = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }

  void getOutdoor() {
    db.collection("PLANTIUMOUTDOOR").get().then((value1) {
      print(value1);
      if (value1.docs.isNotEmpty) {
        OutdoorList.clear();
        for (var value in value1.docs) {
          print(value.get("NAME"));
          OutdoorList.add(OutdoorModel(
              value.id, value.get("NAME"), value.get("Outdoor Images"),value.get("PRICE"),value.get("DESCRIPTION")));
          filterOutdoorList = OutdoorList;
          notifyListeners();
        }
        notifyListeners();
      }
      notifyListeners();
    });
  }

  void clearoutdoor() {
    OutdoorImages = null;
    outdoornameController.clear();
    outdoordescriptionController.clear();
    outdoorpriceController.clear();
    outdoorimages = "";
  }


  void getEditoudoor(outId) {
    db.collection("PLANTIUMOUTDOOR").doc(outId).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic> map = value.data() as Map;
        outdoornameController.text = map["NAME"].toString();
        outdoorpriceController.text = map["PRICE"].toString();
        outdoordescriptionController.text = map["DESCRIPTION"].toString();
        outdoorimages = map["Outdoor Images"].toString();
        notifyListeners();
      }
    });
  }

  void getDeleteoutdoor(context, id) {
    db.collection("PLANTIUMOUTDOOR").doc(id).delete();
    db.collection("PLANTS").doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Delete"),
      backgroundColor: Colors.blue,));
    getOutdoor();
  }


  void searchOutdoor(item) {
    OutdoorList = filterOutdoorList
        .where((a) => a.Ouname.toLowerCase().contains(item.toLowerCase()))
        .toList();
    notifyListeners();
  }


  Reference otherimagestorage = FirebaseStorage.instance.ref("Other Images");


  File? OtherImages;
  String otherimages = "";

  List<OtherModel> OtherList = [];
  List<OtherModel> filterOtherList = [];

  TextEditingController othernameController = TextEditingController();
  TextEditingController otherdescriptionController = TextEditingController();
  TextEditingController otherpriceController = TextEditingController();


  Future<void> addOther(String Othfrom, String OthId) async {
    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    HashMap<String, Object> Map = HashMap();
    Map["NAME"] = othernameController.text.toString();
    Map["DESCRIPTION"] = otherdescriptionController.text.toString();
    Map["ADDED_BY"] = '';
    Map["TIME"] = DateTime.now();
    Map["OTHER_ID"] = id;
    Map["CATEGORY"] = "OTHER_PLANTS";
    Map["PRICE"] = otherpriceController.text.toString();
    if (OtherImages != null) {
      String ctgryimgid = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();
      otherimagestorage = FirebaseStorage.instance.ref().child(ctgryimgid);
      await otherimagestorage.putFile(OtherImages!).whenComplete(() async {
        await otherimagestorage.getDownloadURL().then((value) {
          Map["Other Images"] = value;
          notifyListeners();
        });
        notifyListeners();
      });
    } else {
      Map["Other Images"] = otherimages;
    }
    if (Othfrom == "New") {
      db.collection("PLANTIUMOTHER").doc(id).set(Map);
      db.collection("PLANTS").doc(id).set(Map);
    } else {
      db.collection("PLANTIUMOTHER").doc(OthId).update(Map);
      db.collection("PLANTS").doc(OthId).update(Map);
    }
    getOther();
    notifyListeners();
  }

  Future getImagegalleryOth() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropImageOth(pickedImage.path,);
    }
  }

  Future getImagecameraOth() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      // print("dfghjk"+pickedImage.path);
      cropImageOth(pickedImage.path);
      // setImage(File(pickedImage.path));

    }
    // else {
    //   print('No image selected.');
    // }
  }

  Future<void> cropImageOth(String path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      OtherImages = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }

  void getOther() {
    db.collection("PLANTIUMOTHER").get().then((value1) {
      print(value1);
      if (value1.docs.isNotEmpty) {
        OtherList.clear();
        for (var value in value1.docs) {
          print(value.get("NAME"));
          OtherList.add(OtherModel(
              value.id, value.get("NAME"), value.get("Other Images"),value.get("PRICE"),value.get("DESCRIPTION")));
          filterOtherList = OtherList;
          notifyListeners();
        }
        notifyListeners();
      }
      notifyListeners();
    });
  }

  void clearother() {
    OtherImages = null;
    otherimages = "";
    othernameController.clear();
    otherdescriptionController.clear();
    otherpriceController.clear();
  }

  void getEditother(othId) {
    db.collection("PLANTIUMOTHER").doc(othId).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic> map = value.data() as Map;
        othernameController.text = map["NAME"].toString();
        otherpriceController.text = map["PRICE"].toString();
        otherdescriptionController.text = map["DESCRIPTION"].toString();
        otherimages = map["Other Images"].toString();
        notifyListeners();
      }
    });
  }

  void getDeleteother(context, id) {
    db.collection("PLANTIUMOTHER").doc(id).delete();
    db.collection("PLANTS").doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Delete"),
      backgroundColor: Colors.blue,));
    getOther();
  }

  void searchOthers(item) {
    OtherList = filterOtherList
        .where((a) => a.Otname.toLowerCase().contains(item.toLowerCase()))
        .toList();
    notifyListeners();
  }

  TextEditingController registernameController = TextEditingController();
  TextEditingController registerphoneController = TextEditingController();

  Future<void> AddCustomer(String userid,String from,) async {
    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    HashMap<String, Object> Map = HashMap();
    Map["NAME"] = registernameController.text.toString();
    Map["PHONE"] = registerphoneController.text.toString();
    Map["ADDED_BY"] = '';
    Map["TIME"] = DateTime.now();


    HashMap<String, Object> User = HashMap();
    User["NAME"] = registernameController.text.toString();
    User["PHONE"] = registerphoneController.text.toString();
    User["TYPE"] = 'USER';

    if(from=="NEW"){
      Map["CUSTOMER_ID"] = id;
      User["USER_ID"] = id;

    }
    if(from=="NEW"){
      db.collection("CUSTOMER").doc(id).set(Map);
      db.collection("USER").doc(id).set(User);

    }else{
      db.collection("CUSTOMER").doc(userid).update(Map);
      db.collection("USER").doc(userid).update(Map);

    }



    getUser(userid);

    notifyListeners();
  }


  List<UserModel> userlist = [];

  String name="";
  String id="";
  String phone="";

  void getUser(String userid) {
    print("userid = $userid");
    db.collection("CUSTOMER").where("CUSTOMER_ID",isEqualTo: userid).get().then((value1) {
      print(value1);
      if (value1.docs.isNotEmpty) {
        for (var value in value1.docs) {
          print(value.get("NAME"));
          print(value.get("PHONE"));
         Map<String,dynamic> map=value.data();
         id=value.id;
         name=map["NAME"].toString();
         phone=map["PHONE"].toString();

         registernameController.text=name;
         registerphoneController.text=phone;
          notifyListeners();
        }
        notifyListeners();
      }
      notifyListeners();
    });
  }


  void getEditUser(usId) {
    db.collection("USER").doc(usId).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic> map = value.data() as Map;
        registernameController.text = map["NAME"].toString();
        registerphoneController.text = map["PHONE"].toString();
        notifyListeners();
      }
    });
  }


  Reference plantsimagestorage = FirebaseStorage.instance.ref("Plants Images");


  List<PlantsModel> plantsList = [];
  List<PlantsModel> filterplantsList = [];


  void getPlants() {
    String images = '';
    db.collection("PLANTS").get().then((value1) {
      print(value1);
      if (value1.docs.isNotEmpty) {
        for (var value in value1.docs) {
          print(value.get("NAME"));
          if (value.get("CATEGORY") == "INDOOR_PLANTS") {
            images = value.get("Indoor Images");
          } else if (value.get("CATEGORY") == "OUTDOOR_PLANTS") {
            images = value.get("Outdoor Images");
          } else if (value.get("CATEGORY") == "OTHER_PLANTS") {
            images = value.get("Other Images");
          }
          plantsList.add(PlantsModel(
              value.id, images, value.get("NAME"), value.get("PRICE"),value.get("DESCRIPTION"),value.get("CATEGORY")));
          filterplantsList = plantsList;
          notifyListeners();
        }
        notifyListeners();
      }
      notifyListeners();
    });
  }

  void searchPlants(item) {
    plantsList = filterplantsList
        .where((a) => a.Plname.toLowerCase().contains(item.toLowerCase()))
        .toList();
    notifyListeners();
  }
  
  List<CartModel> cartList = [];


  Future<void> addToCart(BuildContext context, String itemId,
      String userId,String itemName,String itemPrice,String itemImage,) async {
    String CartItemid = DateTime
        .now()
        .microsecondsSinceEpoch
        .toString();
    HashMap<String, Object>addItemCart = HashMap();
    addItemCart["ITEM_NAME"] = itemName;
    addItemCart["PRICE"] = itemPrice;
    addItemCart["IMAGE"] = itemImage;
     addItemCart["ITEM_ID"] = itemId;
    addItemCart["ADDED_BY"] = "";
    addItemCart["USER_ID"] = userId;
    addItemCart["CART_ID"] = CartItemid;
    addItemCart["TIME"] = DateTime.now();


    db.collection("CARTITEMS")
        .where("USER_ID", isEqualTo: userId)
        .where("ITEM_ID", isEqualTo: itemId)
        .get().then((value) {
      if (value.docs.isEmpty) {
        db.collection("CARTITEMS").doc(CartItemid).set(addItemCart);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          content: Center(child: Text(
              'Added To Cart', style: TextStyle(
              color: whitegreen, fontFamily: 'jml', fontSize: 20
          ))),
          backgroundColor: lightgreen,));
        getItems();
        // getCartItems(userId);
        notifyListeners();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          content: Center(child: Text(
              'Already Added', style: TextStyle(
              color: whitegreen, fontFamily: 'jml', fontSize: 20
          ))),
          backgroundColor: lightgreen,));
      }
    });
  }
  void getItems( ) {
    print("sndjdjd");
    db.collection("CARTITEMS").get().then((value) {
      if (value.docs.isNotEmpty) {
        cartList.clear();
        for (var value in value.docs) {
          cartList.add(
              CartModel(value.id, value.get("ITEM_NAME").toString(),
                  value.get("PRICE").toString(),value.get("IMAGE").toString(),));
          notifyListeners();
        }
      }
      notifyListeners();
    });
  }

  void deletecartItem(BuildContext context,String userId,) {
    db.collection("CARTITEMS").doc(userId).delete();
    notifyListeners();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      content: Center(child: Text(
        'Deleted', style: TextStyle(color: whitegreen, fontFamily: 'jml', fontSize: 20
      ),
      ),
      ),
      backgroundColor: lightgreen,));
    getItems();
    notifyListeners();
    notifyListeners();
  }



  List<UserAdminModel>adminuserList=[];

  void getAdminUser() {
    db.collection("CUSTOMER").get().then((value1) {
      print(value1);
      if (value1.docs.isNotEmpty) {
        adminuserList.clear();
        for (var value in value1.docs) {
          adminuserList.add(UserAdminModel(
              value.get("CUSTOMER_ID"),value.get("NAME"),value.get("PHONE")));

          notifyListeners();
        }
        notifyListeners();
      }
      notifyListeners();
    });
  }


  TextEditingController ordernameController = TextEditingController();
  TextEditingController orderaddressController = TextEditingController();
  TextEditingController orderstateController = TextEditingController();
  TextEditingController orderquantityController = TextEditingController();



  Future<void> AddOrder(String name,String image,BuildContext context) async {
    LoginProvider logprovider=Provider.of(context,listen: false);

    print("userid = ${logprovider.loginUserid}");
    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    HashMap<String, Object> Map = HashMap();
    Map["NAME"] = ordernameController.text.toString();
    Map["ADDRESS"] = orderaddressController.text.toString();
    Map["ADDED_BY"] = '';
    Map["TIME"] = DateTime.now();
    Map["PLANT_NAME"] =  name;
    Map["IMAGE"] =image;
    Map["STATE"] = orderstateController.text.toString();
    Map["QUANTITY"] = orderquantityController.text.toString();
    Map["USER_ID"] = logprovider.loginUserid;
    // User["TYPE"] = 'USER';
    db.collection("ORDERS").doc(id).set(Map);
    getOrder();
    // getUserOrder(userid);

    notifyListeners();
  }

  List<OrderModel>orderList=[];


 void getOrder() {
    db.collection("ORDERS").get().then((value1) {
    print(value1);
    if (value1.docs.isNotEmpty) {
      orderList.clear();
      for (var elements in value1.docs) {
        Map<String, dynamic> OMap = elements.data();
        for (var value in value1.docs) {
          print(value.get("NAME").toString());
          orderList.add(OrderModel(
            OMap["ORDER_ID"].toString(),
            OMap["NAME"],
            OMap["STATE"],
            OMap["QUANTITY"],
            OMap["ADDRESS"],
            OMap["IMAGE"],
            OMap["PLANT_NAME"],
            OMap["USER_ID"].toString(),
            OMap["STATUS"].toString(),
          ));
          notifyListeners();
        }
        notifyListeners();
      }
    }
    notifyListeners();
  });

 }

  String ordervaluew='Order confirmed';
  void orderplaced(String? val) {
    ordervaluew = val!;
  }

  void updateorder(String orderid,BuildContext context){
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    Map<String, dynamic> map = HashMap();
    map["STATUS"]=ordervaluew;
    // map["STATUS_TIME"]=DateTime.now();
    db.collection("ORDERS").doc(orderid).update(map);
    finish(context);
    getOrder();
  }



  List<OrderModel> UserOrderList=[];

  void getUserOrder(String userid) {
    print("userid = $userid");
    db.collection("ORDERS").where("USER_ID",isEqualTo: userid).get().then((value1) {
      print(value1);
      if (value1.docs.isNotEmpty) {
        UserOrderList.clear();
      }
        for (var value in value1.docs) {
          // print(value.get("NAME"));
          // print(value.get("PHONE"));
          Map<String,dynamic> map=value.data();
          UserOrderList.add(OrderModel(value.id,
            value.get("NAME").toString(),
            value.get("STATE").toString(),
            value.get("QUANTITY").toString(),
            value.get("ADDRESS").toString(),
            value.get("IMAGE").toString(),
            value.get("PLANT_NAME").toString(),
            value.get("USER_ID").toString(),
            value.get("STATUS").toString(),
          ));
          notifyListeners();
        }
        notifyListeners();
    });
  }











}









