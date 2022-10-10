using AppInventoryService as service from '../../srv/app-service';

annotate service.App with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : appId,
            },
            {
                $Type : 'UI.DataField',
                Value : appName,
            },
            {
                $Type : 'UI.DataField',
                Value : itService,
            },
            {
                $Type : 'UI.DataField',
                Value : assignedGroup,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);
