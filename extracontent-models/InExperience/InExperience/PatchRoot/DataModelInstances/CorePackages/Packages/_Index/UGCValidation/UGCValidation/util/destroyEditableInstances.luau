local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local function v7(v2) --[[ Line: 6 ]] --[[ Name: destroyHelper ]]
    for _, v4 in v2 do
        for _, v6 in v4 do
            if v6.created and v6.instance then
                v6.instance:Destroy();
            end;
        end;
    end;
    v2 = {};
end;
return function(v8, v9) --[[ Line: 18 ]]
    -- upvalues: v7 (copy)
    v7(v8);
    v7(v9);
end;