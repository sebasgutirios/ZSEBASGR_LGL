@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'INTERFACE ITEM ENTITY'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_I_ITEM2_4355
  as projection on Z_R_ITEM2_4355
{
  key IdItem,
      IdHeader,
      Name,
      Description,
      ReleaseDate,
      DiscontinuedDate,
      Price,
      @Semantics.quantity.unitOfMeasure: 'Unitofmeasure'
      Height,
      @Semantics.quantity.unitOfMeasure: 'Unitofmeasure'
      Width,
      Depth,
      Quantity,
      Unitofmeasure,
      /* Associations */
      _header : redirected to parent Z_I_HEADER1_4355
}
