local l_script_FirstAncestor_0 = script:FindFirstAncestor("PeopleReactView");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.ReactRoblox);
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_FoundationProvider_0 = v2.FoundationProvider;
local v8 = {
    Default = "Desktop", 
    Desktop = "Desktop", 
    Console = "Console"
};
local v9 = {
    ["Feature.SettingsHub.Action.Block"] = "Block", 
    ["Feature.SettingsHub.Action.Unblock"] = "Unblock", 
    ["Feature.SettingsHub.Label.Mute"] = "Mute", 
    ["Feature.SettingsHub.Label.Unmute"] = "Unmute", 
    ["CoreScripts.InGameMenu.QuickActions.Report"] = "Report", 
    ["Feature.SettingsHub.Prompt.BuyWhatTheyreWearing"] = "Buy what they\226\128\153re wearing\t", 
    ["Feature.SettingsHub.Description.SelectAvatarToCheckoutItems"] = "Select an avatar to check out their items.", 
    ["Feature.SettingsHub.Description.SelectUsernameToViewProfile"] = "View profiles by selecting a username.", 
    ["Feature.SettingsHub.Action.Ok"] = "Ok"
};
local v12 = {
    Format = function(_, v11) --[[ Line: 36 ]] --[[ Name: Format ]]
        -- upvalues: v9 (copy)
        return v9[v11] or v11;
    end, 
    changed = l_Signal_0.new(), 
    GetLocale = function() --[[ Line: 40 ]] --[[ Name: GetLocale ]]
        return "en-us";
    end
};
return {
    name = l_script_FirstAncestor_0.Name, 
    storyRoot = l_script_FirstAncestor_0, 
    roact = v3, 
    reactRoblox = v4, 
    mapStory = function(v13) --[[ Line: 46 ]] --[[ Name: StoryBookMapStory ]]
        -- upvalues: v3 (copy), l_LocalizationProvider_0 (copy), v12 (copy), l_FoundationProvider_0 (copy), v2 (copy), v8 (copy)
        return function(v14) --[[ Line: 47 ]]
            -- upvalues: v3 (ref), l_LocalizationProvider_0 (ref), v12 (ref), l_FoundationProvider_0 (ref), v2 (ref), v8 (ref), v13 (copy)
            return v3.createElement(l_LocalizationProvider_0, {
                localization = v12
            }, {
                FoundationProvider = v3.createElement(l_FoundationProvider_0, {
                    theme = v2.Enums.Theme.Dark, 
                    device = v14 and v8[v14.platform] or v8.Default
                }, {
                    Child = v3.createElement(v13, v14)
                })
            });
        end;
    end
};