local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Rodux.Thunks.ReactivateDeactivatedAccount);
local l_SetModerationStatus_0 = require(l_Parent_0.NotApprovedPageState).SetModerationStatus;
local v4 = require(l_script_FirstAncestor_0.Utils.useLogout);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v6 = require(l_Parent_0.React);
local l_useState_0 = v6.useState;
local l_useCallback_0 = v6.useCallback;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_GuiService_0 = game:GetService("GuiService");
local l_NotificationType_0 = require(l_Parent_0.RobloxAppEnums).NotificationType;
local v16 = require(l_Parent_0.Foundation);
local l_View_0 = v16.View;
local l_Button_0 = v16.Button;
local l_ButtonVariant_0 = v16.Enums.ButtonVariant;
local l_InputSize_0 = v16.Enums.InputSize;
return v6.memo(function(v21) --[[ Line: 42 ]] --[[ Name: AccountReactivationPromptButtons ]]
    -- upvalues: l_useState_0 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v4 (copy), l_useCallback_0 (copy), v2 (copy), l_SetModerationStatus_0 (copy), l_GuiService_0 (copy), l_NotificationType_0 (copy), l_dependencyArray_0 (copy), l_useLocalization_0 (copy), v6 (copy), l_View_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy)
    local v22, v23 = l_useState_0(false);
    local v24, v25 = l_useState_0(false);
    local v26 = l_useDispatch_0();
    local v27 = l_useRoactService_0(l_RoactNetworking_0);
    local v28 = v4(v25, v21.LogoutThunk);
    local v31 = l_useCallback_0(function() --[[ Line: 50 ]]
        -- upvalues: v21 (copy), v23 (copy), v2 (ref), v27 (copy), v26 (copy), l_SetModerationStatus_0 (ref), l_GuiService_0 (ref), l_NotificationType_0 (ref)
        v21.setErrorState(false);
        v23(true);
        v2(v27):andThen(function(_) --[[ Line: 54 ]]
            -- upvalues: v26 (ref), l_SetModerationStatus_0 (ref), l_GuiService_0 (ref), l_NotificationType_0 (ref)
            v26(l_SetModerationStatus_0(false));
            l_GuiService_0:BroadcastNotification("", l_NotificationType_0.RESTART_LUA_APP);
        end):catch(function(_) --[[ Line: 58 ]]
            -- upvalues: v21 (ref), v23 (ref)
            v21.setErrorState(true);
            v23(false);
        end);
    end, l_dependencyArray_0(v26, v27, v21.setErrorState));
    local v32 = l_useLocalization_0({
        logoutButton = "Application.Logout.Action.Logout", 
        reactivationButton = "Feature.AccountReactivation.Label.Reactivate"
    });
    return v6.createElement(l_View_0, {
        tag = "flex-between size-full-0 auto-y col gap-small padding-x-xxlarge"
    }, {
        ReactivationButton = v6.createElement(l_Button_0, {
            text = v32.reactivationButton, 
            onActivated = v31, 
            variant = l_ButtonVariant_0.Emphasis, 
            size = l_InputSize_0.Medium, 
            width = UDim.new(1, 0), 
            isLoading = v22, 
            LayoutOrder = 1
        }), 
        LogoutButton = v6.createElement(l_Button_0, {
            text = v32.logoutButton, 
            onActivated = v28, 
            variant = l_ButtonVariant_0.Standard, 
            size = l_InputSize_0.Medium, 
            width = UDim.new(1, 0), 
            isLoading = v24, 
            LayoutOrder = 2
        })
    });
end);