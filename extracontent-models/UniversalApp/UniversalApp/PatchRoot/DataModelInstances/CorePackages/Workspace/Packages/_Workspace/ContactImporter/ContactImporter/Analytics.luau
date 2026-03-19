local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactImporter");
local l_Context_0 = require(l_script_FirstAncestor_0.dependencies).SocialLibraries.Context;
local v2 = require(script.ContactImporterAnalyticsContext);
return {
    setupFireAnalyticsEvents = require(script.setupFireAnalyticsEvents), 
    Context = v2, 
    connect = l_Context_0.getConnect(v2), 
    useAnalytics = require(script.useAnalytics), 
    EventNames = require(script.Enums.EventNames), 
    EntryPoints = require(script.Enums.ContactImporterEntryPoints), 
    FieldNames = require(script.FieldNames), 
    AnalyticsService = require(script.AnalyticsService)
};