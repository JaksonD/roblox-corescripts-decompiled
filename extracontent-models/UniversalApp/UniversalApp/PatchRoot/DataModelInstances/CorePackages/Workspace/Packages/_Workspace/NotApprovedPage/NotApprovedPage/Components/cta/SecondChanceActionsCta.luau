local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_NotificationType_0 = require(l_Parent_0.RobloxAppEnums).NotificationType;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v8 = require(l_Parent_0.React);
local l_Fragment_0 = v8.Fragment;
local l_useState_0 = v8.useState;
local l_useCallback_0 = v8.useCallback;
local v12 = require(l_Parent_0.Foundation);
local l_Button_0 = v12.Button;
local l_ButtonVariant_0 = v12.Enums.ButtonVariant;
local l_InputSize_0 = v12.Enums.InputSize;
local l_EVENT_TYPES_0 = require(l_Parent_0.NotApprovedPageState).Constants.EVENT_TYPES;
local _ = require(l_script_FirstAncestor_0.Components.pageItemConfigs.PageItemConfigUtils);
local v18 = require(l_script_FirstAncestor_0.Components.ErrorAlert);
local v19 = require(l_script_FirstAncestor_0.Http.PostConsequenceCommutation);
local l_SetModerationStatus_0 = require(l_Parent_0.NotApprovedPageState).SetModerationStatus;
local l_useNotApprovedPageContext_0 = require(l_script_FirstAncestor_0.Contexts.NotApprovedPageContext).useNotApprovedPageContext;
local v22 = require(l_script_FirstAncestor_0.Utils.useOpenLink);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return v8.memo(function(v24) --[[ Line: 40 ]] --[[ Name: SecondChanceActionsCta ]]
    -- upvalues: l_useNotApprovedPageContext_0 (copy), v22 (copy), l_UrlBuilder_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useState_0 (copy), l_useCallback_0 (copy), l_EVENT_TYPES_0 (copy), v19 (copy), l_SetModerationStatus_0 (copy), l_GuiService_0 (copy), l_NotificationType_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v8 (copy), l_Fragment_0 (copy), v18 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy)
    local l_translations_0 = l_useNotApprovedPageContext_0().translations;
    local v26 = v22(l_UrlBuilder_0.static.appealsPortal.main(), l_translations_0.appealsPortalTitle);
    local v27 = l_useRoactService_0(l_RoactNetworking_0);
    local l_dispatch_0 = v24.dispatch;
    local l_sendPageEvent_0 = v24.sendPageEvent;
    local v30, v31 = l_useState_0(false);
    local v32, v33 = l_useState_0(false);
    local v36 = l_useCallback_0(function() --[[ Line: 52 ]]
        -- upvalues: v31 (copy), l_sendPageEvent_0 (copy), l_EVENT_TYPES_0 (ref), v19 (ref), v27 (copy), v33 (copy), l_dispatch_0 (copy), l_SetModerationStatus_0 (ref), l_GuiService_0 (ref), l_NotificationType_0 (ref)
        v31(true);
        if l_sendPageEvent_0 then
            l_sendPageEvent_0(l_EVENT_TYPES_0.SecondChanceReactivateClicked);
        end;
        v19(v27):andThen(function(_) --[[ Line: 60 ]]
            -- upvalues: v33 (ref), l_dispatch_0 (ref), l_SetModerationStatus_0 (ref), l_GuiService_0 (ref), l_NotificationType_0 (ref)
            v33(false);
            l_dispatch_0(l_SetModerationStatus_0(false));
            l_GuiService_0:BroadcastNotification("", l_NotificationType_0.RESTART_LUA_APP);
        end):catch(function(_) --[[ Line: 65 ]]
            -- upvalues: v33 (ref), v31 (ref)
            v33(true);
            v31(false);
        end);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        l_sendPageEvent_0, 
        v27, 
        l_dispatch_0
    } else l_dependencyArray_0(l_sendPageEvent_0, v27, l_dispatch_0));
    local v37 = l_useCallback_0(function() --[[ Line: 76 ]]
        -- upvalues: l_sendPageEvent_0 (copy), l_EVENT_TYPES_0 (ref), v26 (copy)
        if l_sendPageEvent_0 then
            l_sendPageEvent_0(l_EVENT_TYPES_0.AppealsPortalClicked);
        end;
        v26();
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v26, 
        l_sendPageEvent_0
    } else l_dependencyArray_0(v26, l_sendPageEvent_0));
    local v38 = l_useCallback_0(function() --[[ Line: 87 ]]
        -- upvalues: v33 (copy)
        v33(false);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {} else l_dependencyArray_0());
    return v8.createElement(l_Fragment_0, nil, {
        ErrorAlert = v32 and v8.createElement(v18, {
            onClose = v38, 
            layoutOrder = 1
        }), 
        ReactivateButton = v8.createElement(l_Button_0, {
            text = l_translations_0.okButton, 
            onActivated = v36, 
            variant = l_ButtonVariant_0.Emphasis, 
            size = l_InputSize_0.Medium, 
            width = UDim.new(1, 0), 
            isLoading = v30, 
            isDisabled = v30, 
            LayoutOrder = 2, 
            testId = "second-chance-reactivate-button"
        }), 
        SendAppealButton = v8.createElement(l_Button_0, {
            text = l_translations_0.sendAppealButton, 
            onActivated = v37, 
            variant = l_ButtonVariant_0.Standard, 
            size = l_InputSize_0.Medium, 
            width = UDim.new(1, 0), 
            LayoutOrder = 3, 
            testId = "second-chance-send-appeal-button"
        })
    });
end);