local l_Parent_0 = script.Parent.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local v2 = require(script.Parent.Parent.NavigationSymbol)("JUMP_TO");
local v3 = {
    JumpTo = v2
};
setmetatable(v3, {
    __index = function(_, v5) --[[ Line: 16 ]] --[[ Name: __index ]]
        error(("%q is not a valid member of SwitchActions"):format((tostring(v5))), 2);
    end
});
v3.jumpTo = function(v6) --[[ Line: 22 ]] --[[ Name: jumpTo ]]
    -- upvalues: v2 (copy), l_Object_0 (copy)
    local v7 = {
        type = v2, 
        preserveFocus = true
    };
    if v6 then
        return (l_Object_0.assign(v7, v6));
    else
        return v7;
    end;
end;
return v3;