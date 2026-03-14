local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v4 = require(l_script_FirstAncestor_0.EnumScreens);
local v5 = require(script.Parent.GroupOSADialog);
local v6 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatGroupOsaAnalytics);
local v7 = game:DefineFastFlag("AppChatGroupOsaDisablePortal", false);
return function() --[[ Line: 13 ]] --[[ Name: GroupOSADialogScreen ]]
    -- upvalues: l_useNavigation_0 (copy), v6 (copy), v2 (copy), v4 (copy), v5 (copy), v7 (copy)
    local v8 = l_useNavigation_0();
    local v9 = v8.getParam("conversationId", nil);
    local v10 = if v6 then v8.getParam("impressionId", nil) else nil;
    local v11 = v2.useCallback(function() --[[ Line: 18 ]]
        -- upvalues: v8 (copy)
        if v8.isFocused() then
            v8.goBack();
        end;
    end, {
        v8
    });
    local v12 = v2.useCallback(function() --[[ Line: 24 ]]
        -- upvalues: v8 (copy), v4 (ref), v9 (copy)
        v8.navigate(v4.ChatConversation, {
            conversationId = v9, 
            isNavigatedFromGroupOSAJoin = true
        });
    end, {
        v8, 
        v9
    });
    local v13 = v2.useCallback(function() --[[ Line: 31 ]]
        -- upvalues: v8 (copy)
        if v8.isFocused() then
            v8.goBack();
        end;
    end, {
        v8
    });
    return v2.createElement(v5, {
        conversationId = v9, 
        onClose = v11, 
        onJoin = v12, 
        onDecline = v13, 
        disablePortal = v7, 
        impressionId = v10
    });
end;