
import 'package:apitask/Model/firm_Request.dart';
import 'package:apitask/Model/firm_Response.dart';
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
  List<FirmResponse> _firmList = [];
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
          FirmListRequest(
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
          )
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
          return Card(
            child: Container(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  textWidget(_firmList[index].firmId),
                  textWidget(_firmList[index].firmName),
                  textWidget(_firmList[index].firmType),
                  textWidget(_firmList[index].firmEmail),
                  textWidget(_firmList[index].firmFormFooter),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
  Widget textWidget(String? data)
  {
    return Column(
      children: [
        Text(data ?? '', style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 18)),
        SizedBox(height: 20,)
      ],
    );
  }
  
}