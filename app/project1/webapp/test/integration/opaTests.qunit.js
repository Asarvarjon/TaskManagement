sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'project1/test/integration/FirstJourney',
		'project1/test/integration/pages/TasksList',
		'project1/test/integration/pages/TasksObjectPage'
    ],
    function(JourneyRunner, opaJourney, TasksList, TasksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('project1') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheTasksList: TasksList,
					onTheTasksObjectPage: TasksObjectPage
                }
            },
            opaJourney.run
        );
    }
);