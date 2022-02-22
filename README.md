## Project Structure

# LWC
availableProducts<br />
Lists the products for the selected price book<br />
orderProducts<br />
Lists the order items, Activate button is located in this component.<br />
Utility<br />
Created for to manage commonly used Javascript methods<br />

# Message Channels
OrderItemUpsert.messageChannel-meta.xml<br />
Created for to communicate between the components.<br />

# Classes
AvailableProductsController.cls<br />
AvailableProductsControllerTest.cls<br />
OrderProductController.cls<br />
OrderProductControllerTest.cls<br />
OrderService.cls<br />
Responsible to send the order record to the external end-point<br />
RESTMockServiceResponseGenerator.cls<br />
Responsible to generate generic mock service responses.<br />
TestDataFactory.cls<br />
Responsible to create sample records to be used in the test classes.<br />

# Custom Labels
AvailableProductsAddProductButtonLabel<br />
AvailableProductsCardLabel<br />
AvailableProductsHideProductListButtonLabel<br />
AvailableProductsListPriceColumnName<br />
AvailableProductsProductNameColumnName<br />
AvailableProductsShowProductListButtonLabel<br />
OrderActivationIntegrationFailMessage<br />
OrderActivationIntegrationSuccessMessage<br />
OrderItemProductNameColumn<br />
OrderItemQuantityColumnName<br />
OrderItemTotalPriceColumnName<br />
OrderItemUnitPriceColumnName<br />
OrderProductsActivateButtonLabel<br />
OrderProductsCardLabel<br />
OrderProductsSpinnerLoadingLabel<br />
ShowToastEventFailMessageTitle<br />
ShowToastEventSuccessMessageTitle <br />

# Named Credential
Order External System Named Credential<br />
Responsible to store the external callout authorization credentials<br />

## Installation
https://login.salesforce.com/packaging/installPackage.apexp?p0=04t8d000000U99a&isdtp=p1