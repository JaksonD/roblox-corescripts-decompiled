local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v7 = require(l_Parent_0.FocusNavigationUtils);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v9 = require(l_script_FirstAncestor_0.EnumScreens);
local v10 = require(l_script_FirstAncestor_0.SocialLibraries);
local l_TestStyle_0 = v10.Components.TestStyle;
local l_getConversationDisplayTitle_0 = v10.Conversation.getConversationDisplayTitle;
local v13 = require(l_script_FirstAncestor_0.Hooks.useIsUserPending);
local v14 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatRemoveUserProfileTitles);
local v16 = require(l_script_FirstAncestor_0.Conversations.getConversationTitle);
local l_usePageTracker_0 = require(l_Parent_0.PageLoadTracker).usePageTracker;
local l_FFlagLuaAppEnableChatMilestones_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableChatMilestones;
local l_FFlagLuaAppEnablePageLoadTracker_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnablePageLoadTracker;
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local v21 = require(l_script_FirstAncestor_0.Flags.FFlagDebugAppChatEnableDomLocators);
local l_FFlagEnableBlackbirdCheckDev_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdCheckDev;
local l_useIsRobloxSubscriber_0 = require(l_Parent_0.UserProfiles).Hooks.useIsRobloxSubscriber;
local v24 = require(l_script_FirstAncestor_0.Hooks.useGetOneToOneFriendIdFromConversationId);
local v25 = require(script.Parent.PresenceBubbleCellStyled);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v27 = {
    messageUnavailableKey = "Feature.Chat.Message.MessageUnavailable", 
    boldTitle = true, 
    childWidth = 0, 
    isLoading = false, 
    Size = UDim2.new(1, 0, 1, 0), 
    hideLeftAvatarPadding = false, 
    style = v2.Dictionary.join(l_TestStyle_0, {
        Tokens = {
            Global = {
                Color = {
                    None = {}
                }
            }
        }
    })
};
return v3.memo(function(v28) --[[ Line: 75 ]] --[[ Name: ConversationCell ]]
    -- upvalues: v2 (copy), v27 (copy), v13 (copy), v14 (copy), v24 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy), l_useIsRobloxSubscriber_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v7 (copy), l_useNavigation_0 (copy), l_FFlagLuaAppEnablePageLoadTracker_0 (copy), l_FFlagLuaAppEnableChatMilestones_0 (copy), l_usePageTracker_0 (copy), v3 (copy), v9 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v15 (copy), v16 (copy), l_getConversationDisplayTitle_0 (copy), l_useLocalization_0 (copy), v25 (copy), l_Images_0 (copy), v21 (copy)
    local v29 = v2.Dictionary.join(v27, v28);
    local l_conversation_0 = v29.conversation;
    local v31 = v13(l_conversation_0 or {});
    local v32 = v14();
    local v33 = v24(l_conversation_0 and l_conversation_0.id);
    local v34 = l_useIsRobloxSubscriber_0(if l_FFlagEnableBlackbirdCheckDev_0 then v33 else nil);
    local v35 = if l_FFlagEnableAppChatFocusableFixes_0 then v7.useLastInputMode() else nil;
    local v36 = if l_FFlagEnableAppChatFocusableFixes_0 then l_useNavigation_0() else nil;
    local v37 = nil;
    if l_FFlagLuaAppEnablePageLoadTracker_0 and l_FFlagLuaAppEnableChatMilestones_0 then
        v37 = l_usePageTracker_0();
    end;
    v3.useEffect(function() --[[ Line: 95 ]]
        -- upvalues: l_FFlagLuaAppEnablePageLoadTracker_0 (ref), l_FFlagLuaAppEnableChatMilestones_0 (ref), v32 (copy), v37 (ref)
        if l_FFlagLuaAppEnablePageLoadTracker_0 and l_FFlagLuaAppEnableChatMilestones_0 and not v32 then
            v37:sendMilestone("main_cta_interactable");
        end;
    end, {});
    local v38 = v3.useCallback(function() --[[ Line: 104 ]]
        -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (ref), v35 (copy), v36 (copy), v9 (ref), v29 (copy)
        if l_FFlagEnableAppChatFocusableFixes_0 and v35 == "Focus" and v36 then
            v36.navigate(v9.ChatConversation, {
                conversationId = v29.conversation.id, 
                navigatedWithFocus = true
            });
            return;
        else
            if v29.onActivated then
                v29.onActivated(v29.conversation);
            end;
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v29.onActivated, 
        v29.conversation, 
        v35, 
        v36
    } else l_dependencyArray_0(v29.onActivated, v29.conversation, v35, v36));
    local v39 = if v15 then v16(l_conversation_0) else l_getConversationDisplayTitle_0(l_conversation_0);
    local v40 = v29.subTitleText and v29.subTitleText:split("\n");
    local v41 = v40 and v40[1] or "";
    local v42 = l_useLocalization_0({
        subTitleText = v29.messageUnavailableKey
    });
    if v31 then
        v41 = v42.subTitleText;
    end;
    return v3.createElement(v25, {
        boldTitle = v29.boldTitle, 
        style = v29.style, 
        childWidth = v29.childWidth, 
        onActivated = v38, 
        onCircleActivated = v29.onCircleActivated, 
        subTitleText = v41, 
        subTitleIcon = v31 and l_Images_0["icons/status/private_small"] or nil, 
        secondaryTitleText = v29.secondaryTitleText, 
        testId = if v21 then v29.testId else nil, 
        Size = v29.Size, 
        isLoading = v29.isLoading, 
        avatarCirclePresenceImage = l_conversation_0.presenceImage, 
        titleText = v39, 
        thumbnails = l_conversation_0.thumbnails, 
        conversationId = l_conversation_0.id, 
        hideLeftAvatarPadding = v29.hideLeftAvatarPadding, 
        paddingLeft = v29.paddingLeft, 
        paddingRight = v29.paddingRight, 
        isRobloxSubscriber = if l_FFlagEnableBlackbirdCheckDev_0 then v34 else nil
    }, v29.children or {});
end);