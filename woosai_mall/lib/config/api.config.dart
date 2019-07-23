

class Api {

  // 登录
  static const String USER_LOGIN = 'https://ddapi.doujiusm.com/v1.0/user/login';

  // 授权登录
  static const String DO_AUTH_LOGIN = 'app/auth/login';

  // 商品首页推荐
  static const String REQ_HOT_RECOMMEND = 'app/goods/recommend-goods';

  // 商品列表
  static const String REQ_GOODS_LIST = 'app/goods/list';

  // 商品详情
  static const String REQ_GOODS_DETAILS = 'app/goods/query';

  // 商品状态是否购买
  static const String REQ_GOODS_STATUS = 'app/goods/check-goods';

  // 商品下单
  static const String DO_ORDER_CREATE = 'app/trade/order/create';

  // 商品订单列表
  static const String REQ_ORDER_LIST = 'app/trade/order/list';

  // 商品订单详情
  static const String REQ_ORDER_DETAILS = 'app/trade/order/query';

  // 商品订单删除
  static const String DO_ORDER_DELETE = 'app/trade/order/delete';

  // 用户信息
  static const String REQ_USER_INFO = 'app/user/info';

  // 地址列表
  static const String REQ_ADDRESS_LIST = 'app/address/list';

  // 收货地址修改
  static const String DO_ADDRESS_UPDATE = 'app/address/update';

  // 收货地址新增
  static const String DO_ADDRESS_ADD = 'app/address/add';

  // 收货地址详情
  static const String REQ_ADDRESS_DETAILS = 'app/address/query';

  // 收货地址删除
  static const String DO_ADDRESS_DELETE = 'app/address/delete';

  // 收货地址设为默认
  static const String DO_ADDRESS_SET_DEFAULT = 'app/address/set-default';
  
}