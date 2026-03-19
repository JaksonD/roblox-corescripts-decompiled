local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Actions.SetPromptState);
local v2 = require(l_Parent_0.Enums.PromptState);
local v3 = require(l_Parent_0.Services.PlatformInterface);
local v4 = require(l_Parent_0.Thunk);
local v5 = {
    v3
};
return function() --[[ Line: 13 ]] --[[ Name: openRobuxStore ]]
    -- upvalues: v4 (copy), v5 (copy), v3 (copy), v1 (copy), v2 (copy)
    return v4.new(script.Name, v5, function(v6, v7) --[[ Line: 14 ]]
        -- upvalues: v3 (ref), v1 (ref), v2 (ref)
        local v8 = v7[v3];
        v6:dispatch(v1(v2.UpsellInProgress));
        v8.openRobuxStore();
    end);
end;