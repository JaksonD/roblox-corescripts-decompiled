local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v2 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateDown);
local v3 = require(l_script_FirstAncestor_0.LuaApp.AppPage);
local v4 = require(l_CorePackages_0.Packages.Dash);
local v5 = require(l_CorePackages_0.Workspace.Packages.SocialStopwatch);
local v6 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics);
local v7 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform);
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.ContactImporter).Constants;
local l_initializeProfileAnalytics_0 = v7.initializeProfileAnalytics;
local l_EventNames_0 = v7.EventNames;
local v11 = l_initializeProfileAnalytics_0();
return function(v12, v13) --[[ Line: 65 ]]
    -- upvalues: v5 (copy), v11 (copy), l_EventNames_0 (copy), v6 (copy), l_Constants_0 (copy), v2 (copy), v3 (copy), v4 (copy)
    return function(v14) --[[ Line: 66 ]]
        -- upvalues: v5 (ref), v13 (copy), v11 (ref), l_EventNames_0 (ref), v6 (ref), l_Constants_0 (ref), v2 (ref), v3 (ref), v4 (ref), v12 (copy)
        v5.Stopwatch.start(v5.Events.ProfileOpened);
        (if v13 and v13.mockProfileAnalytics_dev then v13.mockProfileAnalytics_dev else v11).fireAnalyticsEvent(l_EventNames_0.ProfileLoadingStage, {
            status = v6.Analytics.Enums.LoadingStages.Started
        });
        if v13 and v13.profileType == l_Constants_0.CONTACTS_PROFILE_TYPE and v13.contactProps then
            v14:dispatch(v2({
                name = v3.ProfilePlatform, 
                detail = v13.contactProps.contactId, 
                extraProps = v4.join(v13, {
                    profileType = l_Constants_0.CONTACT
                })
            }));
            return;
        else
            v14:dispatch(v2({
                name = v3.ProfilePlatform, 
                detail = v12, 
                extraProps = v13
            }));
            return;
        end;
    end;
end;