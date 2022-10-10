annotate AppInventoryService.App with {
    appId         @(title : 'App ID');
    appName       @(title : 'App Name');
    appType       @(title : 'App Type');
    pillar        @(title : 'Pillar');
    itService     @(title : 'IT Service');
    assignedGroup @(title : 'Assigned Group');
    region        @(title : 'Region');
}

annotate AppInventoryService.AppType with {
    ID   @(Common : {
        Text            : name,
        TextArrangement : #TextOnly
    });
    name @(title : 'App Type');
}

annotate AppInventoryService.Pillar with {
    ID   @(Common : {
        Text            : name,
        TextArrangement : #TextOnly
    });
    name @(title : 'Pillar');
}

annotate AppInventoryService.Region with {
    ID   @(Common : {
        Text            : name,
        TextArrangement : #TextOnly
    });
    name @(title : 'Region');
}

annotate AppInventoryService.App with {
    appType @(Common : {
        Text            : name,
        TextArrangement : #TextOnly,
        ValueListWithFixedValues : true,
        ValueList                : {
            $Type          : 'Common.ValueListType',
            CollectionPath : 'AppType',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : 'appType_ID',
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                }
            ],
            Label          : 'App Types'
        }
    });
    region @(Common : {
        Text            : name,
        TextArrangement : #TextOnly,
        ValueListWithFixedValues : true,
        ValueList                : {
            $Type          : 'Common.ValueListType',
            CollectionPath : 'Region',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : 'region_ID',
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                }
            ],
            Label          : 'Regions'
        }
    });
    pillar @(Common : {
        Text            : name,
        TextArrangement : #TextOnly,
        ValueListWithFixedValues : true,
        ValueList                : {
            $Type          : 'Common.ValueListType',
            CollectionPath : 'Pillar',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : 'pillar_ID',
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                }
            ],
            Label          : 'Pillars'
        }
    })
};

annotate AppInventoryService.App with @(UI : {
    LineItem        : [
        {
            $Type             : 'UI.DataField',
            Value             : appId,
            ![@UI.Importance] : #High
        },
        {
            $Type             : 'UI.DataField',
            Value             : appName,
            ![@UI.Importance] : #High
        },
        {
            $Type             : 'UI.DataField',
            Value             : pillar.name,
            ![@UI.Importance] : #High
        },
        {
            $Type : 'UI.DataField',
            Value : itService
        },
        {
            $Type             : 'UI.DataField',
            Value             : appType.name,
            ![@UI.Importance] : #High
        },
        {
            $Type : 'UI.DataField',
            Value : assignedGroup
        }
    ],
    SelectionFields : [
        appType_ID,
        pillar_ID,
        region_ID
    ],
    HeaderInfo : {
        TypeName : 'App',
        TypeNamePlural : 'Apps'
    }
});
