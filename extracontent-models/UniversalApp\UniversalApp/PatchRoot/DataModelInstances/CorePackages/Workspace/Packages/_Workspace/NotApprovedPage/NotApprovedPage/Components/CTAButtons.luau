local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utils.sendNotApprovedPageEvent);
local v3 = require(l_script_FirstAncestor_0.Utils.canReactivate);
local v4 = require(l_script_FirstAncestor_0.Utils.calculateTimeRemaining);
local v5 = require(l_script_FirstAncestor_0.Components.ReactivationButton);
local v6 = require(l_script_FirstAncestor_0.Components.SuspensionDurationAlert);
local v7 = require(l_script_FirstAncestor_0.Utils.useLogout);
local l_Constants_0 = require(l_Parent_0.NotApprovedPageState).Constants;
local l_INTERVENTION_TYPES_0 = l_Constants_0.INTERVENTION_TYPES;
local l_PUNISHMENT_TYPE_TO_INTERVENTION_MAP_0 = l_Constants_0.PUNISHMENT_TYPE_TO_INTERVENTION_MAP;
local l_EVENT_TYPES_0 = l_Constants_0.EVENT_TYPES;
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v13 = require(l_Parent_0.React);
local l_useState_0 = v13.useState;
local l_useEffect_0 = v13.useEffect;
local l_useCallback_0 = v13.useCallback;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v22 = require(l_Parent_0.Foundation);
local l_View_0 = v22.View;
local l_Button_0 = v22.Button;
local l_ButtonVariant_0 = v22.Enums.ButtonVariant;
local l_InputSize_0 = v22.Enums.InputSize;
local l_Checkbox_0 = v22.Checkbox;
local l_useNotApprovedPageContext_0 = require(l_script_FirstAncestor_0.Contexts.NotApprovedPageContext).useNotApprovedPageContext;
return v13.memo(function(v29) --[[ Line: 58 ]] --[[ Name: CTAButtons ]]
    -- upvalues: l_useState_0 (copy), v7 (copy), l_useNotApprovedPageContext_0 (copy), l_useDispatch_0 (copy), l_PUNISHMENT_TYPE_TO_INTERVENTION_MAP_0 (copy), l_useEffect_0 (copy), l_INTERVENTION_TYPES_0 (copy), l_dependencyArray_0 (copy), v3 (copy), v4 (copy), l_useCallback_0 (copy), v2 (copy), l_EVENT_TYPES_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_UrlBuilder_0 (copy), v13 (copy), l_View_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy), v6 (copy), v5 (copy), l_Checkbox_0 (copy)
    local v30, v31 = l_useState_0(false);
    local v32, v33 = l_useState_0(false);
    local v34, v35 = l_useState_0(false);
    local v36 = v7(v31, v29.LogoutThunk);
    local l_translations_0 = l_useNotApprovedPageContext_0().translations;
    local v38 = l_useDispatch_0();
    local l_moderationDetail_0 = v29.moderationDetail;
    local l_endDate_0 = l_moderationDetail_0.endDate;
    local l_verificationCategory_0 = l_moderationDetail_0.verificationCategory;
    local v42 = l_PUNISHMENT_TYPE_TO_INTERVENTION_MAP_0[l_moderationDetail_0.punishmentTypeDescription];
    l_useEffect_0(function() --[[ Line: 77 ]]
        -- upvalues: v42 (copy), l_INTERVENTION_TYPES_0 (ref), v29 (copy), v35 (copy)
        if v42 ~= l_INTERVENTION_TYPES_0.Banned or v29.page ~= 2 then
            return;
        else
            local v44 = task.delay(60, function() --[[ Line: 83 ]]
                -- upvalues: v35 (ref)
                v35(function(v43) --[[ Line: 84 ]]
                    return not v43;
                end);
            end);
            return function() --[[ Line: 89 ]]
                -- upvalues: v44 (copy)
                if v44 then
                    task.cancel(v44);
                end;
            end;
        end;
    end, l_dependencyArray_0(v34, v29.page, v42));
    local v45 = v3(v42, l_endDate_0, l_verificationCategory_0);
    local v46 = v4(l_endDate_0);
    local v47 = l_useCallback_0(function() --[[ Line: 99 ]]
        -- upvalues: v29 (copy), v2 (ref), l_EVENT_TYPES_0 (ref)
        v29.setPage(v29.page + 1);
        v2({
            eventType = l_EVENT_TYPES_0.ContinueClicked
        });
    end, l_dependencyArray_0(v29.page));
    local v48 = l_useCallback_0(function() --[[ Line: 104 ]]
        -- upvalues: v2 (ref), l_EVENT_TYPES_0 (ref), v38 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), l_translations_0 (copy)
        v2({
            eventType = l_EVENT_TYPES_0.AppealsPortalClicked
        });
        v38(l_NavigateDown_0({
            name = l_AppPage_0.GenericWebPage, 
            detail = l_UrlBuilder_0.static.appealsPortal.main(), 
            extraProps = {
                title = l_translations_0.appealsPortalTitle
            }
        }));
    end, l_dependencyArray_0(v38, l_translations_0));
    local v50 = l_useCallback_0(function() --[[ Line: 115 ]]
        -- upvalues: v33 (copy), v2 (ref), l_EVENT_TYPES_0 (ref)
        v33(function(v49) --[[ Line: 116 ]]
            return not v49;
        end);
        v2({
            eventType = l_EVENT_TYPES_0.CheckboxChecked
        });
    end, l_dependencyArray_0(v32));
    local l_createElement_0 = v13.createElement;
    local l_l_View_0_0 = l_View_0;
    local v53 = {
        tag = "size-full-0 auto-y col gap-medium padding-x-xxlarge padding-y-xsmall"
    };
    local v54 = {};
    local v55 = false;
    if v29.page == 1 then
        v55 = false;
        if v42 ~= l_INTERVENTION_TYPES_0.Deleted then
            v55 = v13.createElement(l_Button_0, {
                text = l_translations_0.continueButton, 
                onActivated = v47, 
                variant = l_ButtonVariant_0.Emphasis, 
                size = l_InputSize_0.Medium, 
                width = UDim.new(1, 0), 
                LayoutOrder = 1
            });
        end;
    end;
    v54.ContinueButton = v55;
    v55 = false;
    if v29.page == 1 then
        v55 = false;
        if v42 == l_INTERVENTION_TYPES_0.Deleted then
            v55 = v13.createElement(l_Button_0, {
                text = l_translations_0.reportMistakeButton, 
                onActivated = v48, 
                variant = l_ButtonVariant_0.SoftEmphasis, 
                size = l_InputSize_0.Medium, 
                width = UDim.new(1, 0), 
                LayoutOrder = 1
            });
        end;
    end;
    v54.AppealButton = v55;
    v55 = false;
    if v29.page == 2 then
        v55 = not v45 and v13.createElement(v6, {
            timeRemaining = v46, 
            layoutOrder = 2
        });
    end;
    v54.SuspensionDurationAlert = v55;
    v55 = false;
    if v29.page == 2 then
        v55 = false;
        if v42 ~= l_INTERVENTION_TYPES_0.Deleted then
            v55 = v13.createElement(v5, {
                moderationDetail = v29.moderationDetail, 
                interventionType = v42, 
                LogoutThunk = v29.LogoutThunk, 
                isAgreed = v32, 
                canReactivate = v45, 
                layoutOrder = 3
            });
        end;
    end;
    v54.ReactivationButton = v55;
    v55 = false;
    if v29.page == 2 then
        v55 = v45 and v13.createElement(l_Checkbox_0, {
            isChecked = v32, 
            size = l_InputSize_0.Small, 
            onActivated = v50, 
            label = l_translations_0.checkboxLabel, 
            LayoutOrder = 4
        });
    end;
    v54.AgreeCheckbox = v55;
    v55 = false;
    if v42 == l_INTERVENTION_TYPES_0.Deleted then
        v55 = v13.createElement(l_Button_0, {
            text = l_translations_0.logoutButton, 
            onActivated = v36, 
            variant = l_ButtonVariant_0.Text, 
            width = UDim.new(1, 0), 
            isLoading = v30, 
            LayoutOrder = 5
        });
    end;
    v54.LogoutButton = v55;
    return l_createElement_0(l_l_View_0_0, v53, v54);
end);