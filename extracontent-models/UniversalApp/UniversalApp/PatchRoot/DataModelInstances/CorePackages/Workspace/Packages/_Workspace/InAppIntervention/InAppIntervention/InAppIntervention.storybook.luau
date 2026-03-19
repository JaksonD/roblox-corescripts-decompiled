local l_script_FirstAncestor_0 = script:FindFirstAncestor("InAppIntervention");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Dev.ReactRoblox);
local v5 = require(l_Parent_0.UIBlox);
local v6 = require(l_Parent_0.Dev.RobloxAppUIBloxConfig);
v5.init(v6);
local v7 = require(script.Parent.MockProviders);
local l_Dictionary_0 = v2.Dictionary;
local v9 = require(l_script_FirstAncestor_0.Logger);
v9:addSink({
    maxLevel = v9.Levels.fromString("trace"), 
    log = function(_, v11, v12) --[[ Line: 19 ]] --[[ Name: log ]]
        print((("[%*] %*"):format(v12.loggerName, v11)));
    end
});
return {
    roact = v3, 
    reactRoblox = v4, 
    mapStory = function(v13) --[[ Line: 27 ]] --[[ Name: mapStory ]]
        -- upvalues: l_Dictionary_0 (copy), v3 (copy), v7 (copy)
        return function(v14) --[[ Line: 28 ]]
            -- upvalues: l_Dictionary_0 (ref), v3 (ref), v7 (ref), v13 (copy)
            local v15 = l_Dictionary_0.union(v14, v14.definition and v14.definition.props or {});
            return v3.createElement(v7, {}, {
                story = v3.createElement(v13, v15)
            });
        end;
    end, 
    storyRoots = {
        l_script_FirstAncestor_0
    }
};