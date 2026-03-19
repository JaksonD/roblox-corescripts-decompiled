local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Constants);
local v4 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.PPEThumbnailType);
local v5 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v7 = require(l_Modules_0.AvatarExperience.Common.Analytics.reportAvatarEventCounter);
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics);
local l_reportAvatarEventCounterV1_0 = v8.reportAvatarEventCounterV1;
local l_Constants_0 = v8.Constants;
local l_FFlagAXMigrateReportAvatarEventCounter_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMigrateReportAvatarEventCounter;
return {
    get = function(v12) --[[ Line: 22 ]] --[[ Name: get ]]
        -- upvalues: v5 (copy), v3 (copy), v6 (copy), v4 (copy), l_FFlagAXMigrateReportAvatarEventCounter_0 (copy), l_reportAvatarEventCounterV1_0 (copy), l_Constants_0 (copy), v7 (copy)
        local v13 = v5.get(v12);
        return {
            profilePictureEditorButton = function() --[[ Line: 28 ]] --[[ Name: profilePictureEditorButton ]]
                -- upvalues: v13 (copy), v3 (ref)
                v13.EventStream:sendEventDeferred("ClickProfilePictureEditorButton", "avatarProfilePictureEditTap", {
                    feature = v3.AnalyticsTag, 
                    entry_point = "dropdown"
                });
            end, 
            profilePictureEditorOpenedFromLandingPage = function() --[[ Line: 37 ]] --[[ Name: profilePictureEditorOpenedFromLandingPage ]]
                -- upvalues: v13 (copy), v3 (ref)
                v13.EventStream:sendEventDeferred("ProfilePictureEditorLandingPageButtonClicked", "avatarProfilePictureEditTap", {
                    feature = v3.AnalyticsTag, 
                    entry_point = "home"
                });
            end, 
            clickShopForMore = function(v14, v15) --[[ Line: 45 ]] --[[ Name: clickShopForMore ]]
                -- upvalues: v6 (ref), v13 (copy), v3 (ref)
                local v16 = v6()[v14];
                if v16 then
                    local v17 = v16.Subcategories and v16.Subcategories[v15];
                    local v18 = v16 and v16.Name or "";
                    local v19 = v17 and v17.Name or "";
                    v13.EventStream:sendEventDeferred("ProfilePictureEditorEmotesPage", "avatarProfilePictureEmoteShop", {
                        feature = v3.AnalyticsTag, 
                        nav = v18, 
                        subNav = v19
                    });
                end;
            end, 
            clickFinalSave = function(v20, v21, v22) --[[ Line: 61 ]] --[[ Name: clickFinalSave ]]
                -- upvalues: v4 (ref), v13 (copy), v3 (ref), l_FFlagAXMigrateReportAvatarEventCounter_0 (ref), l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref), v7 (ref)
                local v23 = nil;
                v23 = v20 == v4.Closeup and "clickFinalSaveCloseup" or "clickFinalSaveFullBody";
                v13.EventStream:sendEventDeferred("ProfilePictureEditorFinalPage", v23, {
                    feature = v3.AnalyticsTag, 
                    isDefaultPosition = v21, 
                    emoteAssetId = v22
                });
                if l_FFlagAXMigrateReportAvatarEventCounter_0 then
                    l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.AXUpdateProfilePicture);
                    return;
                else
                    v7(v13, l_Constants_0.AVATAR_EVENT_COUNTER_NAME.AXUpdateProfilePicture);
                    return;
                end;
            end, 
            clickNextFromEmotesPage = function(v24) --[[ Line: 85 ]] --[[ Name: clickNextFromEmotesPage ]]
                -- upvalues: v13 (copy), v3 (ref)
                v13.EventStream:sendEventDeferred("ProfilePictureEditorEmotesPage", "avatarProfilePictureEmote", {
                    feature = v3.AnalyticsTag, 
                    asset_id = v24
                });
            end, 
            clickNextFromCameraPage = function(v25, v26) --[[ Line: 93 ]] --[[ Name: clickNextFromCameraPage ]]
                -- upvalues: v13 (copy), v3 (ref)
                v13.EventStream:sendEventDeferred("ProfilePictureEditorCameraPage", "avatarProfilePictureCrop", {
                    feature = v3.AnalyticsTag, 
                    zoom = v25 and 1 or 0, 
                    rotate = v26 and 1 or 0
                });
            end, 
            clickDefaultPositionsFromCameraPage = function() --[[ Line: 102 ]] --[[ Name: clickDefaultPositionsFromCameraPage ]]
                -- upvalues: v13 (copy), v3 (ref)
                v13.EventStream:sendEventDeferred("ProfilePictureEditorCameraPage", "avatarProfilePictureCropDefault", {
                    feature = v3.AnalyticsTag
                });
            end
        };
    end
};