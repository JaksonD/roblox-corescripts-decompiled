local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.React);
local l_useCallback_0 = v2.useCallback;
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local v5 = require(script.Parent.LearnMorePartialModalContainer);
local v6 = require(script.Parent.Logger);
local v7 = {};
return function(v8) --[[ Line: 18 ]] --[[ Name: LearnMorePartialModalScreen ]]
    -- upvalues: v1 (copy), v7 (copy), l_useEffectOnMount_0 (copy), v6 (copy), l_useCallback_0 (copy), v2 (copy), v5 (copy)
    local l_navigation_0 = v1.Dictionary.union(v7, v8).navigation;
    assert(type(l_navigation_0) ~= "nil", "LearnMorePartialModalScreen should be wrapped with React Navigation");
    local v10 = l_navigation_0 and l_navigation_0.getParam and l_navigation_0.getParam("conversationId", nil);
    l_useEffectOnMount_0(function() --[[ Line: 24 ]]
        -- upvalues: v6 (ref)
        v6:info("LearnMorePartialModalScreen mounted");
    end);
    local v11 = l_useCallback_0(function() --[[ Line: 28 ]]
        -- upvalues: l_navigation_0 (copy)
        l_navigation_0.goBack();
    end, {
        l_navigation_0
    });
    return v2.createElement(v5, {
        conversationId = v10, 
        onDismissed = v11
    });
end;