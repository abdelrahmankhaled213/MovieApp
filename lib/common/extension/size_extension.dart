extension SizeExtensionString on String{
  String intelliTirm(){
    return this.length> 15 ? '${this.substring(0,10)}...':this;
  }

}