local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppRemoveSponsoredReportHiddenState;
return {
    GameTileLayoutType = {
        Narrow = "Narrow", 
        Wide = "Wide", 
        Event = "Event"
    }, 
    HiddenTileType = if l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 then nil else {
        NotInterested = "NotInterested", 
        Reported = "Reported"
    }
};