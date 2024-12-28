class TabModel{
  final int index;
  final String title;
  const TabModel({required this.index,required this.title})
      :assert(index >=0,'index cant be negative');

}