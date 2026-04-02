local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_IXPService_0 = game:GetService("IXPService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v5 = require(l_script_FirstAncestor_0.Utils.canReactivate);
local v6 = require(l_script_FirstAncestor_0.Components.cta.CtaButtonsContainer);
local v7 = require(l_script_FirstAncestor_0.Http.GetCommutationEligibility);
local v8 = require(l_script_FirstAncestor_0.Utils.hasAnyCommutation);
local v9 = require(l_script_FirstAncestor_0.Components.header.Header);
local v10 = require(l_script_FirstAncestor_0.Components.LoadingSkeleton);
local l_NotApprovedPageProvider_0 = require(l_script_FirstAncestor_0.Contexts.NotApprovedPageContext).NotApprovedPageProvider;
local l_PageAnalyticsProvider_0 = require(l_script_FirstAncestor_0.Contexts.PageAnalyticsContext).PageAnalyticsProvider;
local v13 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.PageItemsFromConfigs);
local l_PageNavigationProvider_0 = require(l_script_FirstAncestor_0.Contexts.PageNavigationContext).PageNavigationProvider;
local v15 = require(l_script_FirstAncestor_0.Utils.sendNotApprovedPageEvent);
local v16 = require(l_script_FirstAncestor_0.Utils.setBadUtterancesTranslationKeys);
local v17 = require(l_script_FirstAncestor_0.Utils.setViolationEvidenceTranslationKeys);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_Constants_0 = require(l_Parent_0.NotApprovedPageState).Constants;
local v20 = require(l_Parent_0.React);
local l_useEffect_0 = v20.useEffect;
local l_useState_0 = v20.useState;
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v28 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v28.usePreferredInput;
local l_View_0 = require(l_Parent_0.Foundation).View;
local v31 = require(l_script_FirstAncestor_0.Flags.FFlagReactivationNoticeIxpExposure);
local v32 = require(l_script_FirstAncestor_0.Flags.FFlagEnableNapMiddlePages);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_EVENT_TYPES_0 = l_Constants_0.EVENT_TYPES;
local l_TRANSLATION_KEYS_0 = l_Constants_0.TRANSLATION_KEYS;
return v20.memo(function(v36) --[[ Line: 65 ]] --[[ Name: NotApprovedPageV2 ]]
    -- upvalues: l_useState_0 (copy), l_UserInputService_0 (copy), l_GuiService_0 (copy), v32 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_usePreferredInput_0 (copy), v28 (copy), l_useEffect_0 (copy), v7 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v31 (copy), v5 (copy), v8 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), v15 (copy), l_EVENT_TYPES_0 (copy), l_TRANSLATION_KEYS_0 (copy), v16 (copy), v17 (copy), l_useLocalization_0 (copy), v20 (copy), v6 (copy), v10 (copy), l_NotApprovedPageProvider_0 (copy), l_PageNavigationProvider_0 (copy), l_PageAnalyticsProvider_0 (copy), l_View_0 (copy), v9 (copy), v13 (copy)
    local v37, v38 = l_useState_0(true);
    local v39, v40 = l_useState_0(nil);
    local l_Y_0 = l_UserInputService_0.StatusBarSize.Y;
    local l_Y_1 = l_UserInputService_0.BottomBarSize.Y;
    local l_bottom_0 = l_GuiService_0:GetSafeZoneOffsets().bottom;
    local v44 = if l_Y_1 == 0 then l_bottom_0 else l_Y_1;
    local l_moderationDetail_0 = v36.moderationDetail;
    local l_interventionType_0 = v36.interventionType;
    local l_verificationCategory_0 = l_moderationDetail_0.verificationCategory;
    local v48 = if v32 then l_useRoactService_0(l_RoactNetworking_0) else nil;
    local v49 = l_usePreferredInput_0() == v28.Input.Directional;
    l_useEffect_0(function() --[[ Line: 83 ]]
        -- upvalues: v32 (ref), v7 (ref), v48 (copy), v40 (copy), v38 (copy)
        if v32 then
            v7(v48):andThen(function(v50) --[[ Line: 86 ]]
                -- upvalues: v40 (ref)
                if v50.responseBody then
                    v40(v50.responseBody);
                end;
            end):catch(function(_) --[[ Line: 91 ]]
                -- upvalues: v40 (ref)
                v40({
                    educational_pass_eligible = false
                });
            end):finally(function() --[[ Line: 97 ]]
                -- upvalues: v38 (ref)
                v38(false);
            end);
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v48
    } else l_dependencyArray_0(v48));
    l_useEffect_0(function() --[[ Line: 104 ]]
        -- upvalues: v31 (ref), v5 (ref), l_interventionType_0 (copy), l_moderationDetail_0 (copy), v8 (ref), v39 (copy), l_verificationCategory_0 (copy), l_IXPService_0 (ref), l_AppUserLayers_0 (ref), v15 (ref), l_EVENT_TYPES_0 (ref)
        if v31 and game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") and v5(l_interventionType_0, l_moderationDetail_0.endDate, l_moderationDetail_0.verificationCategory) and not v8(v39) and (not l_verificationCategory_0 or l_verificationCategory_0 == "") then
            l_IXPService_0:LogFlagLinkedUserLayerExposure(l_AppUserLayers_0.NotApprovedPageUserIDLayer);
        end;
        v15({
            eventType = l_EVENT_TYPES_0.PageRendered, 
            interventionId = l_moderationDetail_0.interventionId, 
            verificationCategory = l_moderationDetail_0.verificationCategory, 
            isReactivationEligible = tostring(v5(l_interventionType_0, l_moderationDetail_0.endDate, l_moderationDetail_0.verificationCategory)), 
            punishedUserId = l_moderationDetail_0.punishedUserId
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        l_interventionType_0, 
        l_moderationDetail_0.endDate, 
        l_moderationDetail_0.verificationCategory, 
        v39
    } else l_dependencyArray_0(l_interventionType_0, l_moderationDetail_0.endDate, l_moderationDetail_0.verificationCategory, v39));
    local l_l_TRANSLATION_KEYS_0_0 = l_TRANSLATION_KEYS_0;
    v16(l_moderationDetail_0, l_l_TRANSLATION_KEYS_0_0);
    v17(l_moderationDetail_0, l_l_TRANSLATION_KEYS_0_0);
    local v53 = l_useLocalization_0(l_l_TRANSLATION_KEYS_0_0);
    local v54 = v20.createElement(v6, {
        moderationDetail = l_moderationDetail_0, 
        LogoutThunk = v36.LogoutThunk
    });
    if v32 and v37 then
        return v20.createElement(v10);
    else
        return v20.createElement(l_NotApprovedPageProvider_0, if v32 then {
            translations = v53, 
            moderationDetail = l_moderationDetail_0, 
            commutationEligibility = v39
        } else {
            translations = v53, 
            moderationDetail = l_moderationDetail_0
        }, v20.createElement(l_PageNavigationProvider_0, {
            moderationDetail = l_moderationDetail_0
        }, v20.createElement(l_PageAnalyticsProvider_0, nil, v20.createElement(l_View_0, {
            tag = "size-full col align-x-center align-y-center bg-surface-0", 
            padding = {
                top = UDim.new(0, l_Y_0), 
                bottom = UDim.new(0, v44)
            }
        }, {
            InnerContainer = v20.createElement(l_View_0, {
                tag = "size-full col bg-surface-100 radius-large stroke-default stroke-standard", 
                sizeConstraint = {
                    MaxSize = if v49 then Vector2.new(800, 1000) else Vector2.new(600, 800)
                }, 
                LayoutOrder = 1
            }, {
                HeaderSection = v20.createElement(v9, {
                    moderationDetail = l_moderationDetail_0, 
                    LogoutThunk = v36.LogoutThunk, 
                    LayoutOrder = 1
                }), 
                Content = v20.createElement(l_View_0, {
                    tag = "size-full-0 grow col", 
                    LayoutOrder = 2
                }, v20.createElement(v13, if v32 then {
                    moderationDetail = l_moderationDetail_0, 
                    LogoutThunk = v36.LogoutThunk, 
                    commutationEligibility = v39
                } else {
                    moderationDetail = l_moderationDetail_0, 
                    LogoutThunk = v36.LogoutThunk
                })), 
                Footer = v20.createElement(l_View_0, {
                    tag = "size-full-0 auto-y col", 
                    LayoutOrder = 3
                }, {
                    FooterContent = v54
                })
            })
        }))));
    end;
end);