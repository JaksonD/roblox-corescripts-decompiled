local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserList");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v4 = require(l_script_FirstAncestor_0.Rodux.RoduxPresence);
local v5 = require(l_Parent_0.SocialCommon);
local l_convertUserPresenceTypeToString_0 = v5.Utils.convertUserPresenceTypeToString;
local l_convertToFoundationPresenceEnum_0 = v5.Utils.convertToFoundationPresenceEnum;
local v8 = require(l_Parent_0.Foundation);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_PresenceType_0 = v4.Enums.PresenceType;
return function(v11) --[[ Line: 17 ]] --[[ Name: useFoundationPresence ]]
    -- upvalues: v2 (copy), v8 (copy), l_useSelector_0 (copy), v4 (copy), l_PresenceType_0 (copy), l_convertUserPresenceTypeToString_0 (copy), l_convertToFoundationPresenceEnum_0 (copy)
    local v12, v13 = v2.useState(v8.Enums.UserPresence.None);
    local v15 = l_useSelector_0(function(v14) --[[ Line: 20 ]]
        -- upvalues: v11 (copy), v4 (ref)
        if not v11 or v11 == "" then
            return nil;
        else
            return v4.Selectors.getUserPresenceByUserId(v14, v11);
        end;
    end);
    v2.useEffect(function() --[[ Line: 27 ]]
        -- upvalues: l_PresenceType_0 (ref), v15 (copy), l_convertUserPresenceTypeToString_0 (ref), l_convertToFoundationPresenceEnum_0 (ref), v13 (copy)
        local l_Offline_0 = l_PresenceType_0.Offline;
        if v15 then
            l_Offline_0 = v15.userPresenceType;
        end;
        local v17 = l_convertUserPresenceTypeToString_0(l_Offline_0);
        local v18 = l_convertToFoundationPresenceEnum_0(v17);
        v13(v18);
    end, {
        v15
    });
    return v12;
end;