local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local v1 = require(l_script_FirstAncestor_0.Utils.sendNotApprovedPageEvent);
local v2 = require(l_script_FirstAncestor_0.Utils.setBadUtterancesTranslationKeys);
local v3 = require(l_script_FirstAncestor_0.Utils.setViolationEvidenceTranslationKeys);
local v4 = require(l_script_FirstAncestor_0.Utils.canReactivate);
local v5 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.PageItemsFromConfigs);
local l_NotApprovedPageProvider_0 = require(l_script_FirstAncestor_0.Contexts.NotApprovedPageContext).NotApprovedPageProvider;
local l_PageNavigationProvider_0 = require(l_script_FirstAncestor_0.Contexts.PageNavigationContext).PageNavigationProvider;
local l_PageAnalyticsProvider_0 = require(l_script_FirstAncestor_0.Contexts.PageAnalyticsContext).PageAnalyticsProvider;
local v9 = require(l_script_FirstAncestor_0.Components.cta.CtaButtonsContainer);
local v10 = require(l_script_FirstAncestor_0.Http.GetCommutationEligibility);
local v11 = require(l_script_FirstAncestor_0.Components.LoadingDialog);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Constants_0 = require(l_Parent_0.NotApprovedPageState).Constants;
local l_TRANSLATION_KEYS_0 = l_Constants_0.TRANSLATION_KEYS;
local l_EVENT_TYPES_0 = l_Constants_0.EVENT_TYPES;
local v17 = require(l_Parent_0.React);
local l_useState_0 = v17.useState;
local l_useCallback_0 = v17.useCallback;
local l_useEffect_0 = v17.useEffect;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_FullPageModal_0 = require(l_Parent_0.UIBlox).App.Dialog.Modal.FullPageModal;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_IXPService_0 = game:GetService("IXPService");
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local l_FFlagEnableNapIxpLayerExposure_0 = require(l_Parent_0.SharedFlags).FFlagEnableNapIxpLayerExposure;
local v31 = require(l_script_FirstAncestor_0.Flags.FFlagEnableNapMiddlePages);
return v17.memo(function(v32) --[[ Line: 58 ]] --[[ Name: NotApprovedPage ]]
    -- upvalues: l_useState_0 (copy), l_UserInputService_0 (copy), l_useSelector_0 (copy), v31 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useEffect_0 (copy), v10 (copy), l_dependencyArray_0 (copy), l_FFlagEnableNapIxpLayerExposure_0 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), v1 (copy), l_EVENT_TYPES_0 (copy), v4 (copy), l_TRANSLATION_KEYS_0 (copy), v2 (copy), v3 (copy), l_useLocalization_0 (copy), l_useCallback_0 (copy), v17 (copy), v9 (copy), v11 (copy), l_NotApprovedPageProvider_0 (copy), l_PageNavigationProvider_0 (copy), l_PageAnalyticsProvider_0 (copy), l_FullPageModal_0 (copy), v5 (copy)
    local v33, v34 = l_useState_0(true);
    local v35, v36 = l_useState_0(nil);
    local l_Y_0 = l_UserInputService_0.StatusBarSize.Y;
    local v39 = l_useSelector_0(function(v38) --[[ Line: 63 ]]
        return v38.ScreenSize;
    end);
    local l_moderationDetail_0 = v32.moderationDetail;
    local l_punishmentTypeDescription_0 = l_moderationDetail_0.punishmentTypeDescription;
    local l_interventionType_0 = v32.interventionType;
    local v43 = if v31 then l_useRoactService_0(l_RoactNetworking_0) else nil;
    l_useEffect_0(function() --[[ Line: 74 ]]
        -- upvalues: v31 (ref), v10 (ref), v43 (copy), v36 (copy), v34 (copy)
        if v31 then
            v10(v43):andThen(function(v44) --[[ Line: 77 ]]
                -- upvalues: v36 (ref)
                if v44.responseBody then
                    v36(v44.responseBody);
                end;
            end):catch(function(_) --[[ Line: 82 ]]
                -- upvalues: v36 (ref)
                v36({
                    educational_pass_eligible = false
                });
            end):finally(function() --[[ Line: 88 ]]
                -- upvalues: v34 (ref)
                v34(false);
            end);
        end;
    end, l_dependencyArray_0(v43));
    l_useEffect_0(function() --[[ Line: 94 ]]
        -- upvalues: l_FFlagEnableNapIxpLayerExposure_0 (ref), l_IXPService_0 (ref), l_AppUserLayers_0 (ref), v1 (ref), l_EVENT_TYPES_0 (ref), l_moderationDetail_0 (copy), v4 (ref), l_interventionType_0 (copy)
        if l_FFlagEnableNapIxpLayerExposure_0 and game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then
            l_IXPService_0:LogFlagLinkedUserLayerExposure(l_AppUserLayers_0.NotApprovedPageUserIDLayer);
        end;
        v1({
            eventType = l_EVENT_TYPES_0.PageRendered, 
            interventionId = l_moderationDetail_0.interventionId, 
            verificationCategory = l_moderationDetail_0.verificationCategory, 
            isReactivationEligible = tostring(v4(l_interventionType_0, l_moderationDetail_0.endDate, l_moderationDetail_0.verificationCategory)), 
            punishedUserId = l_moderationDetail_0.punishedUserId
        });
    end, {});
    local l_l_TRANSLATION_KEYS_0_0 = l_TRANSLATION_KEYS_0;
    v2(l_moderationDetail_0, l_l_TRANSLATION_KEYS_0_0);
    v3(l_moderationDetail_0, l_l_TRANSLATION_KEYS_0_0);
    local v47 = l_useLocalization_0(l_l_TRANSLATION_KEYS_0_0);
    local v48 = l_useCallback_0(function() --[[ Line: 118 ]]
        -- upvalues: v17 (ref), v9 (ref), l_moderationDetail_0 (copy), v32 (copy)
        return v17.createElement(v9, {
            moderationDetail = l_moderationDetail_0, 
            LogoutThunk = v32.LogoutThunk
        });
    end, l_dependencyArray_0(l_moderationDetail_0, v32.LogoutThunk));
    if v31 and v33 then
        return v17.createElement(v11, {
            title = v47[l_punishmentTypeDescription_0] or ""
        });
    else
        return v17.createElement(l_NotApprovedPageProvider_0, if v31 then {
            translations = v47, 
            moderationDetail = l_moderationDetail_0, 
            commutationEligibility = v35
        } else {
            translations = v47, 
            moderationDetail = l_moderationDetail_0
        }, v17.createElement(l_PageNavigationProvider_0, {
            moderationDetail = l_moderationDetail_0
        }, v17.createElement(l_PageAnalyticsProvider_0, nil, v17.createElement(l_FullPageModal_0, {
            title = v47[l_punishmentTypeDescription_0], 
            screenSize = v39, 
            marginSize = 0, 
            distanceFromTop = l_Y_0, 
            footerContent = v48
        }, {
            Content = v17.createElement(v5, if v31 then {
                moderationDetail = l_moderationDetail_0, 
                LogoutThunk = v32.LogoutThunk, 
                commutationEligibility = v35
            } else {
                moderationDetail = l_moderationDetail_0, 
                LogoutThunk = v32.LogoutThunk
            })
        }))));
    end;
end);