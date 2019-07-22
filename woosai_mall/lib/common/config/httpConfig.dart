
class HttpConfig {

  static const String MALL_H51 = 'http://mall-h5.doujiusm.com/index.html?platformNo=P001&pfUserToken=';
  static const String MALL_H5 = 'http://mall-h5.test.ptjxd.com//index.html?platformNo=P001&pfUserToken=';

  static const String BASE_URL = 'http://mall-boss-api.dev.ptjxd.com/api/v1';

  static const List SUCCESS_CODE = ['000000', 'S0001'];

  static const String PLATFORM_NO = 'P001';

  // 登录
  static const String USER_LOGIN = 'https://ddapi.doujiusm.com/v1.0/user/login';

  // 授权登录
  static const String DO_AUTH_LOGIN = '$BASE_URL/app/auth/login';

  // 商品首页推荐
  static const String REQ_HOT_RECOMMEND = '$BASE_URL/app/goods/recommend-goods';

  // 商品列表
  static const String REQ_GOODS_LIST = '$BASE_URL/app/goods/list';

  // 商品详情
  static const String REQ_GOODS_DETAILS = '$BASE_URL/app/goods/query';

  // 商品状态是否购买
  static const String REQ_GOODS_STATUS = '$BASE_URL/app/goods/check-goods';

  // 商品下单
  static const String DO_ORDER_CREATE = '$BASE_URL/app/trade/order/create';

  // 商品订单列表
  static const String REQ_ORDER_LIST = '$BASE_URL/app/trade/order/list';

  // 商品订单详情
  static const String REQ_ORDER_DETAILS = '$BASE_URL/app/trade/order/query';

  // 商品订单删除
  static const String DO_ORDER_DELETE = '$BASE_URL/app/trade/order/delete';

  // 用户信息
  static const String REQ_USER_INFO = '$BASE_URL/app/user/info';

  // 地址列表
  static const String REQ_ADDRESS_LIST = '$BASE_URL/app/address/list';

  // 收货地址修改
  static const String DO_ADDRESS_UPDATE = '$BASE_URL/app/address/update';

  // 收货地址新增
  static const String DO_ADDRESS_ADD = '$BASE_URL/app/address/add';

  // 收货地址详情
  static const String REQ_ADDRESS_DETAILS = '$BASE_URL/app/address/query';

  // 收货地址删除
  static const String DO_ADDRESS_DELETE = '$BASE_URL/app/address/delete';

  // 收货地址设为默认
  static const String DO_ADDRESS_SET_DEFAULT = '$BASE_URL/app/address/set-default';

}