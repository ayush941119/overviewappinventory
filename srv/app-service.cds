using aldi.appinventory as appinventory from '../db/app-data-model';

@requires: 'authenticated-user'
service AppInventoryService {
    entity App as projection on appinventory.App;
}