local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.EnumScreens);
local v3 = require(l_Parent_0.Roact);
local v4 = require(script.Parent.Parent.Dialogs.GenericDialogType);
local v5 = require(script.Parent.Logger);
local v6 = require(script.Parent.ParticipantDialogContainer);
local v7 = require(l_script_FirstAncestor_0.LegacyAnalytics.connectAnalytics);
local v8 = require(l_script_FirstAncestor_0.LegacyAnalytics.RoactChatAnalytics);
local l_FFlagDisableBlockAndReport_0 = require(l_Parent_0.SharedFlags).FFlagDisableBlockAndReport;
local v10 = v3.PureComponent:extend("ParticipantDialogScreen");
v10.defaultProps = {
    navigation = nil
};
v10.init = function(v11) --[[ Line: 21 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v4 (copy), v2 (copy), v8 (copy), l_FFlagDisableBlockAndReport_0 (copy)
    v11.onDismiss = function() --[[ Line: 22 ]]
        -- upvalues: v11 (copy)
        v11.props.navigation.goBack();
    end;
    v11.openRemoveUserDialog = function(v12, v13) --[[ Line: 25 ]]
        -- upvalues: v5 (ref), v11 (copy), v4 (ref)
        v5:info("User activated removeFromGroup | userId: {}, conversationId: {}", v12, v13);
        v11.props.navigation.replace(v4.RemoveUserDialog, {
            conversationId = v13, 
            participantId = v12
        });
    end;
    v11.openViewProfile = function(v14) --[[ Line: 33 ]]
        -- upvalues: v11 (copy), v2 (ref), v5 (ref), v8 (ref)
        local v15 = v11.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v2.ViewUserProfile];
        if v15 then
            v5:info("Navigate To UserProfile from {screen}");
            v11.props.analytics:navigate(v8.NavigationEvents.ChatDetailsProfile);
            v15(v14, {});
            return;
        else
            v5:warning("UserProfile page was not set in navigateToLuaAppPages screenProps");
            return;
        end;
    end;
    v11.openReportUser = function(v16, v17) --[[ Line: 46 ]]
        -- upvalues: v11 (copy), v2 (ref)
        v11.props.navigation.replace(v2.AppChatReportAbuse, {
            participantId = v16, 
            conversationId = v17
        });
    end;
    v11.openBlockingModal = function(v18, v19) --[[ Line: 53 ]]
        -- upvalues: v11 (copy), v2 (ref), l_FFlagDisableBlockAndReport_0 (ref)
        local function v20() --[[ Line: 54 ]]
            -- upvalues: v11 (ref), v2 (ref), v18 (copy), v19 (copy)
            v11.props.navigation.pop();
            v11.props.navigation.navigate(v2.AppChatReportAbuse, {
                participantId = v18, 
                conversationId = v19
            });
        end;
        v11.props.navigation.replace(v2.BlockingModal, {
            navProps = {
                userId = v18, 
                openReportUser = v20, 
                disableReportOption = l_FFlagDisableBlockAndReport_0
            }
        });
    end;
end;
v10.render = function(v21) --[[ Line: 72 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v3 (copy), v6 (copy)
    local l_navigation_0 = v21.props.navigation;
    assert(type(l_navigation_0) ~= "nil", "ParticipantDialogScreen should be wrapped with Roact Navigation");
    local v23 = l_navigation_0.getParam("conversationId", nil);
    local v24 = l_navigation_0.getParam("participantId", nil);
    local v25 = l_navigation_0.getParam("showRemoveUserButton", false);
    if v23 == nil or v24 == nil then
        v5:warning("ConversationId and participantId are required to open {screen}");
        return nil;
    else
        return v3.createElement(v6, {
            conversationId = v23, 
            participantId = v24, 
            showRemoveUserButton = v25, 
            onDismiss = v21.onDismiss, 
            openRemoveUserDialog = v21.openRemoveUserDialog, 
            openReportUser = v21.openReportUser, 
            openViewProfile = v21.openViewProfile, 
            openBlockingModal = v21.openBlockingModal
        });
    end;
end;
v10.didMount = function(_) --[[ Line: 98 ]] --[[ Name: didMount ]]
    -- upvalues: v5 (copy)
    v5:info("{screen} mounted");
end;
return (v7(function(v27) --[[ Line: 102 ]]
    return {
        analytics = v27
    };
end)(v10));