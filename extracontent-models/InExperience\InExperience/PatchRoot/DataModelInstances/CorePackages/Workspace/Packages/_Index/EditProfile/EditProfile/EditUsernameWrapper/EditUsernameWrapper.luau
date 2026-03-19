local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.RoactNavigation);
local l_JavascriptHybrid_0 = require(l_script_FirstAncestor_0.Common.Constants).JavascriptHybrid;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local v7 = require(l_Parent_0.SocialToast);
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
local v9 = require(l_Parent_0.UserProfiles);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v12 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v13 = require(l_script_FirstAncestor_0.Analytics);
local l_EventNames_0 = v13.EventNames;
local l_useAnalytics_0 = v13.useAnalytics;
local l_FFlagEditProfileMigration_0 = require(l_script_FirstAncestor_0.Flags).FFlagEditProfileMigration;
return v4.withNavigation(function(v17) --[[ Line: 36 ]] --[[ Name: EditUsernameWrapper ]]
    -- upvalues: l_useLocalUserId_0 (copy), v9 (copy), l_useLocalization_0 (copy), v12 (copy), v7 (copy), l_useAnalytics_0 (copy), l_JavascriptHybrid_0 (copy), l_EventNames_0 (copy), v3 (copy), l_UrlBuilder_0 (copy), l_HttpService_0 (copy), l_FFlagEditProfileMigration_0 (copy), l_Images_0 (copy)
    local v18 = l_useLocalUserId_0();
    local v19 = v9.Hooks.useUserProfilesFetch({
        userIds = {
            v18
        }, 
        query = v9.Queries.userProfilesAllNamesByUserIds
    });
    local v20 = l_useLocalization_0({
        updated = v12.UsernameUpdated
    });
    local v21 = v7.useOpenToast();
    local v22 = l_useAnalytics_0();
    local function _(v23) --[[ Line: 50 ]] --[[ Name: getFeatureStringFromHybridEvent ]]
        -- upvalues: l_JavascriptHybrid_0 (ref)
        if v23.moduleID == l_JavascriptHybrid_0.Module.Navigation and v23.functionName == l_JavascriptHybrid_0.Function.navigateToFeature and v23.params and v23.params.params then
            return v23.params.params.feature;
        else
            return nil;
        end;
    end;
    local function _(v25) --[[ Line: 75 ]] --[[ Name: isCloseEditUsername ]]
        -- upvalues: l_JavascriptHybrid_0 (ref)
        return (if v25.moduleID == l_JavascriptHybrid_0.Module.Navigation and v25.functionName == l_JavascriptHybrid_0.Function.navigateToFeature and v25.params and v25.params.params then v25.params.params.feature else nil) == l_JavascriptHybrid_0.Feature.CloseUpdateUsernameModal;
    end;
    local function _(v27) --[[ Line: 80 ]] --[[ Name: isCompletedEditUsername ]]
        -- upvalues: l_JavascriptHybrid_0 (ref)
        return (if v27.moduleID == l_JavascriptHybrid_0.Module.Navigation and v27.functionName == l_JavascriptHybrid_0.Function.navigateToFeature and v27.params and v27.params.params then v27.params.params.feature else nil) == l_JavascriptHybrid_0.Feature.UpdateUsernameModalSuccess;
    end;
    local function _() --[[ Line: 85 ]] --[[ Name: updateUsername ]]
        -- upvalues: v19 (copy), v22 (copy), l_EventNames_0 (ref)
        v19.refetch();
        v22.fireAnalyticsEvent(l_EventNames_0.UsernameSaved);
    end;
    return v3.createElement(v17.BrowserWrapperComponent, {
        isVisible = true, 
        webViewVisible = true, 
        modal = false, 
        url = l_UrlBuilder_0.static.settings.account() .. "?changeusername", 
        isGenericWebview = true, 
        javaScriptCallback = function(v30) --[[ Line: 97 ]] --[[ Name: javaScriptCallback ]]
            -- upvalues: l_HttpService_0 (ref), l_JavascriptHybrid_0 (ref), v19 (copy), v22 (copy), l_EventNames_0 (ref), v17 (copy), l_FFlagEditProfileMigration_0 (ref), v20 (copy), v21 (copy), l_Images_0 (ref)
            local v31 = l_HttpService_0:JSONDecode(v30);
            if (if v31.moduleID == l_JavascriptHybrid_0.Module.Navigation and v31.functionName == l_JavascriptHybrid_0.Function.navigateToFeature and v31.params and v31.params.params then v31.params.params.feature else nil) == l_JavascriptHybrid_0.Feature.UpdateUsernameModalSuccess then
                v19.refetch();
                v22.fireAnalyticsEvent(l_EventNames_0.UsernameSaved);
                if v17.onUsernameChanged then
                    v17.onUsernameChanged();
                end;
                v17.navigation.goBack();
                if l_FFlagEditProfileMigration_0 then
                    v17.showToast(v20.updated);
                    return;
                else
                    v21({
                        toastTitle = v20.updated, 
                        iconImage = l_Images_0["icons/actions/accept"]
                    });
                    return;
                end;
            else
                if (if v31.moduleID == l_JavascriptHybrid_0.Module.Navigation and v31.functionName == l_JavascriptHybrid_0.Function.navigateToFeature and v31.params and v31.params.params then v31.params.params.feature else nil) == l_JavascriptHybrid_0.Feature.CloseUpdateUsernameModal then
                    v17.navigation.goBack();
                end;
                return;
            end;
        end
    });
end);