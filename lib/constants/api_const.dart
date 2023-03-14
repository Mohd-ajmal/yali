class ApiContants {
  static var baseUrl = "https://webappstudio-demo.online/api/v1/";

  

  static var login = "${baseUrl}login";
  static var countries = "${baseUrl}countries";
  static var states = "${baseUrl}states";
  static var districts = "${baseUrl}districts?id=1";
  static var hospitals = "${baseUrl}hospitals";
  static var itemQuantities = "${baseUrl}item-quantities";
  static var itemtypes = "${baseUrl}item-types";
  static var orders = "${baseUrl}orders";
  static var showOrders = "${baseUrl}orders/";
  static var getRequestedOrders = "${baseUrl}get-requested";
  static var getAcceptedOrders = "${baseUrl}get-accepted";
  static var postOrders = "${baseUrl}orders";
  static var cancelOrder = "${baseUrl}orders/cancel";
}