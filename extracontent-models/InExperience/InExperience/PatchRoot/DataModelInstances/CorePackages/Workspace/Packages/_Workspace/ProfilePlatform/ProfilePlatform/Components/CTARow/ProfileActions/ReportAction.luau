local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Http);
local v3 = require(l_Parent_0.SharedFlags);
local v4 = require(l_Parent_0.RobloxAppEnums);
local l_Url_0 = v2.Url;
local l_AppPage_0 = v4.AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_CloseCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
local v9 = require(l_Parent_0.GenericAbuseReporting);
local l_AbuseVector_0 = v9.Enums.AbuseVector;
local l_OpenDynamicAbuseReport_0 = v9.Thunks.OpenDynamicAbuseReport;
local v12 = require(l_script_FirstAncestor_0.Networking.refreshProfilePlatformActionInfo);
local v13 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v14 = require(l_script_FirstAncestor_0.Common.Enums);
local _ = require(l_script_FirstAncestor_0.Components.CTARow.Types);
local v16 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_FFlagEnableAbuseReportRevampFlow_0 = v3.FFlagEnableAbuseReportRevampFlow;
local v18 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableCommunityProfilePage);
local v19 = require(l_script_FirstAncestor_0.Flags.FFlagEnableAbuseReportRevampProfileAndGroup);
return {
    [v14.ProfileActions.Report] = function(v20) --[[ Line: 34 ]]
        -- upvalues: v14 (copy), v16 (copy), v18 (copy), l_FFlagEnableAbuseReportRevampFlow_0 (copy), v19 (copy), l_AbuseVector_0 (copy), l_OpenDynamicAbuseReport_0 (copy), l_CloseCentralOverlay_0 (copy), v12 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_Url_0 (copy), v13 (copy)
        return {
            text = v20.localized[v14.ProfileActions.Report], 
            onActivated = function() --[[ Line: 37 ]] --[[ Name: onActivated ]]
                -- upvalues: v20 (copy), v16 (ref), v18 (ref), v14 (ref), l_FFlagEnableAbuseReportRevampFlow_0 (ref), v19 (ref), l_AbuseVector_0 (ref), l_OpenDynamicAbuseReport_0 (ref), l_CloseCentralOverlay_0 (ref), v12 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_Url_0 (ref), v13 (ref)
                v20.analytics.fireAnalyticsEvent(v16.ContextualMenuButtonReport, {
                    buttonSurface = v20.buttonSurface
                });
                local v21 = nil;
                if v18 then
                    if v20.profileType == v14.ProfileTypes.User then
                        v21 = "userprofile";
                    elseif v20.profileType == v14.ProfileTypes.Community then
                        v21 = "group";
                    end;
                end;
                if l_FFlagEnableAbuseReportRevampFlow_0 and v19 then
                    local l_UserProfile_0 = l_AbuseVector_0.UserProfile;
                    if v18 and v20.profileType == v14.ProfileTypes.Community then
                        l_UserProfile_0 = l_AbuseVector_0.Group;
                    end;
                    v20.dispatch(l_OpenDynamicAbuseReport_0({
                        abuseVector = l_UserProfile_0, 
                        targetId = v20.profileId, 
                        onClose = function() --[[ Line: 60 ]] --[[ Name: onClose ]]
                            -- upvalues: v20 (ref), l_CloseCentralOverlay_0 (ref), v12 (ref)
                            v20.dispatch(l_CloseCentralOverlay_0());
                            v20.dispatch(v12(v20.profileId));
                        end
                    }));
                    return;
                else
                    v20.dispatch(l_NavigateDown_0({
                        name = l_AppPage_0.GenericWebPage, 
                        detail = if v18 then ("%*abusereport/%*?id=%*"):format(l_Url_0.BASE_URL, v21, v20.profileId) else string.format("%sabusereport/userprofile?id=%s", l_Url_0.BASE_URL, v20.profileId), 
                        extraProps = {
                            titleKey = v13.Report
                        }
                    }));
                    return;
                end;
            end
        };
    end
};