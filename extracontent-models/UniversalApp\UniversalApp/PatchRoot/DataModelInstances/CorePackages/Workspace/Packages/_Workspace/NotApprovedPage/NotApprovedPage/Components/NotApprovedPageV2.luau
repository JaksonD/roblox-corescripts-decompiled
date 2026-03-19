local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_IXPService_0 = game:GetService("IXPService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v5 = require(l_script_FirstAncestor_0.Utils.canReactivate);
local v6 = require(l_script_FirstAncestor_0.Components.cta.CtaButtonsContainer);
local v7 = require(l_script_FirstAncestor_0.Components.CTAButtons);
local v8 = require(l_script_FirstAncestor_0.Http.GetCommutationEligibility);
local v9 = require(l_script_FirstAncestor_0.Utils.hasAnyCommutation);
local v10 = require(l_script_FirstAncestor_0.Components.header.Header);
local v11 = require(l_script_FirstAncestor_0.Components.LoadingSkeleton);
local l_NotApprovedPageProvider_0 = require(l_script_FirstAncestor_0.Contexts.NotApprovedPageContext).NotApprovedPageProvider;
local l_PageAnalyticsProvider_0 = require(l_script_FirstAncestor_0.Contexts.PageAnalyticsContext).PageAnalyticsProvider;
local v14 = require(l_script_FirstAncestor_0.Components.pageItemConfigs.PageItemsFromConfigs);
local l_PageNavigationProvider_0 = require(l_script_FirstAncestor_0.Contexts.PageNavigationContext).PageNavigationProvider;
local v16 = require(l_script_FirstAncestor_0.Utils.sendNotApprovedPageEvent);
local v17 = require(l_script_FirstAncestor_0.Utils.setBadUtterancesTranslationKeys);
local v18 = require(l_script_FirstAncestor_0.Utils.setViolationEvidenceTranslationKeys);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_Constants_0 = require(l_Parent_0.NotApprovedPageState).Constants;
local v21 = require(l_Parent_0.React);
local l_useCallback_0 = v21.useCallback;
local l_useEffect_0 = v21.useEffect;
local l_useState_0 = v21.useState;
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v30 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v30.usePreferredInput;
local l_View_0 = require(l_Parent_0.Foundation).View;
local v33 = require(l_script_FirstAncestor_0.Flags.FFlagReactivationNoticeIxpExposure);
local v34 = require(l_script_FirstAncestor_0.Flags.FFlagEnableNapMiddlePages);
local v35 = require(l_script_FirstAncestor_0.Flags.FFlagEnableNapPageNavigationContext);
local l_EVENT_TYPES_0 = l_Constants_0.EVENT_TYPES;
local l_TRANSLATION_KEYS_0 = l_Constants_0.TRANSLATION_KEYS;
return v21.memo(function(v38) --[[ Line: 66 ]] --[[ Name: NotApprovedPageV2 ]]
    -- upvalues: l_useState_0 (copy), l_UserInputService_0 (copy), l_GuiService_0 (copy), v34 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_usePreferredInput_0 (copy), v30 (copy), l_useEffect_0 (copy), v8 (copy), l_dependencyArray_0 (copy), v33 (copy), v5 (copy), v9 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), v16 (copy), l_EVENT_TYPES_0 (copy), l_TRANSLATION_KEYS_0 (copy), v17 (copy), v18 (copy), l_useLocalization_0 (copy), v35 (copy), v21 (copy), v6 (copy), v7 (copy), l_useCallback_0 (copy), v11 (copy), l_NotApprovedPageProvider_0 (copy), l_PageNavigationProvider_0 (copy), l_PageAnalyticsProvider_0 (copy), l_View_0 (copy), v10 (copy), v14 (copy)
    local v39, v40 = l_useState_0(1);
    local v41, v42 = l_useState_0(true);
    local v43, v44 = l_useState_0(nil);
    local l_Y_0 = l_UserInputService_0.StatusBarSize.Y;
    local l_Y_1 = l_UserInputService_0.BottomBarSize.Y;
    local l_bottom_0 = l_GuiService_0:GetSafeZoneOffsets().bottom;
    local v48 = if l_Y_1 == 0 then l_bottom_0 else l_Y_1;
    local l_moderationDetail_0 = v38.moderationDetail;
    local l_interventionType_0 = v38.interventionType;
    local l_verificationCategory_0 = l_moderationDetail_0.verificationCategory;
    local v52 = if v34 then l_useRoactService_0(l_RoactNetworking_0) else nil;
    local v53 = l_usePreferredInput_0() == v30.Input.Directional;
    l_useEffect_0(function() --[[ Line: 85 ]]
        -- upvalues: v34 (ref), v8 (ref), v52 (copy), v44 (copy), v42 (copy)
        if v34 then
            v8(v52):andThen(function(v54) --[[ Line: 88 ]]
                -- upvalues: v44 (ref)
                if v54.responseBody then
                    v44(v54.responseBody);
                end;
            end):catch(function(_) --[[ Line: 93 ]]
                -- upvalues: v44 (ref)
                v44({
                    educational_pass_eligible = false
                });
            end):finally(function() --[[ Line: 99 ]]
                -- upvalues: v42 (ref)
                v42(false);
            end);
        end;
    end, l_dependencyArray_0(v52));
    l_useEffect_0(function() --[[ Line: 106 ]]
        -- upvalues: v33 (ref), v5 (ref), l_interventionType_0 (copy), l_moderationDetail_0 (copy), v9 (ref), v43 (copy), l_verificationCategory_0 (copy), l_IXPService_0 (ref), l_AppUserLayers_0 (ref), v16 (ref), l_EVENT_TYPES_0 (ref)
        if v33 and game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") and v5(l_interventionType_0, l_moderationDetail_0.endDate, l_moderationDetail_0.verificationCategory) and not v9(v43) and (not l_verificationCategory_0 or l_verificationCategory_0 == "") then
            l_IXPService_0:LogFlagLinkedUserLayerExposure(l_AppUserLayers_0.NotApprovedPageUserIDLayer);
        end;
        v16({
            eventType = l_EVENT_TYPES_0.PageRendered, 
            interventionId = l_moderationDetail_0.interventionId, 
            verificationCategory = l_moderationDetail_0.verificationCategory, 
            isReactivationEligible = tostring(v5(l_interventionType_0, l_moderationDetail_0.endDate, l_moderationDetail_0.verificationCategory)), 
            punishedUserId = l_moderationDetail_0.punishedUserId
        });
    end, l_dependencyArray_0(l_interventionType_0, l_moderationDetail_0.endDate, l_moderationDetail_0.verificationCategory, v43));
    local l_l_TRANSLATION_KEYS_0_0 = l_TRANSLATION_KEYS_0;
    v17(l_moderationDetail_0, l_l_TRANSLATION_KEYS_0_0);
    v18(l_moderationDetail_0, l_l_TRANSLATION_KEYS_0_0);
    local v57 = l_useLocalization_0(l_l_TRANSLATION_KEYS_0_0);
    local v58 = if v35 then v21.createElement(v6, {
        moderationDetail = l_moderationDetail_0, 
        LogoutThunk = v38.LogoutThunk
    }) else v21.createElement(v7, {
        moderationDetail = l_moderationDetail_0, 
        page = v39, 
        setPage = v40, 
        LogoutThunk = v38.LogoutThunk
    });
    local v59 = l_useCallback_0(function() --[[ Line: 155 ]]
        -- upvalues: v40 (copy), v39 (copy), v16 (ref), l_EVENT_TYPES_0 (ref)
        v40(v39 - 1);
        v16({
            eventType = l_EVENT_TYPES_0.BackClicked
        });
    end, l_dependencyArray_0(v39));
    if v34 and v41 then
        return v21.createElement(v11);
    else
        return v21.createElement(l_NotApprovedPageProvider_0, if v34 then {
            translations = v57, 
            moderationDetail = l_moderationDetail_0, 
            commutationEligibility = v43
        } else {
            translations = v57, 
            moderationDetail = l_moderationDetail_0
        }, if v35 then v21.createElement(l_PageNavigationProvider_0, {
            moderationDetail = l_moderationDetail_0, 
            page = v39
        }, v21.createElement(l_PageAnalyticsProvider_0, nil, v21.createElement(l_View_0, {
            tag = "size-full col align-x-center align-y-center bg-surface-0", 
            padding = {
                top = UDim.new(0, l_Y_0), 
                bottom = UDim.new(0, v48)
            }
        }, {
            InnerContainer = v21.createElement(l_View_0, {
                tag = "size-full col bg-surface-100 radius-large stroke-default stroke-standard", 
                sizeConstraint = {
                    MaxSize = if v53 then Vector2.new(800, 1000) else Vector2.new(600, 800)
                }, 
                LayoutOrder = 1
            }, {
                HeaderSection = v21.createElement(v10, {
                    moderationDetail = l_moderationDetail_0, 
                    LogoutThunk = v38.LogoutThunk, 
                    LayoutOrder = 1
                }), 
                Content = v21.createElement(l_View_0, {
                    tag = "size-full-0 grow col", 
                    LayoutOrder = 2
                }, v21.createElement(v14, if v34 then {
                    moderationDetail = l_moderationDetail_0, 
                    page = v39, 
                    LogoutThunk = v38.LogoutThunk, 
                    goBackOnePage = v59, 
                    commutationEligibility = v43
                } else {
                    moderationDetail = l_moderationDetail_0, 
                    page = v39, 
                    LogoutThunk = v38.LogoutThunk, 
                    goBackOnePage = v59
                })), 
                Footer = v21.createElement(l_View_0, {
                    tag = "size-full-0 auto-y col", 
                    LayoutOrder = 3
                }, {
                    FooterContent = v58
                })
            })
        }))) else nil);
    end;
end);