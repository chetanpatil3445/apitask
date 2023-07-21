
import 'package:apitask/Model/firm_Request.dart';
import 'package:apitask/Model/firm_Response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../Controller/Firm_List_Controller.dart';


class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  FirmListController _firmListController = FirmListController();


  List<FirmResponse> _firmList = [];
  bool _isLoading = false;
  bool _isTapped = false;

  @override
  void initState() {
    super.initState();
    fetchFirm();
  }

  Future<void> fetchFirm() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await _firmListController.fetchFirmList(
          FIrmRequest(
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
      setState(() {
        _isLoading = false;
      });
      print(e.toString());
    }
  }
  Future<void> _showDeleteConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to delete this item?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                // Call the delete function here
                // For example: _deleteItem();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: Drawer(
        backgroundColor: Colors.cyan,
      ),
      backgroundColor: Colors.white
      ,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
        title: Text('Api Task Firm ',style: TextStyle(color: Colors.black),),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _firmList.length,
        itemBuilder: (context, index) {
          return Card(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isTapped = !_isTapped;
                });
              },
              child: AnimatedContainer(

                height: 110,
                curve: Curves.easeInOut,
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  //color: Color(0xFF80CBC4),
                  color: _isTapped ? Colors.white70 : Color(0xFFE0F2F1),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                            },
                            child:  textWidget(_firmList[index].firmName,
                              style:  const TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          textWidget(_firmList[index].firmAddress, style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),
                          textWidget(_firmList[index].firmEmail, style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),
                          textWidget(_firmList[index].firmOwner, style: TextStyle(color: Colors.black)),
                        ],
                      ),

                      leading: Image.asset(
                        "Assets/images/task.png",
                        width: 48,
                        height: 48,
                      ),

                      trailing: IconButton(
                        color: Colors.black,
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _showDeleteConfirmationDialog();
                        },
                      ),
                    )

                  ],
                ),

              ),
            ),
          );
        },
      ),
    );
  }
}

Widget textWidget(String? data, {required TextStyle style}) {
  return Column(
    children: [
      Text(
        data ?? '',
        style: style,
      ),
      SizedBox(height: 5),
    ],
  );
}
