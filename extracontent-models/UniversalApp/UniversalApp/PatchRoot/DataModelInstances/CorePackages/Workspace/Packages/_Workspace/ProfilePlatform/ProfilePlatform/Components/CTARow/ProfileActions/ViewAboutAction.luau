local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.SharedFlags);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v5 = require(l_script_FirstAncestor_0.Common.Enums);
local _ = require(l_script_FirstAncestor_0.Components.CTARow.Types);
local v7 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_FFlagProfilePlatformNewProfileHeader_0 = v2.FFlagProfilePlatformNewProfileHeader;
return {
    [v5.ProfileActions.ViewAbout] = l_FFlagProfilePlatformNewProfileHeader_0 and function(v9) --[[ Line: 19 ]]
        -- upvalues: v5 (copy), v7 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy)
        return {
            text = v9.localized[v5.ProfileActions.ViewAbout], 
            onActivated = function() --[[ Line: 22 ]] --[[ Name: onActivated ]]
                -- upvalues: v9 (copy), v7 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
                v9.analytics.fireAnalyticsEvent(v7.CTAButtonViewFullProfile, {
                    buttonSurface = v9.buttonSurface
                });
                v9.dispatch(l_NavigateDown_0({
                    name = l_AppPage_0.AboutDetailsSheet, 
                    extraProps = {
                        sections = v9.aboutSections
                    }
                }));
            end
        };
    end or nil
};