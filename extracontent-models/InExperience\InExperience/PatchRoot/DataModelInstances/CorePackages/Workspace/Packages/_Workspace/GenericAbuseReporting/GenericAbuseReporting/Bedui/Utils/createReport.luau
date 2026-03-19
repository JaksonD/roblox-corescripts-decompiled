local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Bedui.Provider.AbuseReportBeduiTypes);
local v3 = require(l_script_FirstAncestor_0.Enums.AbuseVector);
local v4 = game:DefineFastFlag("UpdateAbuseReportRevampItemAbuseVector", false);
local l_FFlagFixNotificationReportsMobile_0 = require(l_Parent_0.SharedFlags).FFlagFixNotificationReportsMobile;
local l_FFlagLuaAppEnableReportBadge_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableReportBadge;
return function(v7) --[[ Line: 26 ]]
    -- upvalues: v3 (copy), l_FFlagFixNotificationReportsMobile_0 (copy), l_FFlagLuaAppEnableReportBadge_0 (copy), v4 (copy)
    local v8 = {};
    if v7.abuseVector == v3.Looks then
        local l_targetId_0 = v7.targetId;
        v8.REPORT_TARGET_LOOK_ID = l_targetId_0.lookId;
        v8.REPORT_TARGET_LOOK_INCLUDED_ASSET_IDS = l_targetId_0.lookAssetsIds;
    elseif v7.abuseVector == v3.UgcBundle then
        v8.UGC_BUNDLE_ID = v7.targetId;
    elseif v7.abuseVector == v3.ContentPostScreenshot then
        v8.CONTENT_POST_ID = v7.targetId;
    elseif v7.abuseVector == v3.UserProfile then
        v8.REPORT_TARGET_USER_ID = v7.targetId;
    elseif v7.abuseVector == v3.Accessory then
        v8.REPORT_TARGET_ASSET_ID = v7.targetId;
    elseif v7.abuseVector == v3.Place then
        v8.REPORT_TARGET_ASSET_ID = v7.targetId;
    elseif v7.abuseVector == v3.Group then
        v8.REPORT_TARGET_GROUP_ID = v7.targetId;
    elseif l_FFlagFixNotificationReportsMobile_0 and v7.abuseVector == v3.Notifications then
        v8.NOTIFICATION_ID = v7.targetId;
    elseif l_FFlagLuaAppEnableReportBadge_0 and v7.abuseVector == v3.Badge then
        v8.REPORT_TARGET_BADGE_ID = v7.targetId;
    end;
    v8.ENTRY_POINT = "in-app";
    v8.SUBMITTER_USER_ID = v7.submitterId;
    v8.REPORTED_ABUSE_CATEGORY = v7.abuseCategory;
    v8.REPORTER_COMMENT = v7.comment or "";
    if v4 and v7.abuseVector == v3.Accessory then
        v8.REPORTED_ABUSE_VECTOR = v7.custom and v7.custom.assetTypeName or v3.Accessory;
        if v8.REPORTED_ABUSE_VECTOR == "EmoteAnimation" then
            v8.REPORTED_ABUSE_VECTOR = v3.Accessory;
            return v8;
        end;
    else
        v8.REPORTED_ABUSE_VECTOR = v7.abuseVector;
    end;
    return v8;
end;