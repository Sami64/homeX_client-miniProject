import 'package:home_x_client/core/user/domain/usecases/user_data.dart';
import 'package:home_x_client/src/orders/domain/entities/order.dart';
import 'package:home_x_client/src/orders/domain/usecases/all_orders.dart';
import 'package:home_x_client/src/orders/domain/usecases/completed_orders.dart';

class OrdersBloc {
  final AllOrders allOrders;
  final UserData userData;
  final CompletedOrders completedOrders;

  OrdersBloc({required this.allOrders, required this.userData, required this.completedOrders});

  Future<String> userToken() async {
    final failureOrUser = await userData(UserDataParams());
    return await failureOrUser.fold((l) => l.toString(), (r) => r.token);
  }

  Stream<List<Orders>> userOrders() async* {
    String token = await userToken();
    final failureOrOrders = await allOrders(AllOrdersParams(pk: token));
    yield* failureOrOrders.fold((l) async* {
      yield <Orders>[];
    }, (orders) async* {
      yield orders;
    });
  }

  Stream<List<Orders>> userCompletedOrders() async* {
    String token = await userToken();
    final failureOrOrders = await completedOrders(CompletedOrdersParams(pk: token));
    yield* failureOrOrders.fold((l) async* {
      yield <Orders>[];
    }, (orders) async* {
      yield orders;
    });
  }
}
