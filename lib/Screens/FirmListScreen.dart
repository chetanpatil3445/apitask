
import 'package:flutter/material.dart';
import '../Controller/Firm_List_Controller.dart';


class FirmListScreen extends StatefulWidget {
  @override
  _FirmListScreenState createState() => _FirmListScreenState();
}

class _FirmListScreenState extends State<FirmListScreen> {
  FirmListController _firmListController = FirmListController();
  List<Map<String, String?>> _firmList = [];
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
          ownerUserPassword: ""
        // Set other required parameters
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
          final firm = _firmList[index];
          return Container(
            color: Colors.orange,
            child: ListTile(
              title: Text(firm['name'] ?? ''),
              subtitle: Text(firm['address'] ?? ''),
               trailing: Text(firm['address'] ?? ''),
            ),
          );
        },
      ),
    );
  }
}
