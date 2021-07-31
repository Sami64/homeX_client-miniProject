import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_x_client/core/data/images_data.dart';
import 'package:home_x_client/core/presentation/pages/loading.dart';
import 'package:home_x_client/core/service/domain/entities/service.dart';
import 'package:home_x_client/injection_container.dart';
import 'package:home_x_client/src/service_details/presentation/bloc/service_details_bloc.dart';
import 'package:home_x_client/src/service_details/presentation/widgets/custom_app_bar.dart';
import 'package:home_x_client/src/service_details/presentation/widgets/details_arguments.dart';

class ServiceDetailsPage extends StatelessWidget {
  ServiceDetailsPage({Key? key}) : super(key: key);

  final bloc = sl<ServiceDetailsBloc>();

  @override
  Widget build(BuildContext context) {
    DetailsArguments args =
        ModalRoute.of(context)!.settings.arguments as DetailsArguments;
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F6F9),
      // appBar: CustomAppBar(
      //   rating: 5.0,
      // ),
      body: SafeArea(
        bottom: false,
        child: StreamBuilder<Service>(
            stream: bloc.details(pk: args.pk),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data!.key != '') {
                List<String> features = snapshot.data!.features.split(',');
                return Stack(children: [
                  Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.4,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FadeInImage(
                                    image: NetworkImage(snapshot.data!.image),
                                    placeholder: AssetImage(Images.ps4),
                                  ).image)),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(
                              horizontal: 1.0, vertical: 1.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(55),
                                  topRight: Radius.circular(55))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.04),
                                  child: Text(
                                    snapshot.data!.name,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.08),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.04),
                                  child: Text(
                                    snapshot.data!.description,
                                    maxLines: 3,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextButton(
                                    child: Text(
                                      'See More >',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.06,
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    onPressed:
                                        () =>
                                            scaffoldKey.currentState!
                                                .showBottomSheet(
                                                    (context) => Container(
                                                        height: MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.8,
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius.circular(
                                                                    55),
                                                                topRight: Radius.circular(
                                                                    55)),
                                                            color:
                                                                Colors.white),
                                                        child: ListView(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    28),
                                                            children: [
                                                              Text(
                                                                snapshot
                                                                    .data!.name,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.1),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            8.0),
                                                                child: Text(
                                                                    snapshot
                                                                        .data!
                                                                        .description,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .grey,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            MediaQuery.of(context).size.width *
                                                                                0.05)),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            8.0),
                                                                child: Column(
                                                                  children: [
                                                                    Text(
                                                                      'Features',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: TextStyle(
                                                                          fontSize: MediaQuery.of(context).size.width *
                                                                              0.06,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Text(snapshot
                                                                        .data!
                                                                        .features)
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            8.0),
                                                                child: Column(
                                                                  children: [
                                                                    Text(
                                                                      'Service Personnel Info',
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              MediaQuery.of(context).size.width * 0.06),
                                                                    ),
                                                                    Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            snapshot.data!.seller.name,
                                                                            style: TextStyle(
                                                                                fontSize: MediaQuery.of(context).size.width * 0.05,
                                                                                color: Colors.grey,
                                                                                fontWeight: FontWeight.bold),
                                                                          ),
                                                                          Text(
                                                                              snapshot.data!.seller.email,
                                                                              style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05, color: Colors.grey, fontWeight: FontWeight.bold))
                                                                        ]),
                                                                    Text(
                                                                        snapshot
                                                                            .data!
                                                                            .seller
                                                                            .address,
                                                                        style: TextStyle(
                                                                            fontSize: MediaQuery.of(context).size.width *
                                                                                0.05,
                                                                            color:
                                                                                Colors.grey,
                                                                            fontWeight: FontWeight.bold)),
                                                                    Text(
                                                                        snapshot
                                                                            .data!
                                                                            .seller
                                                                            .qualification,
                                                                        style: TextStyle(
                                                                            fontSize: MediaQuery.of(context).size.width *
                                                                                0.05,
                                                                            color:
                                                                                Colors.grey,
                                                                            fontWeight: FontWeight.bold))
                                                                  ],
                                                                ),
                                                              )
                                                            ])),
                                                    backgroundColor:
                                                        Colors.black,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    55),
                                                            topRight:
                                                                Radius.circular(55))))),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.08,
                                        vertical:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFF5F6F9),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(25))),
                                    child: ElevatedButton(
                                      child: Text('ORDER'),
                                      onPressed: () => showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return LoadingPage(
                                              errorText: bloc.placeServiceOrder(
                                                  serviceID:
                                                      snapshot.data!.key),
                                              callback: () =>
                                                  Navigator.of(context)
                                                      .pushNamed('/orders'),
                                            );
                                          }),
                                      style: ButtonStyle(
                                          padding: MaterialStateProperty.all(
                                              EdgeInsets.all(12)),
                                          textStyle: MaterialStateProperty.all(
                                              TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.07,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                      top: 10,
                      child: Container(
                        color: Colors.white,
                        child: IconButton(
                          icon: Icon(Icons.chevron_left),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      )),
                ]);
              } else
                return Center(
                  child: Text('Loading'),
                );
            }),
      ),
    );
  }
}
