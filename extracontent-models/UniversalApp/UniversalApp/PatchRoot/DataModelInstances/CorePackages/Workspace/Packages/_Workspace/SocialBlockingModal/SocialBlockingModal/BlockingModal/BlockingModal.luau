local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialBlockingModal");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RobloxAppHooks);
local l_useScreenSize_0 = v3.useScreenSize;
local l_useLocalUserId_0 = v3.useLocalUserId;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_Url_0 = require(l_Parent_0.Http).Url;
local v12 = require(l_Parent_0.UIBlox);
local l_ButtonType_0 = v12.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v12.App.Dialog.Alert.InteractiveAlert;
local l_useLayerCollector_0 = v12.Core.Layout.LayerCollector.useLayerCollector;
local v16 = require(l_Parent_0.UserProfiles);
local v17 = require(l_Parent_0.GenericAbuseReporting);
local l_AbuseVector_0 = v17.Enums.AbuseVector;
local l_OpenDynamicAbuseReport_0 = v17.Thunks.OpenDynamicAbuseReport;
local l_CloseCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
local v21 = require(l_script_FirstAncestor_0.Networking.myUserBlockingNetworking);
local v22 = require(script.Parent.useShowToastOnError);
local v23 = require(script.Parent.Parent.Analytics);
local l_useSocialBlockingModalAnalytics_0 = v23.useSocialBlockingModalAnalytics;
local l_EventNames_0 = v23.EventNames;
local l_FFlagEnableAbuseReportRevampFlow_0 = require(l_Parent_0.SharedFlags).FFlagEnableAbuseReportRevampFlow;
local l_FFlagDisableBlockAndReport_0 = require(l_Parent_0.SharedFlags).FFlagDisableBlockAndReport;
return function() --[[ Line: 47 ]] --[[ Name: BlockingModal ]]
    -- upvalues: l_useNavigation_0 (copy), l_FFlagDisableBlockAndReport_0 (copy), l_useLocalUserId_0 (copy), l_useDispatch_0 (copy), l_useScreenSize_0 (copy), l_useLayerCollector_0 (copy), v2 (copy), l_useSocialBlockingModalAnalytics_0 (copy), l_EventNames_0 (copy), v22 (copy), v21 (copy), l_FFlagEnableAbuseReportRevampFlow_0 (copy), l_OpenDynamicAbuseReport_0 (copy), l_AbuseVector_0 (copy), l_CloseCentralOverlay_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_Url_0 (copy), v16 (copy), l_useLocalization_0 (copy), l_ButtonType_0 (copy), l_InteractiveAlert_0 (copy)
    local v28 = l_useNavigation_0();
    local v29 = v28.getParam("navProps");
    local l_userId_0 = v29.userId;
    local l_onBlockSuccess_0 = v29.onBlockSuccess;
    local l_openReportUser_0 = v29.openReportUser;
    local v33 = if l_FFlagDisableBlockAndReport_0 then v29.disableReportOption else nil;
    local v34 = l_useLocalUserId_0();
    local v35 = l_useDispatch_0();
    local v36 = l_useScreenSize_0();
    local v37 = l_useLayerCollector_0();
    if not v36 and v37 and v37.absoluteSize then
        v36 = v37.absoluteSize;
    end;
    local v38 = v2.useCallback(function() --[[ Line: 65 ]]
        -- upvalues: v28 (copy)
        v28.pop();
    end, {
        v28
    });
    local l_fireAnalyticsEvent_0 = l_useSocialBlockingModalAnalytics_0({
        userId = l_userId_0
    }).fireAnalyticsEvent;
    v2.useEffect(function() --[[ Line: 71 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref)
        l_fireAnalyticsEvent_0(l_EventNames_0.SocialBlockingModalSeen);
    end, {
        l_userId_0
    });
    local v40 = v22();
    local v42 = v2.useCallback(function() --[[ Line: 77 ]]
        -- upvalues: v35 (copy), v21 (ref), l_userId_0 (copy), v34 (copy), l_onBlockSuccess_0 (copy), v40 (copy), v38 (copy)
        v35(v21.BlockUserById.API({
            userId = l_userId_0, 
            currentUserId = v34
        })):andThen(function() --[[ Line: 82 ]]
            -- upvalues: l_onBlockSuccess_0 (ref)
            if l_onBlockSuccess_0 then
                l_onBlockSuccess_0();
            end;
        end):catch(function(v41) --[[ Line: 87 ]]
            -- upvalues: v40 (ref)
            v40(v41);
        end);
        v38();
    end, {
        l_onBlockSuccess_0, 
        v38, 
        l_userId_0, 
        v34, 
        v35, 
        v40
    });
    local v43 = v2.useCallback(function() --[[ Line: 94 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v42 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.SocialBlockingModalBlockPressed);
        v42();
    end, {
        v42, 
        l_userId_0, 
        l_fireAnalyticsEvent_0
    });
    local v44 = v2.useCallback(function() --[[ Line: 100 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v42 (copy), l_openReportUser_0 (copy), l_FFlagEnableAbuseReportRevampFlow_0 (ref), v35 (copy), l_OpenDynamicAbuseReport_0 (ref), l_AbuseVector_0 (ref), l_userId_0 (copy), l_CloseCentralOverlay_0 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_Url_0 (ref)
        l_fireAnalyticsEvent_0(l_EventNames_0.SocialBlockingModalBlockAndReportPressed);
        v42();
        if l_openReportUser_0 then
            l_openReportUser_0();
            return;
        elseif l_FFlagEnableAbuseReportRevampFlow_0 then
            v35(l_OpenDynamicAbuseReport_0({
                abuseVector = l_AbuseVector_0.UserProfile, 
                targetId = l_userId_0, 
                onClose = function() --[[ Line: 111 ]] --[[ Name: onClose ]]
                    -- upvalues: v35 (ref), l_CloseCentralOverlay_0 (ref)
                    v35(l_CloseCentralOverlay_0());
                end
            }));
            return;
        else
            v35(l_NavigateDown_0({
                name = l_AppPage_0.GenericWebPage, 
                detail = ("%*abusereport/userprofile?id=%*"):format(l_Url_0.BASE_URL, l_userId_0), 
                extraProps = {
                    title = ""
                }
            }));
            return;
        end;
    end, {
        v42, 
        v35, 
        l_userId_0, 
        l_fireAnalyticsEvent_0, 
        l_openReportUser_0
    });
    local v45 = v2.useCallback(function() --[[ Line: 135 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v38 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.SocialBlockingModalCancelPressed);
        v38();
    end, {
        v38, 
        l_fireAnalyticsEvent_0
    });
    local v46 = v16.Hooks.useUserProfilesFetch({
        userIds = {
            l_userId_0
        }, 
        query = v16.Queries.userProfilesCombinedNameByUserIds
    });
    local v47 = if v46.data then v16.Selectors.getCombinedNameFromId(v46.data, l_userId_0) else nil;
    local v48 = l_useLocalization_0({
        title = {
            "Feature.BlockingModal.Heading.BlockUser"; 
            DisplayName = v47
        }, 
        bodyText = "Feature.BlockingModal.Message.BlockConfirmation", 
        cancelBtnText = "Feature.BlockingModal.Action.Cancel", 
        blockBtnText = "Feature.BlockingModal.Action.Block", 
        blockAndReportBtnText = "Feature.BlockingModal.Action.BlockAndReport"
    });
    local v50 = v2.useMemo(function() --[[ Line: 161 ]]
        -- upvalues: l_ButtonType_0 (ref), v48 (copy), v45 (copy), l_FFlagDisableBlockAndReport_0 (ref), v33 (copy), v44 (copy), v43 (copy)
        local v49 = {};
        table.insert(v49, {
            buttonType = l_ButtonType_0.Secondary, 
            props = {
                text = v48.cancelBtnText, 
                onActivated = v45
            }
        });
        if not l_FFlagDisableBlockAndReport_0 or not v33 then
            table.insert(v49, {
                buttonType = l_ButtonType_0.Alert, 
                props = {
                    text = v48.blockAndReportBtnText, 
                    onActivated = v44
                }
            });
        end;
        table.insert(v49, {
            buttonType = l_ButtonType_0.Alert, 
            props = {
                text = v48.blockBtnText, 
                onActivated = v43
            }
        });
        return v49;
    end, {
        v48, 
        v45, 
        v44, 
        v33, 
        v43
    });
    return v2.createElement(l_InteractiveAlert_0, {
        screenSize = v36, 
        title = v48.title, 
        bodyText = v48.bodyText, 
        richText = true, 
        buttonStackInfo = {
            buttons = v50 or {}
        }
    });
end;