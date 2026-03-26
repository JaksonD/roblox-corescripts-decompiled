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
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
return function() --[[ Line: 48 ]] --[[ Name: BlockingModal ]]
    -- upvalues: l_useNavigation_0 (copy), l_FFlagDisableBlockAndReport_0 (copy), l_useLocalUserId_0 (copy), l_useDispatch_0 (copy), l_useScreenSize_0 (copy), l_useLayerCollector_0 (copy), v2 (copy), l_useSocialBlockingModalAnalytics_0 (copy), l_EventNames_0 (copy), v22 (copy), v21 (copy), l_FFlagEnableAbuseReportRevampFlow_0 (copy), l_OpenDynamicAbuseReport_0 (copy), l_AbuseVector_0 (copy), l_CloseCentralOverlay_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_Url_0 (copy), v16 (copy), l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), l_ButtonType_0 (copy), l_InteractiveAlert_0 (copy)
    local v29 = l_useNavigation_0();
    local v30 = v29.getParam("navProps");
    local l_userId_0 = v30.userId;
    local l_onBlockSuccess_0 = v30.onBlockSuccess;
    local l_openReportUser_0 = v30.openReportUser;
    local v34 = if l_FFlagDisableBlockAndReport_0 then v30.disableReportOption else nil;
    local v35 = l_useLocalUserId_0();
    local v36 = l_useDispatch_0();
    local v37 = l_useScreenSize_0();
    local v38 = l_useLayerCollector_0();
    if not v37 and v38 and v38.absoluteSize then
        v37 = v38.absoluteSize;
    end;
    local v39 = v2.useCallback(function() --[[ Line: 66 ]]
        -- upvalues: v29 (copy)
        v29.pop();
    end, {
        v29
    });
    local l_fireAnalyticsEvent_0 = l_useSocialBlockingModalAnalytics_0({
        userId = l_userId_0
    }).fireAnalyticsEvent;
    v2.useEffect(function() --[[ Line: 72 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref)
        l_fireAnalyticsEvent_0(l_EventNames_0.SocialBlockingModalSeen);
    end, {
        l_userId_0
    });
    local v41 = v22();
    local v43 = v2.useCallback(function() --[[ Line: 78 ]]
        -- upvalues: v36 (copy), v21 (ref), l_userId_0 (copy), v35 (copy), l_onBlockSuccess_0 (copy), v41 (copy), v39 (copy)
        v36(v21.BlockUserById.API({
            userId = l_userId_0, 
            currentUserId = v35
        })):andThen(function() --[[ Line: 83 ]]
            -- upvalues: l_onBlockSuccess_0 (ref)
            if l_onBlockSuccess_0 then
                l_onBlockSuccess_0();
            end;
        end):catch(function(v42) --[[ Line: 88 ]]
            -- upvalues: v41 (ref)
            v41(v42);
        end);
        v39();
    end, {
        l_onBlockSuccess_0, 
        v39, 
        l_userId_0, 
        v35, 
        v36, 
        v41
    });
    local v44 = v2.useCallback(function() --[[ Line: 95 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v43 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.SocialBlockingModalBlockPressed);
        v43();
    end, {
        v43, 
        l_userId_0, 
        l_fireAnalyticsEvent_0
    });
    local v45 = v2.useCallback(function() --[[ Line: 101 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v43 (copy), l_openReportUser_0 (copy), l_FFlagEnableAbuseReportRevampFlow_0 (ref), v36 (copy), l_OpenDynamicAbuseReport_0 (ref), l_AbuseVector_0 (ref), l_userId_0 (copy), l_CloseCentralOverlay_0 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_Url_0 (ref)
        l_fireAnalyticsEvent_0(l_EventNames_0.SocialBlockingModalBlockAndReportPressed);
        v43();
        if l_openReportUser_0 then
            l_openReportUser_0();
            return;
        elseif l_FFlagEnableAbuseReportRevampFlow_0 then
            v36(l_OpenDynamicAbuseReport_0({
                abuseVector = l_AbuseVector_0.UserProfile, 
                targetId = l_userId_0, 
                onClose = function() --[[ Line: 112 ]] --[[ Name: onClose ]]
                    -- upvalues: v36 (ref), l_CloseCentralOverlay_0 (ref)
                    v36(l_CloseCentralOverlay_0());
                end
            }));
            return;
        else
            v36(l_NavigateDown_0({
                name = l_AppPage_0.GenericWebPage, 
                detail = ("%*abusereport/userprofile?id=%*"):format(l_Url_0.BASE_URL, l_userId_0), 
                extraProps = {
                    title = ""
                }
            }));
            return;
        end;
    end, {
        v43, 
        v36, 
        l_userId_0, 
        l_fireAnalyticsEvent_0, 
        l_openReportUser_0
    });
    local v46 = v2.useCallback(function() --[[ Line: 136 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v39 (copy)
        l_fireAnalyticsEvent_0(l_EventNames_0.SocialBlockingModalCancelPressed);
        v39();
    end, {
        v39, 
        l_fireAnalyticsEvent_0
    });
    local v47 = v16.Hooks.useUserProfilesFetch({
        userIds = {
            l_userId_0
        }, 
        query = v16.Queries.userProfilesCombinedNameByUserIds
    });
    local v48 = if v47.data then v16.Selectors.getCombinedNameFromId(v47.data, l_userId_0) else nil;
    local v49 = l_useLocalization_0({
        title = {
            "Feature.BlockingModal.Heading.BlockUser"; 
            DisplayName = v48
        }, 
        bodyText = l_FFlagConnectionsToFriendsRename_0 and "Feature.BlockingModal.Message.BlockConfirmation.FriendsRename" or "Feature.BlockingModal.Message.BlockConfirmation", 
        cancelBtnText = "Feature.BlockingModal.Action.Cancel", 
        blockBtnText = "Feature.BlockingModal.Action.Block", 
        blockAndReportBtnText = "Feature.BlockingModal.Action.BlockAndReport"
    });
    local v51 = v2.useMemo(function() --[[ Line: 164 ]]
        -- upvalues: l_ButtonType_0 (ref), v49 (copy), v46 (copy), l_FFlagDisableBlockAndReport_0 (ref), v34 (copy), v45 (copy), v44 (copy)
        local v50 = {};
        table.insert(v50, {
            buttonType = l_ButtonType_0.Secondary, 
            props = {
                text = v49.cancelBtnText, 
                onActivated = v46
            }
        });
        if not l_FFlagDisableBlockAndReport_0 or not v34 then
            table.insert(v50, {
                buttonType = l_ButtonType_0.Alert, 
                props = {
                    text = v49.blockAndReportBtnText, 
                    onActivated = v45
                }
            });
        end;
        table.insert(v50, {
            buttonType = l_ButtonType_0.Alert, 
            props = {
                text = v49.blockBtnText, 
                onActivated = v44
            }
        });
        return v50;
    end, {
        v49, 
        v46, 
        v45, 
        v34, 
        v44
    });
    return v2.createElement(l_InteractiveAlert_0, {
        screenSize = v37, 
        title = v49.title, 
        bodyText = v49.bodyText, 
        richText = true, 
        buttonStackInfo = {
            buttons = v51 or {}
        }
    });
end;