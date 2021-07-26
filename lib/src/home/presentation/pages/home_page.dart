import 'package:flutter/material.dart';
import 'package:home_x_client/core/service/domain/entities/category.dart';
import 'package:home_x_client/src/home/presentation/bloc/home_bloc.dart';
import 'package:home_x_client/src/home/presentation/widgets/service_category_card.dart';
import 'package:home_x_client/src/home/presentation/widgets/service_list_arguments.dart';
import 'package:home_x_client/injection_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bloc = sl<HomeBloc>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var s = _bloc.services();
    print(s.first);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'HomeX',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Find A Service',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.1),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: StreamBuilder<List<Category>>(
                    stream: _bloc.services(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data!.length > 0)
                        return GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 2),
                          children: List.generate(
                              snapshot.data!.length,
                              (index) => ServiceCategoryCard(
                                    categoryName:
                                        snapshot.data![index].categoryName,
                                    categoryImage:
                                        snapshot.data![index].categoryImage,
                                    onTap: () => Navigator.of(context)
                                        .pushNamed('/services',
                                            arguments: ServiceListArguments(
                                                serviceID:
                                                    snapshot.data![index].key,
                                                serviceName: snapshot
                                                    .data![index]
                                                    .categoryName)),
                                  )),
                        );
                      else if (snapshot.hasData && snapshot.data!.length < 1)
                        return Center(child: Text('No Categories'));
                      else
                        return Center(child: Text('Loading'));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
