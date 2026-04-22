local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v2 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateDown);
local v3 = require(l_script_FirstAncestor_0.LuaApp.AppPage);
local v4 = require(l_CorePackages_0.Packages.Dash);
local v5 = require(l_CorePackages_0.Workspace.Packages.SocialStopwatch);
local v6 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics);
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.ContactImporter).Constants;
local v8 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform.initializeProfileAnalytics);
local v9 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform.EventNames);
local v10 = v8();
return function(v11, v12) --[[ Line: 64 ]]
    -- upvalues: v5 (copy), v10 (copy), v9 (copy), v6 (copy), l_Constants_0 (copy), v2 (copy), v3 (copy), v4 (copy)
    return function(v13) --[[ Line: 65 ]]
        -- upvalues: v5 (ref), v12 (copy), v10 (ref), v9 (ref), v6 (ref), l_Constants_0 (ref), v2 (ref), v3 (ref), v4 (ref), v11 (copy)
        v5.Stopwatch.start(v5.Events.ProfileOpened);
        (if v12 and v12.mockProfileAnalytics_dev then v12.mockProfileAnalytics_dev else v10).fireAnalyticsEvent(v9.ProfileLoadingStage, {
            status = v6.Analytics.Enums.LoadingStages.Started
        });
        if v12 and v12.profileType == l_Constants_0.CONTACTS_PROFILE_TYPE and v12.contactProps then
            v13:dispatch(v2({
                name = v3.ProfilePlatform, 
                detail = v12.contactProps.contactId, 
                extraProps = v4.join(v12, {
                    profileType = l_Constants_0.CONTACT
                })
            }));
            return;
        else
            v13:dispatch(v2({
                name = v3.ProfilePlatform, 
                detail = v11, 
                extraProps = v12
            }));
            return;
        end;
    end;
end;