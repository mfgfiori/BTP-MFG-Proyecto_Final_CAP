sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'logaligroup/salesorder/test/integration/FirstJourney',
		'logaligroup/salesorder/test/integration/pages/SalesOrderHeaderList',
		'logaligroup/salesorder/test/integration/pages/SalesOrderHeaderObjectPage',
		'logaligroup/salesorder/test/integration/pages/SalesOrderItemObjectPage'
    ],
    function(JourneyRunner, opaJourney, SalesOrderHeaderList, SalesOrderHeaderObjectPage, SalesOrderItemObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('logaligroup/salesorder') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheSalesOrderHeaderList: SalesOrderHeaderList,
					onTheSalesOrderHeaderObjectPage: SalesOrderHeaderObjectPage,
					onTheSalesOrderItemObjectPage: SalesOrderItemObjectPage
                }
            },
            opaJourney.run
        );
    }
);