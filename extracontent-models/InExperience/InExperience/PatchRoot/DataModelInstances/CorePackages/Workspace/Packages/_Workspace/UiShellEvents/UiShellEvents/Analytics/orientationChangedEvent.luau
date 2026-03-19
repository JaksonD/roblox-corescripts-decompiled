local l_script_FirstAncestor_0 = script:FindFirstAncestor("UiShellEvents");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Logger);
local v3 = require(l_Parent_0.t);
local _ = require(l_Parent_0.RobloxAppEnums);
local v5 = v3.strictInterface({
    deviceOrientation = v3.string, 
    experienceOrientation = v3.optional(v3.string), 
    page = v3.optional(v3.string), 
    viewportX = v3.number, 
    viewportY = v3.number, 
    universeId = v3.optional(v3.string)
});
return function(v6, v7, v8) --[[ Line: 28 ]]
    -- upvalues: v5 (copy), v2 (copy)
    local v9, v10 = v5(v8);
    if not v9 then
        v2:error(v10);
    end;
    v6:sendEventDeferred(v7, "uiShellOrientationChanged", v8);
end;