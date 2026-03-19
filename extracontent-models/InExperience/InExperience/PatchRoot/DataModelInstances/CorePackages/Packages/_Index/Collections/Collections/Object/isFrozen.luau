local l___DEV___0 = _G.__DEV__;
local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.ES7Types);
return function(v3) --[[ Line: 24 ]]
    -- upvalues: l___DEV___0 (copy)
    if l___DEV___0 then
        print("Luau now has a direct table.isfrozen call that can save the overhead of this library function call");
    end;
    return table.isfrozen(v3);
end;