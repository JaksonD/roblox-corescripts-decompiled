local l_script_FirstAncestor_0 = script:FindFirstAncestor("CoreScriptsRoactCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactRoblox);
local l_Localization_0 = require(l_Parent_0.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local v6 = require(script.Parent.FoundationStorybookMiddleware);
local v7 = l_Localization_0.new("en-us");
local function _(v8) --[[ Line: 12 ]] --[[ Name: wrapWithProviders ]]
    -- upvalues: v2 (copy), l_LocalizationProvider_0 (copy), v7 (copy)
    return function(v9) --[[ Line: 13 ]]
        -- upvalues: v2 (ref), l_LocalizationProvider_0 (ref), v7 (ref), v8 (copy)
        return v2.createElement(l_LocalizationProvider_0, {
            localization = v7
        }, {
            Child = v2.createElement(v8, v9)
        });
    end;
end;
return {
    name = l_script_FirstAncestor_0.Name, 
    storyRoot = l_script_FirstAncestor_0, 
    roact = v2, 
    reactRoblox = v3, 
    mapStory = function(v11) --[[ Line: 22 ]] --[[ Name: StoryBookMapStory ]]
        -- upvalues: v6 (copy), v2 (copy), l_LocalizationProvider_0 (copy), v7 (copy)
        return v6(function(v12) --[[ Line: 13 ]]
            -- upvalues: v2 (ref), l_LocalizationProvider_0 (ref), v7 (ref), v11 (copy)
            return v2.createElement(l_LocalizationProvider_0, {
                localization = v7
            }, {
                Child = v2.createElement(v11, v12)
            });
        end);
    end
};