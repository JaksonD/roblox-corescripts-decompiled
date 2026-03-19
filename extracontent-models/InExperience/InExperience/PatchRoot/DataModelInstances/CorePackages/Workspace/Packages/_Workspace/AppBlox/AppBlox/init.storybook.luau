local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppBlox");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.Dev.ReactRoblox);
local l_FoundationProvider_0 = v3.FoundationProvider;
return {
    name = l_script_FirstAncestor_0.Name, 
    roact = v2, 
    reactRoblox = v4, 
    mapStory = function(v6) --[[ Line: 14 ]] --[[ Name: mapStory ]]
        -- upvalues: v2 (copy), l_FoundationProvider_0 (copy)
        return function(v7) --[[ Line: 15 ]]
            -- upvalues: v2 (ref), l_FoundationProvider_0 (ref), v6 (copy)
            return v2.createElement(l_FoundationProvider_0, {
                theme = v7.theme, 
                device = v7.platform
            }, v2.createElement(v6, v7));
        end;
    end, 
    storyRoots = {
        l_script_FirstAncestor_0
    }
};