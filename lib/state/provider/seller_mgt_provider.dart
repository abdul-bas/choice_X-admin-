import 'package:choice_x_admin/model/seller_model/seller_model.dart';
import 'package:choice_x_admin/state/db/seller_mgt/seller_management.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class SellerMgtProvider extends ChangeNotifier {
  List<SellerModel> _allSellers = [];
  List<SellerModel> _filteredSellers = [];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController searchCtrl = TextEditingController();

  final FocusNode searchFocus = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? image;

  int _totalSeller = 0;
  int _activeSeller = 0;
  int _inActiveSeller = 0;
  int _pendingSeller = 0;

  bool _searchOpen = false;
  bool isLoading = false;


  // All time
  int _approved = 0;
  int _pending = 0;
  int _rejected = 0;


  // Today
  int _todaySellers = 0;
  int _todayApproved = 0;
  int _todayPending = 0;
  int _todayRejected = 0;


  // Week
  int _weeklySellers = 0;
  int _weekApproved = 0;
  int _weekPending = 0;
  int _weekRejected = 0;


  // Month
  int _monthlySellers = 0;
  int _monthApproved = 0;
  int _monthPending = 0;
  int _monthRejected = 0;



  bool get searchOpen => _searchOpen;

  List<SellerModel> get filtered => _filteredSellers;

  List<SellerModel> get sellers => _allSellers;


  int get totalSeller => _totalSeller;

  int get activeSeller => _activeSeller;

  int get inActiveSeller => _inActiveSeller;

  int get pendingSeller => _pendingSeller;



  void searchFilter(String query) {

    final q = query.toLowerCase().trim();

    if(q.isEmpty){

      _filteredSellers = List.from(_allSellers);

    }else{

      _filteredSellers = _allSellers.where((seller){

        return seller.userName
                .toLowerCase()
                .contains(q) ||

            seller.phoneNumber
                .toString()
                .contains(q) ||

            seller.email
                .toLowerCase()
                .contains(q) ||

            seller.status
                .toLowerCase()
                .contains(q);

      }).toList();
    }

    notifyListeners();
  }



  void toggleSearch(){

    _searchOpen = !_searchOpen;

    if(!_searchOpen){
      clearSearch();
    }

    notifyListeners();
  }



  void clearSearch(){

    searchCtrl.clear();

    _filteredSellers = List.from(_allSellers);

    notifyListeners();
  }




  Future<void> fetchTotalSeller() async {


    isLoading = true;

    notifyListeners();


    try{

      final now = DateTime.now();


      final startOfToday = DateTime(
        now.year,
        now.month,
        now.day,
      );


      final startOfWeek =
          startOfToday.subtract(
            Duration(days: now.weekday - 1),
          );


      final startOfMonth = DateTime(
        now.year,
        now.month,
        1,
      );



      final data = await FirebaseFirestore
          .instance
          .collection('sellers')
          .get();



      final sellers = data.docs
          .map(
            (e)=>SellerModel.fromMap(e.data()),
          )
          .toList();



      _allSellers = sellers;

      _filteredSellers = List.from(sellers);



      // Reset

      _totalSeller = sellers.length;


      _todaySellers = 0;
      _weeklySellers = 0;
      _monthlySellers = 0;



      _approved = 0;
      _pending = 0;
      _rejected = 0;



      _todayApproved = 0;
      _todayPending = 0;
      _todayRejected = 0;



      _weekApproved = 0;
      _weekPending = 0;
      _weekRejected = 0;



      _monthApproved = 0;
      _monthPending = 0;
      _monthRejected = 0;




      for(final seller in sellers){



        final createdAt =
            seller.createdAt?.toDate();



        if(createdAt == null){
          continue;
        }



        final isToday =
            !createdAt.isBefore(startOfToday);


        final isThisWeek =
            !createdAt.isBefore(startOfWeek);


        final isThisMonth =
            !createdAt.isBefore(startOfMonth);




        if(isToday){
          _todaySellers++;
        }


        if(isThisWeek){
          _weeklySellers++;
        }


        if(isThisMonth){
          _monthlySellers++;
        }




        switch(
          seller.status.toLowerCase().trim()
        ){



          case 'approved':

            _approved++;


            if(isToday){
              _todayApproved++;
            }


            if(isThisWeek){
              _weekApproved++;
            }


            if(isThisMonth){
              _monthApproved++;
            }

            break;




          case 'pending':

            _pending++;


            if(isToday){
              _todayPending++;
            }


            if(isThisWeek){
              _weekPending++;
            }


            if(isThisMonth){
              _monthPending++;
            }


            break;




          case 'reject':
          case 'rejected':

            _rejected++;


            if(isToday){
              _todayRejected++;
            }


            if(isThisWeek){
              _weekRejected++;
            }


            if(isThisMonth){
              _monthRejected++;
            }


            break;
        }

      }



      _activeSeller = _approved;

      _pendingSeller = _pending;

      _inActiveSeller = _rejected;



    }catch(e){

      debugPrint(
        "Seller fetch error : $e",
      );

    }finally{

      isLoading = false;

      notifyListeners();
    }
  }





  num filteredSellerCount(String filter){

    switch(filter){


      case 'Today':
        return _todaySellers;


      case 'This Week':
        return _weeklySellers;


      case 'This Month':
        return _monthlySellers;


      default:
        return _totalSeller;
    }

  }





  Map<String,double> sellerStatusCounts(String filter){


    switch(filter){


      case 'Today':

        return {

          'approved':
              _todayApproved.toDouble(),

          'pending':
              _todayPending.toDouble(),

          'rejected':
              _todayRejected.toDouble(),

        };



      case 'This Week':

        return {

          'approved':
              _weekApproved.toDouble(),

          'pending':
              _weekPending.toDouble(),

          'rejected':
              _weekRejected.toDouble(),

        };



      case 'This Month':

        return {

          'approved':
              _monthApproved.toDouble(),

          'pending':
              _monthPending.toDouble(),

          'rejected':
              _monthRejected.toDouble(),

        };



      default:

        return {

          'approved':
              _approved.toDouble(),

          'pending':
              _pending.toDouble(),

          'rejected':
              _rejected.toDouble(),

        };

    }

  }




  @override
  void dispose(){

    nameController.dispose();

    searchCtrl.dispose();

    searchFocus.dispose();

    super.dispose();
  }
void setSellers({
    required AsyncSnapshot<QuerySnapshot<Object?>> snapshot,
  }) {
    if (!snapshot.hasData) return;

    _allSellers = snapshot.data!.docs
        .map((doc) => SellerModel.fromMap(
              doc.data() as Map<String, dynamic>,
            ))
        .toList();

    _filteredSellers = List.from(_allSellers);

    notifyListeners();
  }
}