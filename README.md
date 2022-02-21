## Project Structure

# LWC
availableProducts
Lists the products for the selected price book
orderProducts
Lists the order items, Activate button is located in this component.
Utility
Created for to manage commonly used Javascript methods

# Message Channels
OrderItemUpsert.messageChannel-meta.xml
Created for to communicate between the components.

# Classes
AvailableProductsController.cls
AvailableProductsControllerTest.cls
OrderProductController.cls
OrderProductControllerTest.cls
OrderService.cls
Responsible to send the order record to the external end-point
RESTMockServiceResponseGenerator.cls
Responsible to generate generic mock service responses.
TestDataFactory.cls
Responsible to create sample records to be used in the test classes.

# Custom Labels
AvailableProductsAddProductButtonLabel
AvailableProductsCardLabel
AvailableProductsHideProductListButtonLabel
AvailableProductsListPriceColumnName
AvailableProductsProductNameColumnName
AvailableProductsShowProductListButtonLabel
OrderActivationIntegrationFailMessage
OrderActivationIntegrationSuccessMessage
OrderItemProductNameColumn
OrderItemQuantityColumnName
OrderItemTotalPriceColumnName
OrderItemUnitPriceColumnName
OrderProductsActivateButtonLabel
OrderProductsCardLabel
OrderProductsSpinnerLoadingLabel
ShowToastEventFailMessageTitle
ShowToastEventSuccessMessageTitle 

# Named Credential
Order External System Named Credential
Responsible to store the external callout authorization credentials
