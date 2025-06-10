@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ROOT ENTITY HEADER'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z_R_HEADER2_4355
  as select from zheader2_4355 as Header
  composition [0..*] of Z_R_ITEM2_4355                 as _items
  association [1..1] to /DMO/I_Overall_Status_VH_Text as _Status on  $projection.OrderStatus = _Status.OverallStatus
                                                                 and _Status.Language        = $session.system_language
{
  key id_header     as IdHeader,
      email         as Email,
      first_name    as FirstName,
      last_name     as LastName,
      country       as Country,
      createon      as Createon,
      delivery_date as DeliveryDate,
      order_status  as OrderStatus,
      case
        when order_status = 'A' then 3
        when order_status = 'X' then 1
        when order_status = 'O' then 2
      else 0
      end           as OrderStatus2,
    image_url     as ImageUrl,
      _items,
      _Status // Make association public
}
