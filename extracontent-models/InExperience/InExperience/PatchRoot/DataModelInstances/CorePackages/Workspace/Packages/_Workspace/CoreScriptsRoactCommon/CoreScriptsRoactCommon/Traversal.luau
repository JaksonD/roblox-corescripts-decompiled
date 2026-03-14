local v0 = require(script.Constants);
local v1 = require(script.Flags);
local v2 = require(script.TraversalExperienceCard);
local v3 = require(script.HistoryMenu);
local v4 = require(script.HistoryPage);
local v5 = require(script.LocalTraversalHistory);
local v6 = require(script.TeleportBackButton);
local v7 = require(script.TeleportLeaveConfirmation);
local v8 = require(script.TraversalTelemetry);
local v9 = require(script.Parent.Hooks.useHistoryItems);
return {
    Constants = v0, 
    Flags = v1, 
    TraversalExperienceCard = v2, 
    HistoryMenu = v3, 
    HistoryPage = v4, 
    LocalTraversalHistory = v5, 
    TraversalTelemetry = v8, 
    TeleportBackButton = v6, 
    TeleportLeaveConfirmation = v7, 
    useHistoryItems = v9
};