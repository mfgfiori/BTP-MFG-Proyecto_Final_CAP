using {
    cuid,
    managed
} from '@sap/cds/common';

namespace com.logali;

type Dec : Decimal(16, 2);

context SalesOrder {
    entity SalesOrderHeader : cuid, managed {
        Email        : String(30) not null;
        FirstName    : String(30);
        LastName     : String(30);
        Country      : String(30);
        CreatedOn    : Date;
        DeliveryDate : Date;
        OrderStatus  : Integer;
        ImageUrl     : String;
        to_Items     : Composition of many SalesOrderItems
                           on to_Items.to_Header = $self;
    };

    entity SalesOrderItems : cuid, managed {
        Name             : localized String(40) not null;
        Description      : localized String(40);
        ReleaseDate      : Date;
        DiscontinuedDate : Date;
        Price            : Decimal(12, 2);
        Height           : type of Price;
        Width            : Decimal(15, 3);
        Depth            : Decimal(12, 2);
        Quantity         : Decimal(16, 2);
        to_Header        : Association to SalesOrderHeader;
    }
}
