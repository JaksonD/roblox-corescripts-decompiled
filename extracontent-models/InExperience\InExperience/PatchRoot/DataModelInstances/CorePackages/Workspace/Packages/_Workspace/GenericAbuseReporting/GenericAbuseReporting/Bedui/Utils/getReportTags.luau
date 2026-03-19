local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local _ = require(l_script_FirstAncestor_0.Bedui.Provider.AbuseReportBeduiTypes);
local v4 = require(l_script_FirstAncestor_0.Enums.AbuseCategory);
local v5 = require(l_script_FirstAncestor_0.Enums.AbuseVector);
local l_FFlagFixNotificationReportsMobile_0 = require(l_Parent_0.SharedFlags).FFlagFixNotificationReportsMobile;
local l_FFlagLuaAppEnableSponsoredReportAd_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableSponsoredReportAd;
local l_FFlagLuaAppEnableReportBadge_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableReportBadge;
local function _(v9) --[[ Line: 34 ]]
    -- upvalues: v4 (copy)
    return {
        ENTRY_POINT = "in-app", 
        SUBMITTER_USER_ID = v9.localPlayerUserId, 
        REPORTED_ABUSE_CATEGORY = v9.formData.abuse_category or v4.ABUSE_CATEGORY_INVALID, 
        REPORTER_COMMENT = v9.formData.free_comment or ""
    };
end;
local function v15(v11) --[[ Line: 51 ]]
    -- upvalues: v2 (copy), v5 (copy), l_FFlagFixNotificationReportsMobile_0 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (copy), l_FFlagLuaAppEnableReportBadge_0 (copy)
    local v12 = v2.copy(v11.tags);
    local l_targetId_0 = v11.targetId;
    if v11.abuseVector == v5.Looks or v11.abuseVector == v5.CommunityLooks then
        local l_targetId_1 = v11.targetId;
        v12.REPORT_TARGET_LOOK_ID = l_targetId_1.lookId;
        v12.REPORT_TARGET_LOOK_INCLUDED_ASSET_IDS = l_targetId_1.lookAssetsIds;
    elseif v11.abuseVector == v5.UgcBundle then
        v12.UGC_BUNDLE_ID = l_targetId_0;
    elseif v11.abuseVector == v5.ContentPostScreenshot then
        v12.CONTENT_POST_ID = l_targetId_0;
    elseif v11.abuseVector == v5.UserProfile then
        v12.REPORT_TARGET_USER_ID = l_targetId_0;
    elseif v11.abuseVector == v5.Accessory then
        v12.REPORT_TARGET_ASSET_ID = l_targetId_0;
    elseif v11.abuseVector == v5.Place then
        v12.REPORT_TARGET_ASSET_ID = l_targetId_0;
    elseif v11.abuseVector == v5.Group then
        v12.REPORT_TARGET_GROUP_ID = l_targetId_0;
    elseif l_FFlagFixNotificationReportsMobile_0 and v11.abuseVector == v5.Notifications then
        v12.NOTIFICATION_ID = l_targetId_0;
    elseif l_FFlagLuaAppEnableSponsoredReportAd_0 and v11.abuseVector == v5.AdV2 then
        v12.AD_ID = l_targetId_0;
    elseif l_FFlagLuaAppEnableReportBadge_0 and v11.abuseVector == v5.Badge then
        v12.REPORT_TARGET_BADGE_ID = l_targetId_0;
    end;
    if v11.abuseVector == v5.Accessory then
        v12.REPORTED_ABUSE_VECTOR = v11.custom and v11.custom.assetTypeName or v5.Accessory;
        if v12.REPORTED_ABUSE_VECTOR == "EmoteAnimation" then
            v12.REPORTED_ABUSE_VECTOR = v5.Accessory;
            return v12;
        end;
    else
        v12.REPORTED_ABUSE_VECTOR = v11.abuseVector;
    end;
    return v12;
end;
return function(v16) --[[ Line: 101 ]]
    -- upvalues: v4 (copy), v15 (copy), v2 (copy)
    local v17 = {
        formData = v16.formData, 
        localPlayerUserId = v16.localPlayerUserId
    };
    local v18 = {
        ENTRY_POINT = "in-app", 
        SUBMITTER_USER_ID = v17.localPlayerUserId, 
        REPORTED_ABUSE_CATEGORY = v17.formData.abuse_category or v4.ABUSE_CATEGORY_INVALID, 
        REPORTER_COMMENT = v17.formData.free_comment or ""
    };
    local v19 = v15({
        abuseVector = v16.abuseVector, 
        custom = v16.custom, 
        targetId = v16.targetId, 
        tags = v18
    });
    v2.forEach(v16.additionalReportTags or {}, function(v20) --[[ Line: 115 ]]
        -- upvalues: v19 (ref)
        if not v20.tagKey or v20.tagKey == "" or not v20.tagValue or v20.tagValue == "" then
            return;
        elseif v19[v20.tagKey] ~= nil then
            local v21 = v19[v20.tagKey];
            v19[v20.tagKey] = v21 .. "," .. v20.tagValue;
            return;
        else
            v19[v20.tagKey] = v20.tagValue;
            return;
        end;
    end);
    return v19;
end;