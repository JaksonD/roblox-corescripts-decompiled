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
local v21 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableDomLocators);
local l_FFlagEnableBlackbirdCheckDev_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdCheckDev;
local l_useIsRobloxSubscriber_0 = require(l_Parent_0.UserProfiles).Hooks.useIsRobloxSubscriber;
local v24 = require(l_script_FirstAncestor_0.Hooks.useGetOneToOneFriendIdFromConversationId);
local v25 = require(script.Parent.PresenceBubbleCellStyled);
local v26 = {
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
return v3.memo(function(v27) --[[ Line: 73 ]] --[[ Name: ConversationCell ]]
    -- upvalues: v2 (copy), v26 (copy), v13 (copy), v14 (copy), v24 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy), l_useIsRobloxSubscriber_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v7 (copy), l_useNavigation_0 (copy), l_FFlagLuaAppEnablePageLoadTracker_0 (copy), l_FFlagLuaAppEnableChatMilestones_0 (copy), l_usePageTracker_0 (copy), v3 (copy), v9 (copy), l_dependencyArray_0 (copy), v15 (copy), v16 (copy), l_getConversationDisplayTitle_0 (copy), l_useLocalization_0 (copy), v25 (copy), l_Images_0 (copy), v21 (copy)
    local v28 = v2.Dictionary.join(v26, v27);
    local l_conversation_0 = v28.conversation;
    local v30 = v13(l_conversation_0 or {});
    local v31 = v14();
    local v32 = v24(l_conversation_0 and l_conversation_0.id);
    local v33 = l_useIsRobloxSubscriber_0(if l_FFlagEnableBlackbirdCheckDev_0 then v32 else nil);
    local v34 = if l_FFlagEnableAppChatFocusableFixes_0 then v7.useLastInputMode() else nil;
    local v35 = if l_FFlagEnableAppChatFocusableFixes_0 then l_useNavigation_0() else nil;
    local v36 = nil;
    if l_FFlagLuaAppEnablePageLoadTracker_0 and l_FFlagLuaAppEnableChatMilestones_0 then
        v36 = l_usePageTracker_0();
    end;
    v3.useEffect(function() --[[ Line: 93 ]]
        -- upvalues: l_FFlagLuaAppEnablePageLoadTracker_0 (ref), l_FFlagLuaAppEnableChatMilestones_0 (ref), v31 (copy), v36 (ref)
        if l_FFlagLuaAppEnablePageLoadTracker_0 and l_FFlagLuaAppEnableChatMilestones_0 and not v31 then
            v36:sendMilestone("main_cta_interactable");
        end;
    end, {});
    local v37 = v3.useCallback(function() --[[ Line: 101 ]]
        -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (ref), v34 (copy), v35 (copy), v9 (ref), v28 (copy)
        if l_FFlagEnableAppChatFocusableFixes_0 and v34 == "Focus" and v35 then
            v35.navigate(v9.ChatConversation, {
                conversationId = v28.conversation.id, 
                navigatedWithFocus = true
            });
            return;
        else
            if v28.onActivated then
                v28.onActivated(v28.conversation);
            end;
            return;
        end;
    end, l_dependencyArray_0(v28.onActivated, v28.conversation, v34, v35));
    local v38 = if v15 then v16(l_conversation_0) else l_getConversationDisplayTitle_0(l_conversation_0);
    local v39 = v28.subTitleText and v28.subTitleText:split("\n");
    local v40 = v39 and v39[1] or "";
    local v41 = l_useLocalization_0({
        subTitleText = v28.messageUnavailableKey
    });
    if v30 then
        v40 = v41.subTitleText;
    end;
    return v3.createElement(v25, {
        boldTitle = v28.boldTitle, 
        style = v28.style, 
        childWidth = v28.childWidth, 
        onActivated = v37, 
        onCircleActivated = v28.onCircleActivated, 
        subTitleText = v40, 
        subTitleIcon = v30 and l_Images_0["icons/status/private_small"] or nil, 
        secondaryTitleText = v28.secondaryTitleText, 
        testId = if v21 then v28.testId else nil, 
        Size = v28.Size, 
        isLoading = v28.isLoading, 
        avatarCirclePresenceImage = l_conversation_0.presenceImage, 
        titleText = v38, 
        thumbnails = l_conversation_0.thumbnails, 
        conversationId = l_conversation_0.id, 
        hideLeftAvatarPadding = v28.hideLeftAvatarPadding, 
        paddingLeft = v28.paddingLeft, 
        paddingRight = v28.paddingRight, 
        isRobloxSubscriber = if l_FFlagEnableBlackbirdCheckDev_0 then v33 else nil
    }, v28.children or {});
end);