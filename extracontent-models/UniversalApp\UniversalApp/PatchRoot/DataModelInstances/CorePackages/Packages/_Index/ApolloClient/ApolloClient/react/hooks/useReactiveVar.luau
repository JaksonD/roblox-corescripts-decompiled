local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.React);
local l_useEffect_0 = v3.useEffect;
local l_useState_0 = v3.useState;
local _ = require(l_Parent_0.cache);
local v7 = {
    __value = "nil placeholder"
};
v0.useReactiveVar = function(v8) --[[ Line: 25 ]] --[[ Name: useReactiveVar ]]
    -- upvalues: l_useState_0 (copy), l_useEffect_0 (copy), v7 (copy)
    local v9 = v8();
    local _, v11 = l_useState_0(v9);
    l_useEffect_0(function() --[[ Line: 34 ]]
        -- upvalues: v8 (copy), v9 (copy), v11 (copy)
        local v12 = v8();
        if v9 ~= v12 then
            v11(v12);
            return;
        else
            return v8:onNextChange(v11);
        end;
    end, {
        v9 or v7
    });
    return v9;
end;
return v0;