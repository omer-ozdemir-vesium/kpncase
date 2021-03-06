/**
 * Created by Omer on 21/02/2022.
 */

public with sharing class OrderService {

    public static OrderServiceIntegrationResult sendOrderToExternalSystem(Id orderId) {

        OrderServiceIntegrationResult integrationResult = new OrderServiceIntegrationResult();
        integrationResult.message = '';
        integrationResult.isSuccess = false;

        try {

            Order order = [
                    SELECT Id,Account.AccountNumber,OrderNumber,Type,Status, (
                            SELECT Id,UnitPrice,Product2.ProductCode,Product2.Name,Quantity
                            FROM OrderItems
                    )
                    FROM Order
                    WHERE Id = :orderId
            ];


            OrderRequestModel orderRequestModel = new OrderRequestModel();
            orderRequestModel.accountNumber = order.Account.AccountNumber;
            orderRequestModel.orderNumber = order.OrderNumber;
            orderRequestModel.type = order.Type;
            orderRequestModel.status = order.Status;


            List<orderItemRequestModel> orderItemRequestModels = new List<OrderService.OrderItemRequestModel>();
            OrderItemRequestModel orderItemRequestModel = new OrderItemRequestModel();
            for (OrderItem orderItem : order.OrderItems) {
                orderItemRequestModel = new OrderItemRequestModel();
                orderItemRequestModel.unitPrice = orderItem.UnitPrice;
                orderItemRequestModel.code = orderItem.Product2.ProductCode;
                orderItemRequestModel.name = orderItem.Product2.Name;
                orderItemRequestModel.quantity = orderItem.Quantity;
                orderItemRequestModels.add(orderItemRequestModel);
            }
            orderRequestModel.orderProducts = orderItemRequestModels;

            Map<String, Order_Request__mdt> requestURLs = Order_Request__mdt.getAll();
            Order_Request__mdt methodDetail = requestURLs.get('Method1');

            Http http = new Http();
            HttpRequest httpRequest = new HttpRequest();
            httpRequest.setEndpoint('callout:OrderExternalSystemNamedCredential/' + methodDetail.Method__c);
            httpRequest.setMethod(methodDetail.HTTP_Callout_Type__c);
            httpRequest.setBody(JSON.serializePretty(orderRequestModel));
            HttpResponse httpResponse = http.send(httpRequest);

            if (httpResponse.getStatusCode() == 200) {
                integrationResult.isSuccess = true;
            } else {
                String errorMessage = System.Label.OrderActivationIntegrationFailMessage;
                throw new OrderServiceWebServiceException(errorMessage);
            }

        } catch (Exception ex) {
            System.debug(ex.getMessage());
            System.debug(ex.getStackTraceString());
            integrationResult.isSuccess = false;
            integrationResult.message = ex.getMessage();
        }

        return integrationResult;

    }

    class OrderServiceWebServiceException extends Exception {
    }

    public class OrderServiceIntegrationResult {
        public Boolean isSuccess;
        public String message;
    }

    class OrderRequestModel {
        public String accountNumber;
        public String orderNumber;
        public String type;
        public String status;
        public List<OrderItemRequestModel> orderProducts;
    }

    class OrderItemRequestModel {
        public String name { get; set; }
        public String code { get; set; }
        public Decimal unitPrice { get; set; }
        public Decimal quantity { get; set; }
    }

}