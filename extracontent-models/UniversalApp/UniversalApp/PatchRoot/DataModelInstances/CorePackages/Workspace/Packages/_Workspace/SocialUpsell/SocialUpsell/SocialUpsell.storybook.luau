local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactRoblox);
local l_FoundationProvider_0 = require(l_Parent_0.Foundation).FoundationProvider;
return {
    name = l_script_FirstAncestor_0.Name, 
    roact = v2, 
    reactRoblox = v3, 
    mapStory = function(v5) --[[ Line: 14 ]] --[[ Name: mapStory ]]
        -- upvalues: v2 (copy), l_FoundationProvider_0 (copy)
        return function(v6) --[[ Line: 15 ]]
            -- upvalues: v2 (ref), l_FoundationProvider_0 (ref), v5 (copy)
            return v2.createElement(l_FoundationProvider_0, {
                theme = v6.theme, 
                device = v6.platform
            }, v2.createElement(v5, v6));
        end;
    end, 
    storyRoots = {
        l_script_FirstAncestor_0
    }
};