local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_PresenceType_0 = require(l_script_FirstAncestor_0.Http.RoduxPresence).Enums.PresenceType;
local v3 = require(l_Parent_0.UIBlox).App.ImageSet.Images["component_assets/circle_25"];
local v4 = {
    [l_PresenceType_0.Offline] = "Common.Presence.Label.Offline", 
    [l_PresenceType_0.Online] = "Common.Presence.Label.Online", 
    [l_PresenceType_0.InGame] = "", 
    [l_PresenceType_0.InStudio] = ""
};
local v5 = {
    [l_PresenceType_0.Offline] = "", 
    [l_PresenceType_0.Online] = v3, 
    [l_PresenceType_0.InGame] = v3, 
    [l_PresenceType_0.InStudio] = v3
};
return {
    getUserDisplayPresence = function(v6, v7) --[[ Line: 41 ]]
        -- upvalues: v4 (copy), l_PresenceType_0 (copy), v5 (copy)
        local v8 = false;
        if not v6 then
            return {
                text = ""
            };
        else
            local v9, v10, v11;
            if v7 then
                v9 = {
                    text = v4[l_PresenceType_0.Online], 
                    image = v5[l_PresenceType_0.Online]
                };
                v8 = v9;
            end;
            if not v8 then
                v9 = {};
                v10 = v6.userPresenceType;
                v11 = v6.lastLocation;
                v9.text = if v10 == l_PresenceType_0.Offline then v4[l_PresenceType_0.Offline] else if v10 == l_PresenceType_0.Online then v4[l_PresenceType_0.Online] else if not (v10 ~= l_PresenceType_0.InGame) or v10 == l_PresenceType_0.InStudio then if v11 then tostring(v11) else v4[l_PresenceType_0.Online] else "";
                v9.image = v5[v6.userPresenceType];
            end;
            v8 = false;
            return v9;
        end;
    end, 
    getUserPresenceText = function(v12) --[[ Line: 22 ]]
        -- upvalues: l_PresenceType_0 (copy), v4 (copy)
        local l_userPresenceType_0 = v12.userPresenceType;
        local l_lastLocation_0 = v12.lastLocation;
        if l_userPresenceType_0 == l_PresenceType_0.Offline then
            return v4[l_PresenceType_0.Offline];
        elseif l_userPresenceType_0 == l_PresenceType_0.Online then
            return v4[l_PresenceType_0.Online];
        elseif l_userPresenceType_0 == l_PresenceType_0.InGame or l_userPresenceType_0 == l_PresenceType_0.InStudio then
            if l_lastLocation_0 then
                return (tostring(l_lastLocation_0));
            else
                return v4[l_PresenceType_0.Online];
            end;
        else
            return "";
        end;
    end, 
    userPresenceImage = v5, 
    userPresenceText = v4
};