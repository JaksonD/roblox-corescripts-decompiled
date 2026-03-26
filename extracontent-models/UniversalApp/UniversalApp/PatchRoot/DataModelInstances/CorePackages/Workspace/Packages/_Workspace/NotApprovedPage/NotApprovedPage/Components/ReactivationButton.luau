local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Rodux.Thunks.ReactivateAccount);
local v3 = require(l_script_FirstAncestor_0.Utils.sendNotApprovedPageEvent);
local l_Constants_0 = require(l_Parent_0.NotApprovedPageState).Constants;
local l_EVENT_TYPES_0 = l_Constants_0.EVENT_TYPES;
local l_VERIFICATION_TYPES_0 = l_Constants_0.VERIFICATION_TYPES;
local l_INTERVENTION_TYPES_0 = l_Constants_0.INTERVENTION_TYPES;
local l_PUNISHMENT_TYPE_TO_INTERVENTION_MAP_0 = l_Constants_0.PUNISHMENT_TYPE_TO_INTERVENTION_MAP;
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v10 = require(l_Parent_0.React);
local l_useState_0 = v10.useState;
local l_useMemo_0 = v10.useMemo;
local l_useCallback_0 = v10.useCallback;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_NavigateBack_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateBack;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v21 = require(l_Parent_0.Foundation);
local l_Button_0 = v21.Button;
local l_ButtonVariant_0 = v21.Enums.ButtonVariant;
local l_InputSize_0 = v21.Enums.InputSize;
local l_CloseCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_GetFFlagUseDecomposedVPCForChargebacks_0 = require(l_Parent_0.SharedFlags).GetFFlagUseDecomposedVPCForChargebacks;
local l_useNotApprovedPageContext_0 = require(l_script_FirstAncestor_0.Contexts.NotApprovedPageContext).useNotApprovedPageContext;
return v10.memo(function(v31) --[[ Line: 59 ]] --[[ Name: ReactivationButton ]]
    -- upvalues: l_useState_0 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useNotApprovedPageContext_0 (copy), l_PUNISHMENT_TYPE_TO_INTERVENTION_MAP_0 (copy), l_useCallback_0 (copy), l_EVENT_TYPES_0 (copy), v3 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_UrlBuilder_0 (copy), l_dependencyArray_0 (copy), l_GetFFlagUseDecomposedVPCForChargebacks_0 (copy), l_CloseCentralOverlay_0 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), l_NavigateBack_0 (copy), v2 (copy), l_useMemo_0 (copy), l_VERIFICATION_TYPES_0 (copy), l_INTERVENTION_TYPES_0 (copy), v10 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy)
    local v32, v33 = l_useState_0(false);
    local v34 = l_useDispatch_0();
    local v35 = l_useRoactService_0(l_RoactNetworking_0);
    local l_translations_0 = l_useNotApprovedPageContext_0().translations;
    local l_canReactivate_0 = v31.canReactivate;
    local l_moderationDetail_0 = v31.moderationDetail;
    local l_verificationCategory_0 = l_moderationDetail_0.verificationCategory;
    local v40 = l_PUNISHMENT_TYPE_TO_INTERVENTION_MAP_0[l_moderationDetail_0.punishmentTypeDescription];
    local v41 = l_useCallback_0(function() --[[ Line: 72 ]]
        -- upvalues: v33 (copy), v31 (copy), l_EVENT_TYPES_0 (ref), v3 (ref), v34 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_UrlBuilder_0 (ref)
        v33(true);
        if v31.sendPageEvent then
            v31.sendPageEvent(l_EVENT_TYPES_0.EmailVerificationClicked);
        else
            v3({
                eventType = l_EVENT_TYPES_0.EmailVerificationClicked
            });
        end;
        v34(l_NavigateDown_0({
            name = l_AppPage_0.EmailVerification, 
            detail = l_UrlBuilder_0.fromString("www:")()
        }));
    end, l_dependencyArray_0(v34));
    local v44 = l_useCallback_0(function() --[[ Line: 88 ]]
        -- upvalues: v33 (copy), v31 (copy), l_EVENT_TYPES_0 (ref), v3 (ref), l_GetFFlagUseDecomposedVPCForChargebacks_0 (ref), v34 (copy), l_CloseCentralOverlay_0 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), l_moderationDetail_0 (copy), v40 (copy), l_NavigateBack_0 (ref), l_UrlBuilder_0 (ref)
        v33(true);
        if v31.sendPageEvent then
            v31.sendPageEvent(l_EVENT_TYPES_0.ParentVerificationClicked);
        else
            v3({
                eventType = l_EVENT_TYPES_0.ParentVerificationClicked
            });
        end;
        if l_GetFFlagUseDecomposedVPCForChargebacks_0() then
            v34(l_CloseCentralOverlay_0());
            v34(l_NavigateDown_0({
                name = l_AppPage_0.AmpWizardContainer, 
                extraProps = {
                    featureName = "CanRequestPunishmentLifting", 
                    recourseData = {
                        punishmentType = "Chargeback"
                    }, 
                    entryPointEventCtx = "banScreenChargebackLiftPunishment", 
                    completionCallback = function(_, _) --[[ Line: 105 ]] --[[ Name: completionCallback ]]
                        -- upvalues: v34 (ref), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), l_moderationDetail_0 (ref), v40 (ref), v31 (ref), l_NavigateBack_0 (ref), v33 (ref)
                        v34(l_SetCentralOverlay_0(l_CentralOverlayType_0.NotApprovedPage, {
                            moderationDetail = l_moderationDetail_0, 
                            interventionType = v40, 
                            LogoutThunk = v31.LogoutThunk
                        }));
                        v34(l_NavigateBack_0());
                        v33(false);
                    end
                }
            }));
            return;
        else
            v34(l_NavigateDown_0({
                name = l_AppPage_0.ParentVerification, 
                detail = l_UrlBuilder_0.fromString("www:parents/account-setup")()
            }));
            return;
        end;
    end, l_dependencyArray_0(v34, l_moderationDetail_0, v40, v31.LogoutThunk));
    local v45 = l_useCallback_0(function() --[[ Line: 125 ]]
        -- upvalues: v33 (copy), v31 (copy), l_EVENT_TYPES_0 (ref), v3 (ref), v34 (copy), v2 (ref), v35 (copy), l_moderationDetail_0 (copy)
        v33(true);
        if v31.sendPageEvent then
            v31.sendPageEvent(l_EVENT_TYPES_0.ReactivateClicked);
        else
            v3({
                eventType = l_EVENT_TYPES_0.ReactivateClicked
            });
        end;
        v34(v2(v35, l_moderationDetail_0.punishmentId)):andThen(function() --[[ Line: 134 ]]
            -- upvalues: v33 (ref)
            v33(false);
        end);
    end, l_dependencyArray_0(v34, v35, l_moderationDetail_0.punishmentId));
    local v46 = l_useMemo_0(function() --[[ Line: 140 ]]
        -- upvalues: l_verificationCategory_0 (copy), l_VERIFICATION_TYPES_0 (ref), l_translations_0 (copy), v44 (copy), v41 (copy), v40 (copy), l_INTERVENTION_TYPES_0 (ref), l_canReactivate_0 (copy), v45 (copy)
        if l_verificationCategory_0 == l_VERIFICATION_TYPES_0.Parent then
            return {
                label = l_translations_0.parentVerificationButton, 
                action = v44
            };
        elseif l_verificationCategory_0 == l_VERIFICATION_TYPES_0.Email then
            return {
                label = l_translations_0.emailVerificationButton, 
                action = v41
            };
        elseif v40 == l_INTERVENTION_TYPES_0.Banned and not l_canReactivate_0 then
            return {
                label = l_translations_0.continueButton, 
                action = function() --[[ Line: 154 ]] --[[ Name: action ]]

                end
            };
        else
            return {
                label = l_translations_0.continueButton, 
                action = v45
            };
        end;
    end, l_dependencyArray_0(l_canReactivate_0, v44, v41, v45, l_moderationDetail_0.endDate, l_verificationCategory_0, v40));
    return v10.createElement(l_Button_0, {
        text = v46.label, 
        onActivated = v46.action, 
        variant = l_ButtonVariant_0.Emphasis, 
        size = l_InputSize_0.Medium, 
        width = UDim.new(1, 0), 
        isLoading = v32, 
        isDisabled = not l_canReactivate_0 or not v31.isAgreed or v32, 
        LayoutOrder = v31.layoutOrder, 
        testId = "reactivation-button"
    });
end);