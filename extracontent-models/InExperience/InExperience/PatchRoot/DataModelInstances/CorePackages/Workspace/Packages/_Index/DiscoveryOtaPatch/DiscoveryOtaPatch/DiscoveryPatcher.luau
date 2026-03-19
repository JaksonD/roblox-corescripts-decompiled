local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryOtaPatch");
local v1 = require(l_script_FirstAncestor_0.discoveryOtaPatchInfo);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_OtaScriptPatcher_0 = require(l_Parent_0.OtaPatchLoader).OtaScriptPatcher;
local v4 = {};
v4.__index = v4;
v4.new = function() --[[ Line: 16 ]] --[[ Name: new ]]
    -- upvalues: l_OtaScriptPatcher_0 (copy), v4 (copy)
    local v5 = {
        patcher = l_OtaScriptPatcher_0.new()
    };
    setmetatable(v5, v4);
    return v5;
end;
v4.loadPackages = function(v6) --[[ Line: 24 ]] --[[ Name: loadPackages ]]
    -- upvalues: v1 (copy)
    v6.patcher:load(v1);
end;
v4.getScriptPatcher = function(v7) --[[ Line: 28 ]] --[[ Name: getScriptPatcher ]]
    return v7.patcher;
end;
return (v4.new());