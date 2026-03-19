local l_Players_0 = game:GetService("Players");
local l_Stats_0 = game:GetService("Stats");
local v2 = {};
v2.__index = v2;
v2.EventName = {
    MenuOpened = "emoteMenuOpened", 
    EmotePlayed = "emoteTriggered", 
    EmoteFailed = "emoteTriggerFailed"
};
v2.new = function() --[[ Line: 13 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v3 = {
        eventStreamImpl = nil
    };
    setmetatable(v3, v2);
    return v3;
end;
v2.withEventStream = function(v4, v5) --[[ Line: 22 ]] --[[ Name: withEventStream ]]
    v4.eventStreamImpl = v5;
    return v4;
end;
v2.onMenuOpened = function(v6) --[[ Line: 27 ]] --[[ Name: onMenuOpened ]]
    -- upvalues: l_Players_0 (copy), l_Stats_0 (copy)
    local l_MenuOpened_0 = v6.EventName.MenuOpened;
    local v8 = {
        pid = tostring(game.PlaceId), 
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        btid = l_Stats_0:GetBrowserTrackerId()
    };
    v6:_getEventStream():setRBXEventStream("emoteMenu", l_MenuOpened_0, v8);
end;
v2.onEmotePlayed = function(v9, v10, v11) --[[ Line: 40 ]] --[[ Name: onEmotePlayed ]]
    -- upvalues: l_Players_0 (copy), l_Stats_0 (copy)
    local l_EmotePlayed_0 = v9.EventName.EmotePlayed;
    local v13 = {
        pid = tostring(game.PlaceId), 
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        btid = l_Stats_0:GetBrowserTrackerId(), 
        slotNumber = v10, 
        assetID = v11
    };
    v9:_getEventStream():setRBXEventStream("emoteMenu", l_EmotePlayed_0, v13);
end;
v2.onEmoteFailed = function(v14, v15, v16, v17) --[[ Line: 55 ]] --[[ Name: onEmoteFailed ]]
    -- upvalues: l_Players_0 (copy), l_Stats_0 (copy)
    local l_EmoteFailed_0 = v14.EventName.EmoteFailed;
    local v19 = {
        pid = tostring(game.PlaceId), 
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        btid = l_Stats_0:GetBrowserTrackerId(), 
        slotNumber = v15, 
        assetID = v16, 
        errorType = v17, 
        invokedByCoreGui = true
    };
    v14:_getEventStream():setRBXEventStream("emoteMenu", l_EmoteFailed_0, v19);
end;
v2._getEventStream = function(v20) --[[ Line: 72 ]] --[[ Name: _getEventStream ]]
    assert(v20.eventStreamImpl, "EventStream implementation not found. Did you forget to construct withEventStream?");
    return v20.eventStreamImpl;
end;
return v2;