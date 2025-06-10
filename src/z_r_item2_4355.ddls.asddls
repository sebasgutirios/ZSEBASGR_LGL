@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ROOT ENTITY ITEMS'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_R_ITEM2_4355
  as select from zitem2_4355 as item
  association to parent Z_R_HEADER2_4355 as _header on $projection.IdHeader = _header.IdHeader
{
  key item.id_item      as IdItem,
      item.id_header    as IdHeader,
      name              as Name,
      description       as Description,
      release_date      as ReleaseDate,
      discontinued_date as DiscontinuedDate,
      price             as Price,
      @Semantics.quantity.unitOfMeasure: 'Unitofmeasure'
      height            as Height,
      @Semantics.quantity.unitOfMeasure: 'Unitofmeasure'
      width             as Width,
      depth             as Depth,
      quantity          as Quantity,
      unitofmeasure     as Unitofmeasure,
      _header
}
