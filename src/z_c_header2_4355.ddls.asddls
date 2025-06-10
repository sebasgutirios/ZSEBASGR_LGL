@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CONSUMPTION HEADER ENTITY'
@Metadata.ignorePropagatedAnnotations: true

@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity Z_C_HEADER2_4355
provider contract transactional_query
  as projection on Z_R_HEADER2_4355
{
  @Search.defaultSearchElement: true
  @Consumption.valueHelpDefinition: [{ entity:{name: 'Z_R_HEADER2_4355',element: 'IdHeader'} }]
  key IdHeader,
      Email,
      FirstName,
      LastName,
      Country,
      Createon,
      DeliveryDate,
      @ObjectModel.text.element: [ 'StatusText' ]
        @Consumption.valueHelpDefinition: [{ entity:{name: '/DMO/I_Overall_Status_VH_Text',element: 'OverallStatus'},useForValidation: true }]
      OrderStatus,
      _Status._OverallStatus._Text.Text as StatusText : localized,
      OrderStatus2,
      ImageUrl,
      /* Associations */
      _items: redirected to composition child Z_C_ITEM2_4355,
      _Status
}
