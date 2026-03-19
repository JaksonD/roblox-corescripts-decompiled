local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local v1 = require(l_script_FirstAncestor_0.Utils.sendNotApprovedPageEvent);
local v2 = require(l_script_FirstAncestor_0.Utils.setBadUtterancesTranslationKeys);
local v3 = require(l_script_FirstAncestor_0.Utils.setViolationEvidenceTranslationKeys);
local v4 = require(l_script_FirstAncestor_0.Components.CTAButtons);
local v5 = require(l_script_FirstAncestor_0.Utils.canReactivate);
local v6 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.PageItemsFromConfigs);
local l_NotApprovedPageProvider_0 = require(l_script_FirstAncestor_0.Contexts.NotApprovedPageContext).NotApprovedPageProvider;
local l_PageNavigationProvider_0 = require(l_script_FirstAncestor_0.Contexts.PageNavigationContext).PageNavigationProvider;
local l_PageAnalyticsProvider_0 = require(l_script_FirstAncestor_0.Contexts.PageAnalyticsContext).PageAnalyticsProvider;
local v10 = require(l_script_FirstAncestor_0.Components.cta.CtaButtonsContainer);
local v11 = require(l_script_FirstAncestor_0.Http.GetCommutationEligibility);
local v12 = require(l_script_FirstAncestor_0.Components.LoadingDialog);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Constants_0 = require(l_Parent_0.NotApprovedPageState).Constants;
local l_TRANSLATION_KEYS_0 = l_Constants_0.TRANSLATION_KEYS;
local l_EVENT_TYPES_0 = l_Constants_0.EVENT_TYPES;
local v18 = require(l_Parent_0.React);
local l_useState_0 = v18.useState;
local l_useCallback_0 = v18.useCallback;
local l_useEffect_0 = v18.useEffect;
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
local v32 = require(l_script_FirstAncestor_0.Flags.FFlagEnableNapPageNavigationContext);
local v33 = require(l_script_FirstAncestor_0.Flags.FFlagEnableNapMiddlePages);
return v18.memo(function(v34) --[[ Line: 60 ]] --[[ Name: NotApprovedPage ]]
    -- upvalues: l_useState_0 (copy), l_UserInputService_0 (copy), l_useSelector_0 (copy), v33 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useEffect_0 (copy), v11 (copy), l_dependencyArray_0 (copy), l_FFlagEnableNapIxpLayerExposure_0 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), v1 (copy), l_EVENT_TYPES_0 (copy), v5 (copy), l_TRANSLATION_KEYS_0 (copy), v2 (copy), v3 (copy), l_useLocalization_0 (copy), l_useCallback_0 (copy), v32 (copy), v18 (copy), v10 (copy), v4 (copy), v12 (copy), l_NotApprovedPageProvider_0 (copy), l_PageNavigationProvider_0 (copy), l_PageAnalyticsProvider_0 (copy), l_FullPageModal_0 (copy), v6 (copy)
    local v35, v36 = l_useState_0(1);
    local v37, v38 = l_useState_0(true);
    local v39, v40 = l_useState_0(nil);
    local l_Y_0 = l_UserInputService_0.StatusBarSize.Y;
    local v43 = l_useSelector_0(function(v42) --[[ Line: 66 ]]
        return v42.ScreenSize;
    end);
    local l_moderationDetail_0 = v34.moderationDetail;
    local l_punishmentTypeDescription_0 = l_moderationDetail_0.punishmentTypeDescription;
    local l_interventionType_0 = v34.interventionType;
    local v47 = if v33 then l_useRoactService_0(l_RoactNetworking_0) else nil;
    l_useEffect_0(function() --[[ Line: 77 ]]
        -- upvalues: v33 (ref), v11 (ref), v47 (copy), v40 (copy), v38 (copy)
        if v33 then
            v11(v47):andThen(function(v48) --[[ Line: 80 ]]
                -- upvalues: v40 (ref)
                if v48.responseBody then
                    v40(v48.responseBody);
                end;
            end):catch(function(_) --[[ Line: 85 ]]
                -- upvalues: v40 (ref)
                v40({
                    educational_pass_eligible = false
                });
            end):finally(function() --[[ Line: 91 ]]
                -- upvalues: v38 (ref)
                v38(false);
            end);
        end;
    end, l_dependencyArray_0(v47));
    l_useEffect_0(function() --[[ Line: 97 ]]
        -- upvalues: l_FFlagEnableNapIxpLayerExposure_0 (ref), l_IXPService_0 (ref), l_AppUserLayers_0 (ref), v1 (ref), l_EVENT_TYPES_0 (ref), l_moderationDetail_0 (copy), v5 (ref), l_interventionType_0 (copy)
        if l_FFlagEnableNapIxpLayerExposure_0 and game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then
            l_IXPService_0:LogFlagLinkedUserLayerExposure(l_AppUserLayers_0.NotApprovedPageUserIDLayer);
        end;
        v1({
            eventType = l_EVENT_TYPES_0.PageRendered, 
            interventionId = l_moderationDetail_0.interventionId, 
            verificationCategory = l_moderationDetail_0.verificationCategory, 
            isReactivationEligible = tostring(v5(l_interventionType_0, l_moderationDetail_0.endDate, l_moderationDetail_0.verificationCategory)), 
            punishedUserId = l_moderationDetail_0.punishedUserId
        });
    end, {});
    local l_l_TRANSLATION_KEYS_0_0 = l_TRANSLATION_KEYS_0;
    v2(l_moderationDetail_0, l_l_TRANSLATION_KEYS_0_0);
    v3(l_moderationDetail_0, l_l_TRANSLATION_KEYS_0_0);
    local v51 = l_useLocalization_0(l_l_TRANSLATION_KEYS_0_0);
    local v52 = l_useCallback_0(function() --[[ Line: 122 ]]
        -- upvalues: v32 (ref), v18 (ref), v10 (ref), l_moderationDetail_0 (copy), v34 (copy), v4 (ref), v35 (copy), v36 (copy)
        if v32 then
            return v18.createElement(v10, {
                moderationDetail = l_moderationDetail_0, 
                LogoutThunk = v34.LogoutThunk
            });
        else
            return v18.createElement(v4, {
                moderationDetail = l_moderationDetail_0, 
                page = v35, 
                setPage = v36, 
                LogoutThunk = v34.LogoutThunk
            });
        end;
    end, l_dependencyArray_0(l_moderationDetail_0, v35, v34.LogoutThunk));
    local v53 = l_useCallback_0(function() --[[ Line: 138 ]]
        -- upvalues: v36 (copy), v35 (copy), v1 (ref), l_EVENT_TYPES_0 (ref)
        v36(v35 - 1);
        v1({
            eventType = l_EVENT_TYPES_0.BackClicked
        });
    end, l_dependencyArray_0(v35));
    if v33 and v37 then
        return v18.createElement(v12, {
            title = v51[l_punishmentTypeDescription_0] or ""
        });
    else
        return v18.createElement(l_NotApprovedPageProvider_0, if v33 then {
            translations = v51, 
            moderationDetail = l_moderationDetail_0, 
            commutationEligibility = v39
        } else {
            translations = v51, 
            moderationDetail = l_moderationDetail_0
        }, if v32 then v18.createElement(l_PageNavigationProvider_0, {
            moderationDetail = l_moderationDetail_0, 
            page = v35
        }, v18.createElement(l_PageAnalyticsProvider_0, nil, v18.createElement(l_FullPageModal_0, {
            title = v51[l_punishmentTypeDescription_0], 
            screenSize = v43, 
            marginSize = 0, 
            distanceFromTop = l_Y_0, 
            footerContent = v52
        }, {
            Content = v18.createElement(v6, if v33 then {
                moderationDetail = l_moderationDetail_0, 
                page = v35, 
                LogoutThunk = v34.LogoutThunk, 
                goBackOnePage = v53, 
                commutationEligibility = v39
            } else {
                moderationDetail = l_moderationDetail_0, 
                page = v35, 
                LogoutThunk = v34.LogoutThunk, 
                goBackOnePage = v53
            })
        }))) else v18.createElement(l_FullPageModal_0, {
            title = v51[l_punishmentTypeDescription_0], 
            screenSize = v43, 
            marginSize = 0, 
            distanceFromTop = l_Y_0, 
            footerContent = v52
        }, {
            Content = v18.createElement(v6, {
                moderationDetail = l_moderationDetail_0, 
                page = v35, 
                LogoutThunk = v34.LogoutThunk, 
                goBackOnePage = v53
            })
        }));
    end;
end);