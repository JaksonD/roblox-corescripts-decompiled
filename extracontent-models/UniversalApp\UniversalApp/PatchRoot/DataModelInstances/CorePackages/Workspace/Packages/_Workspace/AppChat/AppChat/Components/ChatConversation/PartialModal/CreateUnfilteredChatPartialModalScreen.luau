local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_script_FirstAncestor_0.EnumScreens);
local v4 = require(l_Parent_0.React);
local l_useCallback_0 = v4.useCallback;
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local v7 = require(script.Parent.CreateUnfilteredChatPartialModalContainer);
local v8 = require(script.Parent.Logger);
local v9 = {};
return function(v10) --[[ Line: 19 ]] --[[ Name: CreateUnfilteredChatPartialModalScreen ]]
    -- upvalues: v2 (copy), v9 (copy), l_useEffectOnMount_0 (copy), v8 (copy), l_useCallback_0 (copy), v3 (copy), v4 (copy), v7 (copy)
    local v11 = v2.Dictionary.union(v9, v10);
    local l_navigation_0 = v11.navigation;
    assert(type(l_navigation_0) ~= "nil", "CreateUnfilteredChatPartialModalScreen should be wrapped with React Navigation");
    local v13 = l_navigation_0 and l_navigation_0.getParam and l_navigation_0.getParam("conversationId", nil);
    l_useEffectOnMount_0(function() --[[ Line: 25 ]]
        -- upvalues: v8 (ref)
        v8:info("LearnMorePartialModalScreen mounted");
    end);
    local v14 = l_useCallback_0(function() --[[ Line: 29 ]]
        -- upvalues: l_navigation_0 (copy)
        l_navigation_0.goBack();
    end, {
        l_navigation_0
    });
    local v16 = l_useCallback_0(function(v15) --[[ Line: 33 ]]
        -- upvalues: l_navigation_0 (copy), v3 (ref)
        l_navigation_0.navigate(v3.ChatConversation, {
            conversationId = v15
        });
    end, {
        l_navigation_0
    });
    local v18 = l_useCallback_0(function(v17) --[[ Line: 37 ]]
        -- upvalues: v11 (copy), v3 (ref)
        v11.navigation.navigate(v3.RoactChatToast, {
            toastProps = {
                toastContent = {
                    toastTitle = v17
                }
            }
        });
    end, {
        l_navigation_0
    });
    if v13 == nil then
        v8:warning("ConversationId is required to open CreateUnfilteredChatPartialModalScreen");
        return nil;
    else
        return v4.createElement(v7, {
            conversationId = v13, 
            onDismissed = v14, 
            navigateToConversation = v16, 
            navigateToToast = v18
        });
    end;
end;