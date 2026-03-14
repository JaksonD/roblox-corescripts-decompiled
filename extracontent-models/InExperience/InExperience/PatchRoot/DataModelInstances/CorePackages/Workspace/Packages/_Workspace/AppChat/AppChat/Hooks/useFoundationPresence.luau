local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local _ = require(l_script_FirstAncestor_0.types);
local v6 = require(l_script_FirstAncestor_0.Http.RoduxPresence);
local v7 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatTreatInExperienceAsOnline);
local l_PresenceType_0 = v6.Enums.PresenceType;
local v9 = {
    [l_PresenceType_0.InGame] = "InExperience", 
    [l_PresenceType_0.Online] = "Active", 
    [l_PresenceType_0.InStudio] = "InExperience", 
    [l_PresenceType_0.Offline] = "None", 
    [l_PresenceType_0.Invisible] = "None"
};
local v10 = {
    [l_PresenceType_0.InGame] = "Active", 
    [l_PresenceType_0.Online] = "Active", 
    [l_PresenceType_0.InStudio] = "Active", 
    [l_PresenceType_0.Offline] = "None", 
    [l_PresenceType_0.Invisible] = "None"
};
local v11 = {
    [l_PresenceType_0.InGame] = "ingameStatusLabel", 
    [l_PresenceType_0.Online] = "onlinePresenceText", 
    [l_PresenceType_0.InStudio] = "studioStatusLabel", 
    [l_PresenceType_0.Offline] = "offlinePresenceText", 
    [l_PresenceType_0.Invisible] = "offlinePresenceText"
};
local v12 = {
    offlinePresenceText = "Common.Presence.Label.Offline", 
    onlinePresenceText = "Common.Presence.Label.Online", 
    studioStatusLabel = "Common.Presence.Label.RobloxStudio", 
    ingameStatusLabel = "Common.Presence.Label.InExperience"
};
return function(v13) --[[ Line: 53 ]] --[[ Name: useFoundationPresence ]]
    -- upvalues: l_useLocalization_0 (copy), v12 (copy), v2 (copy), l_useSelector_0 (copy), v6 (copy), l_PresenceType_0 (copy), v11 (copy), v7 (copy), v10 (copy), v9 (copy)
    local v14 = l_useLocalization_0(v12);
    local v15, v16 = v2.useBinding(v14.offlinePresenceText);
    local v17, v18 = v2.useState("None");
    local v20 = l_useSelector_0(function(v19) --[[ Line: 59 ]]
        -- upvalues: v13 (copy), v6 (ref)
        if not v13 or v13 == "" then
            return nil;
        else
            return v6.Selectors.getUserPresenceByUserId(v19, v13);
        end;
    end);
    v2.useEffect(function() --[[ Line: 66 ]]
        -- upvalues: v14 (copy), l_PresenceType_0 (ref), v20 (copy), v11 (ref), v7 (ref), v10 (ref), v9 (ref), v18 (copy), v16 (copy)
        local l_offlinePresenceText_0 = v14.offlinePresenceText;
        local l_Offline_0 = l_PresenceType_0.Offline;
        if v20 then
            l_Offline_0 = v20.userPresenceType;
            local l_lastLocation_0 = v20.lastLocation;
            l_offlinePresenceText_0 = v14[v11[l_Offline_0]];
            if l_Offline_0 == l_PresenceType_0.InGame and l_lastLocation_0 and l_lastLocation_0 ~= "" then
                l_offlinePresenceText_0 = l_lastLocation_0;
            end;
        end;
        local v24 = if v7() then v10 else v9;
        v18(v24[l_Offline_0] or "None");
        v16(l_offlinePresenceText_0);
    end, {
        v20, 
        v14
    });
    return v2.useMemo(function() --[[ Line: 88 ]]
        -- upvalues: v17 (copy), v15 (copy)
        return {
            presence = v17, 
            presenceText = v15
        };
    end, {
        v17, 
        v15
    });
end;