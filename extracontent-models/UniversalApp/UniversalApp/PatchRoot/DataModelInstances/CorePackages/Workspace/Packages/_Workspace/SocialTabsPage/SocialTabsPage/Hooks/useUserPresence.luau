local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTabsPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_convertUserPresenceTypeToString_0 = require(l_Parent_0.SocialCommon).Utils.convertUserPresenceTypeToString;
local v4 = require(l_script_FirstAncestor_0.Rodux.RoduxPresence);
local l_PresenceType_0 = v4.Enums.PresenceType;
return function(v6) --[[ Line: 14 ]] --[[ Name: useUserPresence ]]
    -- upvalues: l_useSelector_0 (copy), v4 (copy), l_PresenceType_0 (copy), l_convertUserPresenceTypeToString_0 (copy)
    local v8 = l_useSelector_0(function(v7) --[[ Line: 15 ]]
        -- upvalues: v6 (copy), v4 (ref)
        if not v6 or v6 == "" then
            return nil;
        else
            return v4.Selectors.getUserPresenceByUserId(v7, v6);
        end;
    end);
    local v9 = if v8 then v8.userPresenceType else l_PresenceType_0.Offline;
    return (l_convertUserPresenceTypeToString_0(v9));
end;