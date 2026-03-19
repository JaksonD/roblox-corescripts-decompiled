local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Array_0 = require(l_Parent_1.LuauPolyfill).Array;
local l_isObjectLike_0 = require(l_Parent_0.jsutils.isObjectLike).isObjectLike;
local function v4(v5) --[[ Line: 18 ]] --[[ Name: toJSONDeep ]]
    -- upvalues: l_isObjectLike_0 (copy), l_Array_0 (copy), v4 (copy)
    if not l_isObjectLike_0(v5) then
        return v5;
    elseif type(v5.toJSON) == "function" then
        return v5:toJSON();
    elseif l_Array_0.isArray(v5) then
        return l_Array_0.map(v5, v4);
    else
        local v6 = {};
        for v7, v8 in pairs(v5) do
            v6[v7] = v4(v8);
        end;
        return v6;
    end;
end;
return {
    toJSONDeep = v4
};