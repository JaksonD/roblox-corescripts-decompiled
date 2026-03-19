local l_Parent_0 = script.Parent.Parent;
local l_Players_0 = game:GetService("Players");
local v2 = require(l_Parent_0.Analytics.AnalyticsService);
local v3 = require(l_Parent_0.Constants);
local v4 = require(l_Parent_0.Utils.getLocalUserId);
return (require(l_Parent_0.Analytics.setupFireEvent)({
    analytics = v2, 
    infoForAllEvents = {
        isUnder13 = if l_Players_0.LocalPlayer then l_Players_0.LocalPlayer:GetUnder13() else nil, 
        pid = tostring(game.PlaceId), 
        source = v3.AnalyticsSource, 
        uid = v4(l_Players_0)
    }
}));