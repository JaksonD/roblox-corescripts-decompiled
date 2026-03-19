local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserList");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UserProfiles);
local l_useEffect_0 = v2.useEffect;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_UserProfileStore_0 = v3.Stores.UserProfileStore;
local l_PresenceType_0 = require(l_script_FirstAncestor_0.Rodux.RoduxPresence).Enums.PresenceType;
local l_RODUX_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RODUX_KEY;
local l_getDeepValue_0 = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue;
local l_UserPresence_0 = require(l_Parent_0.Foundation).Enums.UserPresence;
local v11 = game:DefineFastFlag("UserProfileStoreDataFetchFix", false);
local v12 = require(script.Parent.UserRow);
return function(v13) --[[ Line: 27 ]] --[[ Name: UserRowWrapper ]]
    -- upvalues: v2 (copy), l_useEffect_0 (copy), l_UserProfileStore_0 (copy), v11 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), l_RODUX_KEY_0 (copy), l_PresenceType_0 (copy), l_UserPresence_0 (copy), v12 (copy)
    local v14 = v2.useCallback(function() --[[ Line: 28 ]]
        -- upvalues: v13 (copy)
        v13.onActivated(v13.userId);
    end, {
        v13.onActivated, 
        v13.userId
    });
    local v15, v16 = v2.useState("");
    local v17, v18 = v2.useState("");
    l_useEffect_0(function() --[[ Line: 35 ]]
        -- upvalues: l_UserProfileStore_0 (ref), v13 (copy), v11 (ref), v16 (copy), v18 (copy)
        l_UserProfileStore_0.get().fetchNamesByUserIds({
            (tostring(v13.userId))
        }, function(v19) --[[ Line: 36 ]]
            -- upvalues: v11 (ref), v16 (ref), v18 (ref)
            if v11 then
                local l_status_0 = v19.status;
                local l_data_0 = v19.data;
                if l_status_0 == "success" and #l_data_0 > 0 and l_data_0[1] and l_data_0[1].names then
                    local v22 = l_data_0[1].names.getCombinedName(false);
                    local v23 = l_data_0[1].names.getUsername(false);
                    v16(v22);
                    v18(v23);
                    return;
                end;
            else
                local l_status_1 = v19.status;
                local l_data_1 = v19.data;
                if l_status_1 == "success" then
                    local v26 = l_data_1[1].names.getCombinedName(false);
                    local v27 = l_data_1[1].names.getUsername(false);
                    v16(v26);
                    v18(v27);
                end;
            end;
        end);
    end, {
        v13.userId
    });
    local v29 = l_useSelector_0(function(v28) --[[ Line: 57 ]]
        -- upvalues: l_getDeepValue_0 (ref), l_RODUX_KEY_0 (ref), v13 (copy)
        return l_getDeepValue_0(v28, string.format("%s.Presence.byUserId.%s", l_RODUX_KEY_0, v13.userId)) or {};
    end);
    local v30 = true;
    if v29.userPresenceType ~= l_PresenceType_0.Online then
        v30 = true;
        if v29.userPresenceType ~= l_PresenceType_0.InStudio then
            v30 = v29.userPresenceType == l_PresenceType_0.InGame;
        end;
    end;
    local v31 = if v30 then l_UserPresence_0.Active else l_UserPresence_0.None;
    return v2.createElement(v12, {
        userId = v13.userId, 
        userPresence = v31, 
        displayName = v15, 
        username = v17, 
        onActivated = v14
    });
end;