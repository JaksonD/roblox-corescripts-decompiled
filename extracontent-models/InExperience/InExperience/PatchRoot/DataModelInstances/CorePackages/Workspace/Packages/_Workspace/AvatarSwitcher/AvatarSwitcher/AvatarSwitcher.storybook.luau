local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarSwitcher");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactRoblox);
local v4 = require(l_script_FirstAncestor_0.Internal.ContextProviders);
return {
    name = l_script_FirstAncestor_0.Name, 
    roact = v2, 
    reactRoblox = v3, 
    storyRoots = {
        l_script_FirstAncestor_0.Components
    }, 
    mapStory = function(v5) --[[ Line: 16 ]] --[[ Name: mapStory ]]
        -- upvalues: v2 (copy), v4 (copy)
        return function(v6) --[[ Line: 17 ]]
            -- upvalues: v2 (ref), v4 (ref), v5 (copy)
            return v2.createElement(v4, {
                theme = v6.theme, 
                overlayGui = v6.focus
            }, v2.createElement(v5, v6));
        end;
    end
};