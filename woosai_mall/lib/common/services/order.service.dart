
import 'package:woosai_mall/common/application.dart';
import 'package:woosai_mall/models/orderItem.modal.dart';
import 'package:woosai_mall/models/orderList.model.dart';

class Order {

  static final Order _order = Order._internal();

  factory Order () {
    return _order;
  }

  Order._internal();

  // 获取订单列表
  Future reqOrderList ({int pageSize = 10, int pageNum = 1}) async {
    String url = Application.config.api.reqOrderList;
    Map params = {'pageSize': pageSize, 'pageNum': pageNum};
    var respBody = await Application.util.http.post(url, params: params);
    OrderListModal orderListModal = OrderListModal.fromJson(respBody);
    return orderListModal;
  }

  // 订单详情
  Future reqOrderDetails ({orderId}) async {
    String url = Application.config.api.reqOrderDetails;
    var respBody = await Application.util.http.post(url, params: {'orderId': orderId});
    OrderItemModal orderItemModal = OrderItemModal.fromJson(respBody);
    return orderItemModal;
  }

  // 删除订单
  Future doOrderDelete ({orderId}) async {
    String url = Application.config.api.doOrderDelete;
    await Application.util.http.post(url, params: {'orderId': orderId});
  }

}