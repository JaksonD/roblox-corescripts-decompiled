local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.Foundation);
local v5 = require(l_Parent_1.ReactRoblox);
local l_Localization_0 = require(l_Parent_1.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_1.Localization).LocalizationProvider;
local v8 = require(l_Parent_0.Context.KeybindContextProvider);
local v9 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
local l_FoundationProvider_0 = v4.FoundationProvider;
return {
    name = l_Parent_0.Name, 
    storyRoot = l_Parent_0, 
    roact = v3, 
    reactRoblox = v5, 
    mapStory = function(v11) --[[ Line: 19 ]] --[[ Name: StoryBookMapStory ]]
        -- upvalues: v3 (copy), l_LocalizationProvider_0 (copy), v9 (copy), v8 (copy), l_FoundationProvider_0 (copy), v4 (copy)
        return function(v12) --[[ Line: 20 ]]
            -- upvalues: v3 (ref), l_LocalizationProvider_0 (ref), v9 (ref), v8 (ref), l_FoundationProvider_0 (ref), v4 (ref), v11 (copy)
            return v3.createElement(l_LocalizationProvider_0, {
                localization = v9
            }, {
                KeybindContextProvider = v3.createElement(v8, nil, {
                    FoundationProvider = v3.createElement(l_FoundationProvider_0, {
                        theme = v4.Enums.Theme.Dark
                    }, {
                        v3.createElement(v11, v12)
                    })
                })
            });
        end;
    end
};