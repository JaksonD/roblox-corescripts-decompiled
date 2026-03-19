local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v4 = require(l_script_FirstAncestor_0.Actions.ThirdPartyChatSettingsLoaded);
return function() --[[ Line: 7 ]] --[[ Name: AppChatRemoveThirdPartyRestriction ]]
    -- upvalues: l_useDispatch_0 (copy), v2 (copy), v4 (copy)
    local v5 = l_useDispatch_0();
    v2.useEffect(function() --[[ Line: 9 ]]
        -- upvalues: v5 (copy), v4 (ref)
        if v5 then
            v5(v4(Enum.ChatRestrictionStatus.NotRestricted));
        end;
    end, {
        v5
    });
    return nil;
end;