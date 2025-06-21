@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CONSUMPTION ITEM ENTITY'
@Metadata.ignorePropagatedAnnotations: true

@Metadata.allowExtensions: true
define view entity Z_C_ITEM2_4355
  as projection on Z_R_ITEM2_4355
{
@Search.defaultSearchElement: true
  @Consumption.valueHelpDefinition: [{ entity:{name: 'Z_R_ITEM2_4355',element: 'IdItem'} }]
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
      _header : redirected to parent Z_C_HEADER2_4355
}
