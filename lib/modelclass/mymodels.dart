class IndoorModel{
  String Inid;
  String Inname;
  String Inimage;
  String Inprice;
  String Indesc;
  IndoorModel(this.Inid,this.Inname,this.Inimage,this.Inprice,this.Indesc);
}

class OutdoorModel{
  String Ouid;
  String Ouname;
  String Ouimage;
  String Ouprice;
  String Oudesc;
  OutdoorModel(this.Ouid,this.Ouname,this.Ouimage,this.Ouprice,this.Oudesc);
}

class OtherModel{
  String Otid;
  String Otname;
  String Otimage;
  String Otprice;
  String Otdesc;
  OtherModel(this.Otid,this.Otname,this.Otimage,this.Otprice,this.Otdesc);
}

class UserModel{
  String Usid;
  String Usname;
  String Usphone;
  UserModel(this.Usid,this.Usname,this.Usphone);
}

class PlantsModel{
  String Plid;
  String Plimage;
  String Plname;
  String Plprice;
  String Pldesc;
  String catid;
  PlantsModel(this.Plid,this.Plimage,this.Plname,this.Plprice,this.Pldesc,this.catid);
}

class CartModel{
  String Crtid;
  String Crtname;
  String Crtprice;
  String Crtimg;
  CartModel(this.Crtid,this.Crtname,this.Crtprice,this.Crtimg);
}

class UserAdminModel{
  String Usid;
  String Usname;
  String Usphone;
  UserAdminModel(this.Usid,this.Usname,this.Usphone);
}

class OrderModel{
  String orderid;
  String itemname;
  String itemstate;
  String itemquantity;
  String itemaddress;
  String itemimage;
  String plantname;
  String userid;
  String status;
  OrderModel(this.orderid,this.itemname,this.itemstate,this.itemquantity,this.itemaddress,this.itemimage,this.plantname,this.userid,this.status);
}

