local v0 = require(script.PeekViewState);
local v1 = require(script.PeekView);
local v2 = require(script.PeekViewWithTopBar);
local v3 = require(script.analytics.peekViewDismissedEvent);
local v4 = require(script.Scrim);
return {
    analytics = {
        peekViewDismissedEvent = v3
    }, 
    ["jest.config"] = script["jest.config"], 
    PeekViewState = v0, 
    PeekView = v1, 
    PeekViewWithTopBar = v2, 
    Scrim = v4
};