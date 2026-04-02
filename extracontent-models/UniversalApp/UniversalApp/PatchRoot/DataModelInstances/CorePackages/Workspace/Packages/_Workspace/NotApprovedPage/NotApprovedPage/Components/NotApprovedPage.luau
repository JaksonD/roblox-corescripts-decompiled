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
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return v17.memo(function(v33) --[[ Line: 60 ]] --[[ Name: NotApprovedPage ]]
    -- upvalues: l_useState_0 (copy), l_UserInputService_0 (copy), l_useSelector_0 (copy), v31 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useEffect_0 (copy), v10 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_FFlagEnableNapIxpLayerExposure_0 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), v1 (copy), l_EVENT_TYPES_0 (copy), v4 (copy), l_TRANSLATION_KEYS_0 (copy), v2 (copy), v3 (copy), l_useLocalization_0 (copy), l_useCallback_0 (copy), v17 (copy), v9 (copy), v11 (copy), l_NotApprovedPageProvider_0 (copy), l_PageNavigationProvider_0 (copy), l_PageAnalyticsProvider_0 (copy), l_FullPageModal_0 (copy), v5 (copy)
    local v34, v35 = l_useState_0(true);
    local v36, v37 = l_useState_0(nil);
    local l_Y_0 = l_UserInputService_0.StatusBarSize.Y;
    local v40 = l_useSelector_0(function(v39) --[[ Line: 65 ]]
        return v39.ScreenSize;
    end);
    local l_moderationDetail_0 = v33.moderationDetail;
    local l_punishmentTypeDescription_0 = l_moderationDetail_0.punishmentTypeDescription;
    local l_interventionType_0 = v33.interventionType;
    local v44 = if v31 then l_useRoactService_0(l_RoactNetworking_0) else nil;
    l_useEffect_0(function() --[[ Line: 76 ]]
        -- upvalues: v31 (ref), v10 (ref), v44 (copy), v37 (copy), v35 (copy)
        if v31 then
            v10(v44):andThen(function(v45) --[[ Line: 79 ]]
                -- upvalues: v37 (ref)
                if v45.responseBody then
                    v37(v45.responseBody);
                end;
            end):catch(function(_) --[[ Line: 84 ]]
                -- upvalues: v37 (ref)
                v37({
                    educational_pass_eligible = false
                });
            end):finally(function() --[[ Line: 90 ]]
                -- upvalues: v35 (ref)
                v35(false);
            end);
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v44
    } else l_dependencyArray_0(v44));
    l_useEffect_0(function() --[[ Line: 96 ]]
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
    local v48 = l_useLocalization_0(l_l_TRANSLATION_KEYS_0_0);
    local v49 = l_useCallback_0(function() --[[ Line: 121 ]]
        -- upvalues: v17 (ref), v9 (ref), l_moderationDetail_0 (copy), v33 (copy)
        return v17.createElement(v9, {
            moderationDetail = l_moderationDetail_0, 
            LogoutThunk = v33.LogoutThunk
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        l_moderationDetail_0, 
        v33.LogoutThunk
    } else l_dependencyArray_0(l_moderationDetail_0, v33.LogoutThunk));
    if v31 and v34 then
        return v17.createElement(v11, {
            title = v48[l_punishmentTypeDescription_0] or ""
        });
    else
        return v17.createElement(l_NotApprovedPageProvider_0, if v31 then {
            translations = v48, 
            moderationDetail = l_moderationDetail_0, 
            commutationEligibility = v36
        } else {
            translations = v48, 
            moderationDetail = l_moderationDetail_0
        }, v17.createElement(l_PageNavigationProvider_0, {
            moderationDetail = l_moderationDetail_0
        }, v17.createElement(l_PageAnalyticsProvider_0, nil, v17.createElement(l_FullPageModal_0, {
            title = v48[l_punishmentTypeDescription_0], 
            screenSize = v40, 
            marginSize = 0, 
            distanceFromTop = l_Y_0, 
            footerContent = v49
        }, {
            Content = v17.createElement(v5, if v31 then {
                moderationDetail = l_moderationDetail_0, 
                LogoutThunk = v33.LogoutThunk, 
                commutationEligibility = v36
            } else {
                moderationDetail = l_moderationDetail_0, 
                LogoutThunk = v33.LogoutThunk
            })
        }))));
    end;
end);