local l_script_FirstAncestor_0 = script:FindFirstAncestor("SettingReactView");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactRoblox);
local v4 = require(l_Parent_0.Foundation);
local l_FoundationProvider_0 = v4.FoundationProvider;
local v6 = {
    Default = v4.Enums.Theme.Dark, 
    Light = v4.Enums.Theme.Light, 
    Dark = v4.Enums.Theme.Dark
};
local v7 = {
    Default = "Desktop", 
    Desktop = "Desktop", 
    Console = "Console"
};
return {
    name = l_script_FirstAncestor_0.Name, 
    storyRoot = l_script_FirstAncestor_0, 
    roact = v2, 
    reactRoblox = v3, 
    mapStory = function(v8) --[[ Line: 26 ]] --[[ Name: StoryBookMapStory ]]
        -- upvalues: v2 (copy), l_FoundationProvider_0 (copy), v6 (copy), v7 (copy)
        return function(v9) --[[ Line: 27 ]]
            -- upvalues: v2 (ref), l_FoundationProvider_0 (ref), v6 (ref), v7 (ref), v8 (copy)
            return v2.createElement(l_FoundationProvider_0, {
                theme = v9 and v6[v9.theme] or v6.Default, 
                device = v9 and v7[v9.platform] or v7.Default
            }, v2.createElement(v8, v9));
        end;
    end
};