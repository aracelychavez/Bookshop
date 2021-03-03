using CatalogService as service from '../srv/cat-service';

annotate service.Books with @(
    UI : { 
        SelectionFields  : [
            title
        ],
        LineItem  : [
            { Value : ID },
            { Value : title },
            { Value : author }, 
            { Value : stock }                                   
        ],
     }
){
    ID @( title: 'ID' );    
    title @( title: 'Title' );
    author @( title: 'Author' );
    stock @( title: 'Stock' );
};

using {
    cuid
} from '@sap/cds/common';

annotate cuid with {
    ID @(
        UI.HiddenFilter,
        Core.Computed
    );
}

annotate service.Orders with @(
    UI: {
        SelectionFields  : [
            ID
        ],
        LineItem  : [
            {Value:ID, Label : 'ID',},
            {Value:book_ID, Label : 'Book ID',},
            {Value:amount, Label : 'Amount',}
        ],
    },

    // Page Header
    UI        : {
        HeaderInfo                     : {
            TypeName       : 'Header',
            TypeNamePlural : 'Headers',
            Title          : {Value : ID},
        },
        HeaderFacets                   : [
        {
            $Type             : 'UI.ReferenceFacet',
            Target            : '@UI.FieldGroup#Description',
            ![@UI.Importance] : #Medium
        },
        {
            $Type             : 'UI.ReferenceFacet',
            Target            : '@UI.FieldGroup#AdministrativeData',
            ![@UI.Importance] : #Medium
        }
        ],
        FieldGroup #Description        : {Data : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID'
        }
        ]},
        FieldGroup #Details            : {Data : [
        {
            $Type : 'UI.DataField',
            Value : book_ID,
            Label : 'Book ID',
        },
        {
            $Type : 'UI.DataField',
            Value : amount,
            Label : 'Amount'
        },
        ]},
        FieldGroup #AdministrativeData : {Data : [
        {
            $Type : 'UI.DataField',
            Value : createdBy
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt
        },
        {
            $Type : 'UI.DataField',
            Value : modifiedBy
        },
        {
            $Type : 'UI.DataField',
            Value : modifiedAt
        }
        ],
        }
    },
      // Page Facets
    UI.Facets : [
    {
        $Type  : 'UI.CollectionFacet',
        ID     : 'ORDetails',
        Label  : 'Details1',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : 'Details2',
            Target : '@UI.FieldGroup#Details'
        }],
    }
    ]
);
