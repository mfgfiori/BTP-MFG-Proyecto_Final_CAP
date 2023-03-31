using {
    cuid,
    managed
} from '@sap/cds/common';

namespace com.logali;

type Dec : Decimal(16, 2);

/* type Status: Integer @asser.range enum {
    0; // Neutral         - New
    1;  // Negative (red)  - Cancel
    2;  // Critical (orange) - Processing
    3;  // Positive (green)  - Complete 
}  */

context SalesOrder {
    entity SalesOrderHeader : cuid, managed {
            Email        : String(30) not null;
            FirstName    : String(30);
            LastName     : String(30);
            Country      : String(30);
            CreateOn     : Date;
            DeliveryDate : Date;
            OrderStatus  : Integer;  /* 0 - Neutral         - New
                                        1 - Negative (red)  - Cancel
                                        2 - Critical (orange) - Processing
                                        3 - Positive (green)  - Complete */         
            ImageUrl     : String;
            to_Items     : Composition of many SalesOrderItems
                               on to_Items.to_Header = $self;
            virtual  StatusText : String(20);            
    };

    entity SalesOrderItems : cuid, managed {        
        Name             : localized String(40) not null;
        Description      : localized String(40);
        ReleaseDate      : Date;
        DiscontinuedDate : Date;
        Price            : Decimal(12, 2);
        CurrencyCode     : Association to Currencies;
        Height           : type of Price;
        Width            : Decimal(15, 3);
        Depth            : Decimal(12, 2);
        DimensionUnits   : Association to DimensionUnits;
        Quantity         : Dec;
        UnitOfMeasures   : Association to UnitOfMeasures;
        to_Header        : Association to SalesOrderHeader;

    };

    entity Currencies {
        key ID          : String(3);
            Description : localized String;
    };

    entity UnitOfMeasures {
        key ID          : String(2);
            Description : localized String;
    };

    entity DimensionUnits {
        key ID          : String(2);
            Description : localized String;
    };

}
