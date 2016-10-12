# MaintenanceModeTool
Maintenance mode tool for System Center Operations Manager


The solution consists of two components, a small .Net application to place on the servers, and a management pack for OpsMgr. It requires no permissions for the end user in OpsMgr, but it does requires .Net 3.0 or higher to be installed on the servers for the application to work.

The application opens a little form with two fields, first is the end time for the maintenance mode (default it sets +30 min from current datetime), and second is a comment field that will be added to the maintenance mode comment field in OpsMgr.

The management pack then contains a event collection rule, CloudMechanic Collect Maintenance Mode Events, that will pick up these events.
It also contains a Event View for these events so you can easily get a overview of them.
A second rule, CloudMechanic MaintenanceMode Tool Trigger, runs on a schedule every 240 second and will execute a PowerShell script that will set the maintenance mode for the computer based on the comment entered in the application and the username which did it.

For more information see [CloudMechanic.net](https://cloudmechanic.net/2016/10/12/maintenance-mode-desktop-shortcut/)
