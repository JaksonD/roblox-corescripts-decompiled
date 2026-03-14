local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v4 = require(l_script_FirstAncestor_0.EnumScreens);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v6 = require(script.Parent.TrustedConnectionsUpsellContainer);
return function(_) --[[ Line: 13 ]]
    -- upvalues: l_useNavigation_0 (copy), v2 (copy), v4 (copy), v3 (copy), v6 (copy)
    local v8 = l_useNavigation_0();
    local v9 = v8 and v8.getParam("conversationId", nil);
    local v10 = v8 and v8.getParam("modalVariant", nil);
    local v11 = v2.useCallback(function() --[[ Line: 17 ]]
        -- upvalues: v8 (copy), v4 (ref)
        if v8 and v8.state.routeName == v4.TrustedConnectionsUpsell then
            v8.goBack(v8.state.key);
        end;
    end, {
        v8
    });
    if not v10 or not v9 then
        v3:error("TrustedConnectionsUpsellScreen: Missing required parameters", {
            conversationId = v9, 
            modalVariant = v10
        });
        v8.goBack();
        return nil;
    else
        return v2.createElement(v6, {
            conversationId = v9, 
            dismissModal = v11, 
            modalVariant = v10
        });
    end;
end;