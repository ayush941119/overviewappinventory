sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'appinvfe/test/integration/FirstJourney',
		'appinvfe/test/integration/pages/AppList',
		'appinvfe/test/integration/pages/AppObjectPage'
    ],
    function(JourneyRunner, opaJourney, AppList, AppObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('appinvfe') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheAppList: AppList,
					onTheAppObjectPage: AppObjectPage
                }
            },
            opaJourney.run
        );
    }
);