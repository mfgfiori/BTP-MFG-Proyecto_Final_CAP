using {CatalogService as service} from '../../srv/catalog-SalesOrder-Service';

annotate service.SalesOrderHeader with @(
    Capabilities       : {DeleteRestrictions : {
        $Type     : 'Capabilities.DeleteRestrictionsType',
        Deletable : false
    }, },
    UI.Identification:[
        {
            $Type  : 'UI.DataFieldForAction',
            Action : 'CatalogService.cancelSalesOrder',
            Label  : '{i18n>Cancel}',                    
        },

    ],
    UI.HeaderInfo      : {
        TypeName       : '{i18n>SaleOrder}',
        TypeNamePlural : '{i18n>SaleOrders}',
        ImageUrl       : ImageUrl,
        Title          : {
            $Type : 'UI.DataField',
            Value : Email
        },
    },
    UI.SelectionFields : [Email],    
    UI.LineItem        : [

        {
            $Type  : 'UI.DataFieldForAction',
            Action : 'CatalogService.cancelSalesOrder',
            Label  : '{i18n>Cancel}',              
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Header_ID}',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Email}',
            Value : Email,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>FirstName}',
            Value : FirstName,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>LastName}',
            Value : LastName,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Country}',
            Value : Country,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>CreateOn}',
            Value : CreateOn,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>DeliveryDate}',
            Value : DeliveryDate,
        },
        {
            Label       : '{i18n>OrderStatus}',
            Value       : StatusText,
            Criticality : OrderStatus,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>ImageUrl}',
            Value : ImageUrl,
        }
    ]
);

annotate service.SalesOrderHeader with {
    ImageUrl @(UI.IsImageURL : true)
};

annotate service.SalesOrderHeader with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Email}',
                Value : Email,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>FirstName}',
                Value : FirstName,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>LastName}',
                Value : LastName,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>DeliveryDate}',
                Value : DeliveryDate,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Country}',
                Value : Country,
            },
            {
                $Type       : 'UI.DataField',
                Label       : '{i18n>OrderStatus}',
                Value       : OrderStatus,
                Criticality : OrderStatus
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>DeliveryDate}',
                Value : DeliveryDate,
            },
        ]
    },
    UI.Facets                      : [
        {
            $Type  : 'UI.ReferenceFacet',
            ID     : 'SalesOrder',
            Label  : '{i18n>General_Information}',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        { // list

            $Type  : 'UI.ReferenceFacet',
            ID     : 'dsadfsadfs',
            Label  : '{i18n>Detail_Information}',
            Target : 'to_Items/@UI.LineItem',
        }
    ],
);

annotate CatalogService.SalesOrderItem with @UI : {
    Identification : [{Value : to_Header.Email}],
    HeaderInfo     : {
        TypeName       : '{i18n>SalesOrderItem}',
        TypeNamePlural : '{i18n>SalesOrderItems}',
        Title          : {Value : Name},
    /*         Description    : {
                $Type : 'UI.DataField',
                Value : ID
            } */
    },

    LineItem       : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Item_ID}',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Name}',
            Value : Name,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Description}',
            Value : Description,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>ReleaseDate}',
            Value : ReleaseDate,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>DiscontinuedDate}',
            Value : DiscontinuedDate,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Price}',
            Value : Price,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Currency}',
            Value : Currency,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Height}',
            Value : Height,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Width}',
            Value : Width,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Depth}',
            Value : Depth,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>DimensionUnits}',
            Value : DimensionUnits,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Quantity}',
            Value : Quantity,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>UnitOfMeasures}',
            Value : UnitOfMeasures,
        },
    ]
};

annotate CatalogService.SalesOrderItem with @(

    UI.FieldGroup #GeneratedGroup2 : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>ID}',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Name}',
                Value : Name,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Description}',
                Value : Description,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>ReleaseDate}',
                Value : ReleaseDate,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>DiscontinuedDate}',
                Value : DiscontinuedDate,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Price}',
                Value : Price,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Currency}',
                Value : Currency,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Height}',
                Value : Height,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Width}',
                Value : Width,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Depth}',
                Value : Depth,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>DimensionUnits}',
                Value : DimensionUnits,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Quantity}',
                Value : Quantity,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>UnitOfMeasures}',
                Value : UnitOfMeasures,
            },
        ]
    },
    UI.Facets                      : [{
        $Type  : 'UI.ReferenceFacet',
        ID     : 'SalesOrderItems',
        Label  : '{i18n>SalesOrderItemDetail}',
        Target : '@UI.FieldGroup#GeneratedGroup2',
    }, ],
);
