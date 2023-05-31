import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/controller/searche_page_controller.dart';
import 'package:weather/ditails/countries.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchPageController controller = Get.put(SearchPageController());


    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(

        title: Text("Search for city"),
        backgroundColor: Colors.transparent,
        elevation: 2,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: const [
                Colors.blue,
                Colors.white,
              ]),
        ),
        child: SafeArea(
          child: Obx(() {
            return Center(
              child: controller.isLoadingData.value
                  ? SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                  color: Colors.black,
                ),
              )
                  : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Theme(
                        data: ThemeData(primarySwatch: Colors.blue),
                        child: TextFormField(
                          //controller: controller,
                          /*autovalidateMode: AutovalidateMode.always,
                              validator: (String? value) {
                                if (value!.length < 8) {
                                  return "Field required ";
                                }
                              },*/
                          //obscureText: true,
                          onChanged: (value) {
                            controller.cityName = value;
                            controller.setState(value);
                          },
                          //keyboardType: TextInputType.text,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            prefixIconColor: Colors.red,
                            iconColor: Colors.red,
                            prefixIcon: Icon(Icons.search),
                            labelText: "City name",
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.green,
                                  width: 2,
                                )),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                )),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.pink,
                                  width: 2,
                                )),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, controller.cityName);
                        },
                        child: Text("Search")),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: controller.filteredCountries.length,
                        itemBuilder: (context, index) {
                          Countries c = controller.filteredCountries[index];
                          return Card(
                            child: ListTile(
                              onTap: () {
                                Navigator.pop(context, c.capital);
                              },
                              title: Text(c.name),
                              subtitle: Text(c.capital),
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(c.flag),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ]),
            );
          }),
        ),
      ),
    );
  }
}
