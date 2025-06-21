@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'INTERFACE ITEM ENTITY'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z_I_HEADER1_4355
provider contract transactional_interface
  as projection on Z_R_HEADER2_4355
{
  key IdHeader,
      Email,
      FirstName,
      LastName,
      Country,
      Createon,
      DeliveryDate,
      OrderStatus,
      OrderStatus2,
      ImageUrl,
      /* Associations */
      _items: redirected to composition child Z_I_ITEM2_4355
      //_Status
}
