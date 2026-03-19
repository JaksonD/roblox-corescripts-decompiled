local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Components.AccountReactivationPrompt.AccountReactivationPromptButtons);
local v3 = require(l_script_FirstAncestor_0.Utils.sendNotApprovedPageEvent);
local v4 = require(l_script_FirstAncestor_0.Utils.canReactivate);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_EVENT_TYPES_0 = require(l_Parent_0.NotApprovedPageState).Constants.EVENT_TYPES;
local v7 = require(l_Parent_0.React);
local l_useState_0 = v7.useState;
local l_useEffect_0 = v7.useEffect;
local l_useCallback_0 = v7.useCallback;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v14 = require(l_Parent_0.Foundation);
local l_View_0 = v14.View;
local l_Text_0 = v14.Text;
local l_PartialPageModal_0 = require(l_Parent_0.UIBlox).App.Dialog.Modal.PartialPageModal;
local l_UserInputService_0 = game:GetService("UserInputService");
return v7.memo(function(v19) --[[ Line: 45 ]] --[[ Name: AccountReactivationPrompt ]]
    -- upvalues: l_useState_0 (copy), l_UserInputService_0 (copy), l_useSelector_0 (copy), l_useLocalization_0 (copy), l_useEffect_0 (copy), v3 (copy), l_EVENT_TYPES_0 (copy), v4 (copy), l_useCallback_0 (copy), v7 (copy), v2 (copy), l_dependencyArray_0 (copy), l_PartialPageModal_0 (copy), l_View_0 (copy), l_Text_0 (copy)
    local v20, v21 = l_useState_0(false);
    local l_Y_0 = l_UserInputService_0.StatusBarSize.Y;
    local v24 = l_useSelector_0(function(v23) --[[ Line: 49 ]]
        return v23.ScreenSize;
    end);
    local v25 = l_useLocalization_0({
        modalTitle = "Feature.AccountReactivation.Heading.AccountDeactivated", 
        messageToUser = "Feature.AccountReactivation.Content.AccountDeactivatedMessage", 
        errorMessage = "Feature.AccountReactivation.Label.DefaultError"
    });
    l_useEffect_0(function() --[[ Line: 59 ]]
        -- upvalues: v19 (copy), v3 (ref), l_EVENT_TYPES_0 (ref), v4 (ref)
        local l_moderationDetail_0 = v19.moderationDetail;
        v3({
            eventType = l_EVENT_TYPES_0.AccountReactivationPageRendered, 
            interventionId = l_moderationDetail_0.interventionId, 
            verificationCategory = l_moderationDetail_0.verificationCategory, 
            isReactivationEligible = tostring(v4(l_moderationDetail_0.punishmentTypeDescription, l_moderationDetail_0.endDate, l_moderationDetail_0.verificationCategory)), 
            punishedUserId = l_moderationDetail_0.punishedUserId
        });
    end, {});
    local v27 = l_useCallback_0(function() --[[ Line: 78 ]]
        -- upvalues: v7 (ref), v2 (ref), v19 (copy), v21 (copy)
        return v7.createElement(v2, {
            moderationDetail = v19.moderationDetail, 
            setErrorState = v21, 
            LogoutThunk = v19.LogoutThunk
        });
    end, l_dependencyArray_0(v19.moderationDetail, v19.LogoutThunk));
    return v7.createElement(l_PartialPageModal_0, {
        title = v25.modalTitle, 
        screenSize = v24, 
        distanceFromTop = l_Y_0, 
        marginSize = 0, 
        footerContent = v27
    }, {
        Content = v7.createElement(l_View_0, {
            tag = "auto-xy col padding-xxlarge gap-medium"
        }, {
            MessageToUser = v7.createElement(l_Text_0, {
                Text = v25.messageToUser, 
                tag = "auto-xy text-wrap", 
                LayoutOrder = 1
            }), 
            ErrorMessage = v20 and v7.createElement(l_Text_0, {
                Text = v25.errorMessage, 
                tag = "auto-xy text-wrap", 
                LayoutOrder = 2
            })
        })
    });
end);