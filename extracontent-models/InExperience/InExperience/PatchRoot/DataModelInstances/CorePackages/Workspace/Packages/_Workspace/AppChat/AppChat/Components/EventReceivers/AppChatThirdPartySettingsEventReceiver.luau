local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useProperty_0 = require(l_Parent_0.GuiObjectUtils).useProperty;
local v5 = require(l_script_FirstAncestor_0.Actions.ThirdPartyChatSettingsLoaded);
local l_ThirdPartyUserService_0 = game:GetService("ThirdPartyUserService");
return function() --[[ Line: 9 ]] --[[ Name: AppChatThirdPartySettingsEventReceiver ]]
    -- upvalues: l_useDispatch_0 (copy), l_useProperty_0 (copy), l_ThirdPartyUserService_0 (copy), v2 (copy), v5 (copy)
    local v7 = l_useDispatch_0();
    local v8 = l_useProperty_0(l_ThirdPartyUserService_0, "FriendCommunicationRestrictionStatus");
    v2.useEffect(function() --[[ Line: 12 ]]
        -- upvalues: v7 (copy), v8 (copy), v5 (ref)
        if v7 and v8 then
            v7(v5(v8));
        end;
    end, {
        v7, 
        v8
    });
    return nil;
end;