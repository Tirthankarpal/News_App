import '../models/catagory_model.dart';

List<CatagoryModel> getCatagories() {
  List<CatagoryModel> catagory = [];
  CatagoryModel catagoryModel = new CatagoryModel();
  catagoryModel.catagoryName = 'Business';
  catagoryModel.imageUrl =
      'https://images.unsplash.com/photo-1507679799987-c73779587ccf?q=80&w=2942&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
  catagory.add(catagoryModel);
  catagoryModel = new CatagoryModel();
  catagoryModel.catagoryName = 'Entertainment';
  catagoryModel.imageUrl =
  'https://images.unsplash.com/photo-1499364615650-ec38552f4f34?q=80&w=2804&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
  catagory.add(catagoryModel);
  catagoryModel = new CatagoryModel();
  catagoryModel.catagoryName = 'General';
  catagoryModel.imageUrl =
  'https://images.unsplash.com/photo-1494059980473-813e73ee784b?q=80&w=2969&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
  catagory.add(catagoryModel);
  // catagoryModel = new CatagoryModel();
  // catagoryModel.catagoryName = 'Bussiness';
  // catagoryModel.imageUrl =
  // 'https://images.unsplash.com/photo-1507679799987-c73779587ccf?q=80&w=2942&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
  // catagory.add(catagoryModel);
  return catagory;
}
