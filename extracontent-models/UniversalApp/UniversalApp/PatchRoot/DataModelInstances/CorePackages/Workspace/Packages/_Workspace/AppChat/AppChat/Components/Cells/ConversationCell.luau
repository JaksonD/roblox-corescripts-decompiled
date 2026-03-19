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
local v22 = require(script.Parent.PresenceBubbleCellStyled);
local v23 = {
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
return v3.memo(function(v24) --[[ Line: 70 ]] --[[ Name: ConversationCell ]]
    -- upvalues: v2 (copy), v23 (copy), v13 (copy), v14 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v7 (copy), l_useNavigation_0 (copy), l_FFlagLuaAppEnablePageLoadTracker_0 (copy), l_FFlagLuaAppEnableChatMilestones_0 (copy), l_usePageTracker_0 (copy), v3 (copy), v9 (copy), l_dependencyArray_0 (copy), v15 (copy), v16 (copy), l_getConversationDisplayTitle_0 (copy), l_useLocalization_0 (copy), v22 (copy), l_Images_0 (copy), v21 (copy)
    local v25 = v2.Dictionary.join(v23, v24);
    local l_conversation_0 = v25.conversation;
    local v27 = v13(l_conversation_0 or {});
    local v28 = v14();
    local v29 = if l_FFlagEnableAppChatFocusableFixes_0 then v7.useLastInputMode() else nil;
    local v30 = if l_FFlagEnableAppChatFocusableFixes_0 then l_useNavigation_0() else nil;
    local v31 = nil;
    if l_FFlagLuaAppEnablePageLoadTracker_0 and l_FFlagLuaAppEnableChatMilestones_0 then
        v31 = l_usePageTracker_0();
    end;
    v3.useEffect(function() --[[ Line: 86 ]]
        -- upvalues: l_FFlagLuaAppEnablePageLoadTracker_0 (ref), l_FFlagLuaAppEnableChatMilestones_0 (ref), v28 (copy), v31 (ref)
        if l_FFlagLuaAppEnablePageLoadTracker_0 and l_FFlagLuaAppEnableChatMilestones_0 and not v28 then
            v31:sendMilestone("main_cta_interactable");
        end;
    end, {});
    local v32 = v3.useCallback(function() --[[ Line: 94 ]]
        -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (ref), v29 (copy), v30 (copy), v9 (ref), v25 (copy)
        if l_FFlagEnableAppChatFocusableFixes_0 and v29 == "Focus" and v30 then
            v30.navigate(v9.ChatConversation, {
                conversationId = v25.conversation.id, 
                navigatedWithFocus = true
            });
            return;
        else
            if v25.onActivated then
                v25.onActivated(v25.conversation);
            end;
            return;
        end;
    end, l_dependencyArray_0(v25.onActivated, v25.conversation, v29, v30));
    local v33 = if v15 then v16(l_conversation_0) else l_getConversationDisplayTitle_0(l_conversation_0);
    local v34 = v25.subTitleText and v25.subTitleText:split("\n");
    local v35 = v34 and v34[1] or "";
    local v36 = l_useLocalization_0({
        subTitleText = v25.messageUnavailableKey
    });
    if v27 then
        v35 = v36.subTitleText;
    end;
    return v3.createElement(v22, {
        boldTitle = v25.boldTitle, 
        style = v25.style, 
        childWidth = v25.childWidth, 
        onActivated = v32, 
        onCircleActivated = v25.onCircleActivated, 
        subTitleText = v35, 
        subTitleIcon = v27 and l_Images_0["icons/status/private_small"] or nil, 
        secondaryTitleText = v25.secondaryTitleText, 
        testId = if v21 then v25.testId else nil, 
        Size = v25.Size, 
        isLoading = v25.isLoading, 
        avatarCirclePresenceImage = l_conversation_0.presenceImage, 
        titleText = v33, 
        thumbnails = l_conversation_0.thumbnails, 
        conversationId = l_conversation_0.id, 
        hideLeftAvatarPadding = v25.hideLeftAvatarPadding, 
        paddingLeft = v25.paddingLeft, 
        paddingRight = v25.paddingRight
    }, v25.children or {});
end);