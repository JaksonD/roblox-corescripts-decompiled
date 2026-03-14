local l_script_FirstAncestor_0 = script:FindFirstAncestor("UiShellEvents");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.t);
local v3 = require(l_script_FirstAncestor_0.Logger);
local v4 = v2.strictInterface({
    page = v2.string
});
return function(v5, v6, v7) --[[ Line: 14 ]]
    -- upvalues: v4 (copy), v3 (copy)
    local v8, v9 = v4(v7);
    if not v8 then
        v3:error(v9);
    end;
    v5:sendEventDeferred(v6, "uiShellStatusBarTapped", v7);
end;