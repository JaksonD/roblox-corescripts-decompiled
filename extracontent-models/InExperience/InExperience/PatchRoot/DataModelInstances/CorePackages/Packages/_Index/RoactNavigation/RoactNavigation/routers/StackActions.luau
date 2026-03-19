local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Object_0 = require(l_Parent_1.LuauPolyfill).Object;
local v3 = require(l_Parent_0.NavigationSymbol);
local v4 = v3("POP");
local v5 = v3("POP_TO_TOP");
local v6 = v3("PUSH");
local v7 = v3("RESET");
local v8 = v3("REPLACE");
local v9 = v3("COMPLETE_TRANSITION");
local v10 = {
    Pop = v4, 
    PopToTop = v5, 
    Push = v6, 
    Reset = v7, 
    Replace = v8, 
    CompleteTransition = v9
};
setmetatable(v10, {
    __index = function(_, v12) --[[ Line: 34 ]] --[[ Name: __index ]]
        error(("%q is not a valid member of StackActions"):format((tostring(v12))), 2);
    end
});
v10.pop = function(v13) --[[ Line: 40 ]] --[[ Name: pop ]]
    -- upvalues: v4 (copy), l_Object_0 (copy)
    local v14 = {
        type = v4
    };
    if v13 then
        return (l_Object_0.assign(v14, v13));
    else
        return v14;
    end;
end;
v10.popToTop = function(v15) --[[ Line: 46 ]] --[[ Name: popToTop ]]
    -- upvalues: v5 (copy), l_Object_0 (copy)
    local v16 = {
        type = v5
    };
    if v15 then
        return (l_Object_0.assign(v16, v15));
    else
        return v16;
    end;
end;
v10.push = function(v17) --[[ Line: 52 ]] --[[ Name: push ]]
    -- upvalues: v6 (copy), l_Object_0 (copy)
    local v18 = {
        type = v6
    };
    if v17 then
        return (l_Object_0.assign(v18, v17));
    else
        return v18;
    end;
end;
v10.reset = function(v19) --[[ Line: 59 ]] --[[ Name: reset ]]
    -- upvalues: v7 (copy), l_Object_0 (copy)
    local v20 = {
        type = v7
    };
    if v19 then
        return (l_Object_0.assign(v20, v19));
    else
        return v20;
    end;
end;
v10.replace = function(v21) --[[ Line: 65 ]] --[[ Name: replace ]]
    -- upvalues: v8 (copy), l_Object_0 (copy)
    local v22 = {
        type = v8, 
        preserveFocus = true
    };
    if v21 then
        return (l_Object_0.assign(v22, v21));
    else
        return v22;
    end;
end;
v10.completeTransition = function(v23) --[[ Line: 70 ]] --[[ Name: completeTransition ]]
    -- upvalues: v9 (copy), l_Object_0 (copy)
    local v24 = {
        type = v9, 
        preserveFocus = true
    };
    if v23 then
        return (l_Object_0.assign(v24, v23));
    else
        return v24;
    end;
end;
return v10;