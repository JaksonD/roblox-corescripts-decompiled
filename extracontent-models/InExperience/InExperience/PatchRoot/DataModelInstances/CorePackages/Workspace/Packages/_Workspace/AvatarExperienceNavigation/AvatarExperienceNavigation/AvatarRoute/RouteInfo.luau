local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceNavigation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.tutils);
local v3 = require(l_Parent_0.t);
local v4 = require(l_script_FirstAncestor_0.Enums.AvatarScreen);
local _ = require(script.Parent.Types);
local v6 = {};
v6.__index = v6;
v6.Interface = v3.strictInterface({
    name = v3.string, 
    key = v3.string, 
    params = v3.table
});
v6.new = function(v7, v8, v9) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    local v10 = {
        name = v7, 
        key = v8, 
        params = v9 or {}
    };
    setmetatable(v10, v6);
    return v10;
end;
v6.EMPTY = v6.new(v4.None, v4.None);
v6.__tostring = function(v11) --[[ Line: 32 ]] --[[ Name: __tostring ]]
    return string.format("%s(key=%s)", v11.name, (tostring(v11.key)));
end;
v6.__eq = function(v12, v13) --[[ Line: 36 ]] --[[ Name: __eq ]]
    -- upvalues: v2 (copy)
    if rawequal(v12, v13) then
        return true;
    else
        local v14 = false;
        if v12.key == v13.key then
            v14 = false;
            if v12.name == v13.name then
                v14 = v2.shallowEqual(v12.params, v13.params, nil);
            end;
        end;
        return v14;
    end;
end;
return v6;