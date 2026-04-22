local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.EnumScreens);
local v3 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatTopBarConfigDriven);
local v4 = require(script.Parent.ChatTopBarBase);
local v5 = require(script.Parent.createBackFunc);
local v6 = require(l_script_FirstAncestor_0.Stores.GetTopBarStore);
local v7 = require(l_script_FirstAncestor_0.Components.ChatConversation.HeaderBarTitleLeftAligned);
local l_useChatPlacementContext_0 = require(l_script_FirstAncestor_0.Contexts.ChatPlacementContext).useChatPlacementContext;
local v9 = require(l_Parent_0.Foundation);
local v10 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v12 = require(l_Parent_0.SignalsReact);
local v13 = require(l_Parent_0.AppHeaderBar);
local v14 = require(l_Parent_0.Squads);
local l_SquadJoinButton_0 = v14.SquadJoinButton;
local l_SquadButtonSourceEnum_0 = v14.Enums.SquadButtonSourceEnum;
local l_SquadComponentAccessWrapper_0 = v14.SquadComponentAccessWrapper;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local l_useSignalState_0 = v12.useSignalState;
local function v20() --[[ Line: 37 ]] --[[ Name: noOp ]]
    return nil;
end;
return function(v21) --[[ Line: 46 ]] --[[ Name: ChatConversationTopBar ]]
    -- upvalues: v3 (copy), v6 (copy), l_useSignalState_0 (copy), l_useChatPlacementContext_0 (copy), l_useLocalization_0 (copy), v13 (copy), v5 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v2 (copy), v10 (copy), v9 (copy), l_SquadComponentAccessWrapper_0 (copy), l_SquadJoinButton_0 (copy), l_SquadButtonSourceEnum_0 (copy), v7 (copy), v4 (copy), v20 (copy)
    if not v3() then
        return nil;
    else
        local l_screenName_0 = v21.screenName;
        local l_navigation_0 = v21.navigation;
        local v24 = v6(false).getScreenTopBar(l_screenName_0);
        local v25 = l_useSignalState_0(v24);
        local v26 = v25.headerText or {};
        local l_backButtonEnabled_0 = v25.backButtonEnabled;
        local l_isRoot_0 = v25.isRoot;
        local l_conversationId_0 = v25.conversationId;
        local l_navigateToChatDetails_0 = v25.navigateToChatDetails;
        local l_rightPaddingOverride_0 = v25.rightPaddingOverride;
        local v32 = l_useChatPlacementContext_0();
        local v33 = l_useLocalization_0({
            headerText = v26.shouldLocalize and v26.raw or nil
        });
        local v34 = l_navigation_0.getScreenProps("navigateToRootStack", nil);
        local l_makeBackButton_0 = v13.makeBackButton;
        local v36 = v5({
            navigation = l_navigation_0, 
            navigateToRootStack = v34, 
            isRoot = l_isRoot_0
        });
        local v37 = if l_backButtonEnabled_0 then l_makeBackButton_0(v36) else nil;
        local v38 = nil;
        if l_GetFFlagIsSquadEnabled_0() and l_conversationId_0 then
            local function v39() --[[ Line: 82 ]]
                -- upvalues: l_navigation_0 (copy), v2 (ref), l_conversationId_0 (copy)
                l_navigation_0.navigate(v2.SquadLobby, {
                    conversationId = l_conversationId_0
                });
            end;
            local l_v39_0 = v39 --[[ copy: 19 -> 20 ]];
            v38 = function() --[[ Line: 85 ]]
                -- upvalues: v10 (ref), v9 (ref), l_SquadComponentAccessWrapper_0 (ref), l_conversationId_0 (copy), l_SquadJoinButton_0 (ref), l_v39_0 (copy), l_SquadButtonSourceEnum_0 (ref), v32 (copy)
                return v10.createElement(v9.View, {
                    tag = "row align-x-right auto-xy"
                }, {
                    GroupUpButton = v10.createElement(l_SquadComponentAccessWrapper_0, {
                        parentChannelId = l_conversationId_0
                    }, v10.createElement(l_SquadJoinButton_0, {
                        conversationId = l_conversationId_0, 
                        isFullWidth = false, 
                        isInCard = false, 
                        layoutOrder = 0, 
                        onActivated = l_v39_0, 
                        shouldAnimate = true, 
                        shouldShowSignifier = true, 
                        squadButtonSource = l_SquadButtonSourceEnum_0.ChatConversationScreen, 
                        squadLocation = v32.chatPlacement
                    }))
                });
            end;
        end;
        local function v42() --[[ Line: 110 ]]
            -- upvalues: v26 (copy), v33 (copy), v10 (ref), v7 (ref), v37 (copy), v38 (ref), l_conversationId_0 (copy), l_navigateToChatDetails_0 (copy), l_rightPaddingOverride_0 (copy)
            local v41 = v26.shouldLocalize and v33.headerText or v26.raw or "";
            return v10.createElement(v7, {
                renderLeft = v37, 
                renderRight = v38, 
                titleText = v41, 
                conversationId = l_conversationId_0 or "", 
                navigateToChatDetails = l_navigateToChatDetails_0 or function() --[[ Line: 117 ]]

                end, 
                ignoreRightMargin = l_rightPaddingOverride_0 ~= nil
            });
        end;
        return v10.createElement(v4, {
            screenName = l_screenName_0, 
            navigation = l_navigation_0, 
            renderLeft = v20, 
            renderCenter = v42
        });
    end;
end;