local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Dev.ReactRoblox);
local l_FoundationProvider_0 = v3.FoundationProvider;
local v7 = require(script.Parent.MockProviders);
local l_Dictionary_0 = v2.Dictionary;
local v9 = require(l_script_FirstAncestor_0.Logger);
v9:addSink({
    maxLevel = v9.Levels.fromString("trace"), 
    log = function(_, v11, v12) --[[ Line: 17 ]] --[[ Name: log ]]
        print((("[%*] %*"):format(v12.loggerName, v11)));
    end
});
return {
    roact = v4, 
    reactRoblox = v5, 
    mapStory = function(v13) --[[ Line: 25 ]] --[[ Name: mapStory ]]
        -- upvalues: l_Dictionary_0 (copy), v4 (copy), v7 (copy), l_FoundationProvider_0 (copy)
        return function(v14) --[[ Line: 26 ]]
            -- upvalues: l_Dictionary_0 (ref), v4 (ref), v7 (ref), l_FoundationProvider_0 (ref), v13 (copy)
            local v15 = l_Dictionary_0.union(v14, v14.definition and v14.definition.props or {});
            return v4.createElement(v7, {}, {
                FoundationProvider = v4.createElement(l_FoundationProvider_0, {
                    theme = "Dark", 
                    preferences = v14.settings, 
                    overlayGui = v14.focus
                }, {
                    story = v4.createElement(v13, v15)
                })
            });
        end;
    end, 
    storyRoots = {
        l_script_FirstAncestor_0
    }
};