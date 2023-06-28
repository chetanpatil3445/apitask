
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../Controller/Firm_List_Controller.dart';


class FirmListScreen extends StatefulWidget {
  @override
  _FirmListScreenState createState() => _FirmListScreenState();
}

class _FirmListScreenState extends State<FirmListScreen> {
  FirmListController _firmListController = FirmListController();
  //List<Map<String, String?>> _firmList = [];
  List<Map<String, dynamic>> _firmList = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchFirmListData();
  }

  Future<void> fetchFirmListData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await _firmListController.fetchFirmList(
        apiRequestType: "MOB_APP",
        ecomOwnId: "101010",
        ecomLoginId: "lrearth",
        systemOnOff: "ON",
        gbDbHost: "43.205.122.41",
        userLoginId: "lrearth",
        ecomDomainName: "omunim.com",
        ecomApiKey: "",
        apiLoginToken: "abc12313",
        apiProdKey: "123123",
        apiRequestId: "lrearth",
        apiFolder: "",
        mapiFolder: "",
        remoteLogin: "HTTP_REMOTE_LOGIN",
        gbDbPort: "3306",
        gbDbUser: "",
        userDbHost: "",
        userDbPort: "",
        userDbUser: "",
        ownerLoginId: "lrearth",
        ownerUserPassword: "",
      );

      setState(() {
        _firmList = response;
        _isLoading = false;
      });
    } catch (e) {
      // Handle error
      setState(() {
        _isLoading = false;
      });
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firm List'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _firmList.length,
        itemBuilder: (context, index) {
          final Map<String, dynamic> firm = _firmList[index];
          return Card(
            child: Container(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(firm['firm_id'] ?? '', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(height: 20,),
                  Text(firm['firm_own_id'] ?? '', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(height: 20,),
                  Text(firm['firm_name'] ?? '', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(height: 20,),
                  Text(firm['firm_reg_no'] ?? '', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(height: 20,),
                  Text(firm['firm_type'] ?? '', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 18)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
