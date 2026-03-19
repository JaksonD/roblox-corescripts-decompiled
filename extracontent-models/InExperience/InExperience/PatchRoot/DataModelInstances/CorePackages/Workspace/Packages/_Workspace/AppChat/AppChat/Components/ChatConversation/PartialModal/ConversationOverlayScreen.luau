local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.EnumScreens);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v5 = require(script.Parent.ConversationOverlayContainer);
return function(_) --[[ Line: 17 ]]
    -- upvalues: l_useNavigation_0 (copy), v2 (copy), v3 (copy), v5 (copy)
    local v7 = l_useNavigation_0();
    local v8 = v7 and v7.getParam("conversationId", nil);
    local v9 = v2.useCallback(function() --[[ Line: 20 ]]
        -- upvalues: v7 (copy), v3 (ref)
        if v7 and v7.state.routeName == v3.ConversationOverlay then
            v7.goBack(v7.state.key);
        end;
    end, {
        v7
    });
    return v2.createElement(v5, {
        conversationId = v8, 
        dismissModal = v9
    });
end;