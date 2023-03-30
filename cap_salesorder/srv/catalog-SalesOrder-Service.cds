using {com.logali.SalesOrder as logali} from '../db/schema';

define service CatalogService {

    entity SalesOrderHeader as
        select from logali.SalesOrderHeader {
            ID,
            Email       @mandatory,
            FirstName,
            LastName,
            Country,
            CreateOn    @readonly,
            DeliveryDate,
            OrderStatus @readonly,
            ImageUrl,
            to_Items
        };

    entity SalesOrderItem   as
        select from logali.SalesOrderItems {
            ID,
            Name,
            Description,
            ReleaseDate,
            DiscontinuedDate,
            Price,
            CurrencyCode.ID               as Currency,
            CurrencyCode.Description   as Desc_Currency @readonly,
            Height,
            Width,
            Depth,
            DimensionUnits.ID as DimensionUnits,
            DimensionUnits.Description as Desc_DimensionUnits @readonly,
            Quantity,
            UnitOfMeasures.ID as UnitOfMeasures,
            UnitOfMeasures.Description as Desc_UnitOfMeasures @readonly,
            to_Header
        };

    @readonly
    entity VH_Currencies     as
        select from logali.Currencies {
            ID          as Code,
            Description as Text
        };

    @readonly
    entity VH_UnitOfMesaures as
        select from logali.UnitOfMeasures {
            ID          as Code,
            Description as Text
        };

    @readonly
    entity VH_DimensionUnits as
        select
            ID          as Code,
            Description as Text
        from logali.DimensionUnits;
}
