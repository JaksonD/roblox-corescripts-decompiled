local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlayerFeedback");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_InlinePrompt_0 = require(l_Parent_0.AppBlox).InlinePrompt;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v6 = require(l_Parent_0.RobloxAppHooks);
local v7 = require(l_Parent_0.RoactServiceTags);
local l_useRoactService_0 = v6.useRoactService;
local l_AppEventIngestService_0 = v7.AppEventIngestService;
local v10 = require(l_script_FirstAncestor_0.Analytics.Events.PlayerFeedbackEvents);
local l_GetFFlagEdpPlayerFeedbackPromptTitleOnly_0 = require(l_Parent_0.SharedFlags).GetFFlagEdpPlayerFeedbackPromptTitleOnly;
local l_Images_0 = v3.App.ImageSet.Images;
local l_StandardButtonSize_0 = v3.App.Button.Enum.StandardButtonSize;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
return function(v15) --[[ Line: 26 ]] --[[ Name: GamePlayerFeedbackPrompt ]]
    -- upvalues: l_useLocalization_0 (copy), l_GetFFlagEdpPlayerFeedbackPromptTitleOnly_0 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), v2 (copy), v10 (copy), l_InlinePrompt_0 (copy), l_Images_0 (copy), l_ButtonType_0 (copy), l_StandardButtonSize_0 (copy)
    local v16 = l_useLocalization_0({
        buttonLabelKey = "PlayerFeedbacks.VoteForm.PromptBanner.GiveFeedbackButton", 
        messageKey = "PlayerFeedbacks.VoteForm.PromptBanner.Message", 
        titleKey = "PlayerFeedbacks.VoteForm.PromptBanner.Title", 
        titleOnlyKey = l_GetFFlagEdpPlayerFeedbackPromptTitleOnly_0() and "PlayerFeedbacks.VoteForm.PromptBanner.TitleOnly" or nil
    });
    local v17 = l_useRoactService_0(l_AppEventIngestService_0);
    local v18 = v2.useCallback(function() --[[ Line: 36 ]]
        -- upvalues: v10 (ref), v17 (copy), v15 (copy)
        v10.ClickPlayerFeedbackPromptCta(v17, v15.placeId);
        v15.onButtonClick();
    end, {
        v17, 
        v15.placeId, 
        v15.onButtonClick
    });
    local v19 = v2.useCallback(function() --[[ Line: 41 ]]
        -- upvalues: v10 (ref), v17 (copy), v15 (copy)
        v10.DismissPlayerFeedbackPrompt(v17, v15.placeId);
        v15.onDimiss();
    end, {
        v17, 
        v15.placeId, 
        v15.onDimiss
    });
    v2.useEffect(function() --[[ Line: 46 ]]
        -- upvalues: v10 (ref), v17 (copy), v15 (copy)
        v10.PlayerFeedbackPromptMounted(v17, v15.placeId);
    end, {
        v17, 
        v15.placeId
    });
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = if v15.width then UDim2.new(0, v15.width, 0, 0) else UDim2.new(1, 0, 0, 0), 
        LayoutOrder = v15.LayoutOrder
    }, {
        InlinePrompt = v2.createElement(l_InlinePrompt_0, {
            iconImage = if l_GetFFlagEdpPlayerFeedbackPromptTitleOnly_0() then nil else l_Images_0["icons/menu/platformChatOff"], 
            titleMessage = if l_GetFFlagEdpPlayerFeedbackPromptTitleOnly_0() then v16.titleOnlyKey else v16.titleKey, 
            sublineMessage = if l_GetFFlagEdpPlayerFeedbackPromptTitleOnly_0() then nil else v16.messageKey, 
            buttonProps = {
                text = v16.buttonLabelKey, 
                buttonType = l_ButtonType_0.Secondary, 
                standardSize = l_StandardButtonSize_0.XSmall, 
                onActivated = v18
            }, 
            showDismiss = true, 
            onDismiss = v19, 
            backgroundTransparency = v15.backgroundTransparency, 
            backgroundColor3 = v15.backgroundColor3
        })
    });
end;