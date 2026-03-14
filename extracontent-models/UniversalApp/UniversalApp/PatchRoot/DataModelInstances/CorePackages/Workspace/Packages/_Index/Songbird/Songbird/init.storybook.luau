local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.Dev.RoactCompat);
local v2 = require(l_script_FirstAncestor_0.Parent.Dev.MusicTestingUtils);
return {
    name = l_script_FirstAncestor_0.Name, 
    roact = v1, 
    storyRoots = {
        l_script_FirstAncestor_0.Components
    }, 
    mapStory = function(v3) --[[ Line: 12 ]] --[[ Name: mapStory ]]
        -- upvalues: v1 (copy), v2 (copy)
        return function(v4) --[[ Line: 13 ]]
            -- upvalues: v1 (ref), v2 (ref), v3 (copy)
            return v1.createElement(v2.ContextProviders, {
                theme = v4.theme, 
                overlayGui = v4.focus, 
                host = v4.host
            }, v1.createElement(v3, v4));
        end;
    end
};