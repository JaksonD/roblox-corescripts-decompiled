local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_IconName_0 = v2.Enums.IconName;
local v5 = require(l_script_FirstAncestor_0.Common.Enums);
local _ = require(l_script_FirstAncestor_0.Components.CTARow.Types);
local v7 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v8 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableEditAppearanceMenu);
local v9 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableEditLook);
return {
    [v5.ProfileActions.EditAppearance] = v8 and function(v10) --[[ Line: 19 ]]
        -- upvalues: v5 (copy), l_ButtonVariant_0 (copy), v7 (copy)
        return {
            text = v10.localized[v5.ProfileActions.EditAppearance], 
            variant = l_ButtonVariant_0.Emphasis, 
            onActivated = function() --[[ Line: 23 ]] --[[ Name: onActivated ]]
                -- upvalues: v10 (copy), v7 (ref)
                v10.analytics.fireAnalyticsEvent(v7.CTAButtonEditAppearance, {
                    buttonSurface = v10.buttonSurface
                });
            end
        };
    end or nil, 
    [v5.ProfileActions.EditAvatar] = function(v11) --[[ Line: 32 ]]
        -- upvalues: v5 (copy), v8 (copy), l_IconName_0 (copy), v7 (copy)
        return {
            text = v11.localized[v5.ProfileActions.EditAvatar], 
            icon = if v8 then l_IconName_0.Person else nil, 
            onActivated = function() --[[ Line: 36 ]] --[[ Name: onActivated ]]
                -- upvalues: v11 (copy), v8 (ref), v7 (ref)
                v11.analytics.fireAnalyticsEvent(if v8 then v7.EditAppearanceMenuEditAvatar else v7.CTAButtonEditAvatar, {
                    buttonSurface = v11.buttonSurface
                });
                v11.navigateTo.editAvatar();
            end
        };
    end, 
    [v5.ProfileActions.EditLook] = v9 and function(v12) --[[ Line: 51 ]]
        -- upvalues: v5 (copy), l_IconName_0 (copy), v7 (copy)
        return {
            text = v12.localized[v5.ProfileActions.EditLook], 
            icon = l_IconName_0.Person, 
            onActivated = function() --[[ Line: 55 ]] --[[ Name: onActivated ]]
                -- upvalues: v12 (copy), v7 (ref)
                v12.analytics.fireAnalyticsEvent(v7.CTAButtonEditLook, {
                    buttonSurface = v12.buttonSurface
                });
                v12.navigateTo.editAvatar();
            end
        };
    end or nil, 
    [v5.ProfileActions.EditEmotes] = v8 and function(v13) --[[ Line: 66 ]]
        -- upvalues: v5 (copy), l_IconName_0 (copy), v7 (copy)
        return {
            text = v13.localized[v5.ProfileActions.EditEmotes], 
            icon = l_IconName_0.SquareFaceWavingHand, 
            onActivated = function() --[[ Line: 70 ]] --[[ Name: onActivated ]]
                -- upvalues: v13 (copy), v7 (ref)
                v13.analytics.fireAnalyticsEvent(v7.EditAppearanceMenuEditEmote, {
                    buttonSurface = v13.buttonSurface
                });
                local l_editEmotes_0 = v13.navigateTo.editEmotes;
                if l_editEmotes_0 then
                    l_editEmotes_0();
                end;
            end
        };
    end or nil, 
    [v5.ProfileActions.SwitchAvatar] = v8 and function(v15) --[[ Line: 84 ]]
        -- upvalues: v5 (copy), l_IconName_0 (copy), v7 (copy)
        return {
            text = v15.localized[v5.ProfileActions.SwitchAvatar], 
            icon = l_IconName_0.PersonStandingArrowReverse, 
            onActivated = function() --[[ Line: 88 ]] --[[ Name: onActivated ]]
                -- upvalues: v15 (copy), v7 (ref)
                v15.analytics.fireAnalyticsEvent(v7.EditAppearanceMenuSwitchAvatar, {
                    buttonSurface = v15.buttonSurface
                });
                local l_switchAvatar_0 = v15.navigateTo.switchAvatar;
                if l_switchAvatar_0 then
                    l_switchAvatar_0();
                end;
            end
        };
    end or nil
};