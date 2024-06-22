sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'shahezad/app/purchaseorder/test/integration/FirstJourney',
		'shahezad/app/purchaseorder/test/integration/pages/POsList',
		'shahezad/app/purchaseorder/test/integration/pages/POsObjectPage',
		'shahezad/app/purchaseorder/test/integration/pages/PoItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, POsList, POsObjectPage, PoItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('shahezad/app/purchaseorder') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePOsList: POsList,
					onThePOsObjectPage: POsObjectPage,
					onThePoItemsObjectPage: PoItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);