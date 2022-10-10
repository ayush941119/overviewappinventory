sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/json/JSONModel",
    "sap/ui/model/Filter",
    "sap/ui/model/FilterOperator"
],
    function (Controller, JSONModel, Filter, FilterOperator) {
        "use strict";

        return Controller.extend("appinvfreestyle.controller.AppInventoryList", {
            onInit: function () {
                this.getView().setModel(new JSONModel({
                    search: "",
                    appTypes: [],
                    pillars: [],
                    regions: [],
                    tableTitle: ""
                }), "appInventoryListView");
            },

            onSearch: async function (oEvent) {
                const oModel = this.getView().getModel("appInventoryListView");
                const oBinding = this.getView().byId("appInventoryTable").getBinding("items");
                const aFilters = [];

                // Search
                const vSearch = oModel.getProperty("/search");
                if (vSearch !== "") {
                    const aSearchOnProperties = ["appId", "appName", "itService", "assignedGroup"];
                    const aSearchFilter = await this._getBasicSearchFilter(aSearchOnProperties, vSearch);
                    aFilters.push(
                        new Filter({
                            filters: aSearchFilter
                        })
                    );
                }

                // App Types
                const aAppTypes = oModel.getProperty("/appTypes");
                if (aAppTypes.length > 0) {
                    const aAppTypeFilter = await this._getSelectionFilter("appType/ID", aAppTypes);
                    aFilters.push(new Filter(aAppTypeFilter, false));
                }

                // Pillars
                const aPillars = oModel.getProperty("/pillars");
                if (aPillars.length > 0) {
                    const aPillarFilter = await this._getSelectionFilter("pillar/ID", aPillars);
                    aFilters.push(new Filter(aPillarFilter, false));
                }

                // Pillars
                const aRegions = oModel.getProperty("/regions");
                if (aRegions.length > 0) {
                    const aRegionFilter = await this._getSelectionFilter("region/ID", aRegions);
                    aFilters.push(new Filter(aRegionFilter, false));
                }

                oBinding.filter(aFilters);
                oBinding.refresh();
            },

            _getBasicSearchFilter: async function (aProperties, vSearch) {
                const aSearchFilter = [];
                await Promise.all(
                    aProperties.map(async (vProperty) => {
                        aSearchFilter.push(
                            new Filter({
                                path: vProperty,
                                operator: FilterOperator.Contains,
                                value1: vSearch,
                                caseSensitive: false
                            })
                        );
                    })
                );
                return aSearchFilter;
            },

            _getSelectionFilter: async function (vPath, aValues) {
                const aSelectedItemFilter = [];
                await Promise.all(
                    aValues.map(async (vValue) => {
                        aSelectedItemFilter.push(new Filter(vPath, FilterOperator.EQ, vValue));
                    })
                );
                return aSelectedItemFilter;
            },

            onUpdateFinished: function (oEvent) {
                this.getView().getModel("appInventoryListView")
                    .setProperty("/tableTitle",
                        this.getOwnerComponent().getModel("i18n").getResourceBundle().getText("tableTitleCount",
                            [oEvent.getParameter("total")]));
            }
        });
    });
