namespace aldi.appinventory;

using {
    managed,
    cuid
} from '@sap/cds/common';

@readonly
entity App : managed {
    key appId         : String;
        appName       : String;
        appType       : Association to one AppType;
        pillar        : Association to Pillar;
        itService     : String;
        assignedGroup : String;
        region        : Association to Region;
}

@cds.autoexpose
@cds.odata.valuelist
entity Pillar : cuid {
    name : localized String;
}

@cds.autoexpose
entity AppType : cuid {
    name : localized String;
}

@cds.autoexpose
@cds.odata.valuelist
entity Region : cuid {
    name : localized String;
}
