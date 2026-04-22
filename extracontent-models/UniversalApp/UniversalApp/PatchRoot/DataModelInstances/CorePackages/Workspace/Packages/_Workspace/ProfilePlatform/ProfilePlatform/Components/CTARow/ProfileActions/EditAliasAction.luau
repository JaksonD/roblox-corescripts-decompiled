local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.SetAlias);
local v3 = require(l_Parent_0.SocialStopwatch);
local v4 = require(l_script_FirstAncestor_0.Common.Enums);
local _ = require(l_script_FirstAncestor_0.Components.CTARow.Types);
local v6 = require(l_script_FirstAncestor_0.Analytics.EventNames);
return {
    [v4.ProfileActions.EditAlias] = function(v7) --[[ Line: 12 ]]
        -- upvalues: v4 (copy), v3 (copy), v6 (copy), v2 (copy)
        return {
            text = v7.localized[v4.ProfileActions.EditAlias], 
            onActivated = function() --[[ Line: 15 ]] --[[ Name: onActivated ]]
                -- upvalues: v3 (ref), v7 (copy), v6 (ref), v4 (ref), v2 (ref)
                v3.Stopwatch.start(v3.Events.CustomizeNameOpened);
                v7.analytics.fireAnalyticsEvent(v6.ContextualMenuButtonSetAlias, {
                    buttonSurface = v7.buttonSurface
                });
                v7.navigation.navigate(v4.Screens.SetAliasModal, {
                    profileUserId = v7.profileId, 
                    origin = v2.Analytics.EntryPoints.ContextualMenu
                });
            end
        };
    end
};