local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChatLineReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Dev.ReactRoblox);
local v5 = require(script.Parent.MockProviders);
local l_Dictionary_0 = v2.Dictionary;
return {
    roact = v3, 
    reactRoblox = v4, 
    mapStory = function(v7) --[[ Line: 14 ]] --[[ Name: mapStory ]]
        -- upvalues: l_Dictionary_0 (copy), v3 (copy), v5 (copy)
        return function(v8) --[[ Line: 15 ]]
            -- upvalues: l_Dictionary_0 (ref), v3 (ref), v5 (ref), v7 (copy)
            local v9 = l_Dictionary_0.union(v8, v8.definition and v8.definition.props or {});
            return v3.createElement(v5, {}, {
                story = v3.createElement(v7, v9)
            });
        end;
    end, 
    storyRoots = {
        l_script_FirstAncestor_0
    }
};