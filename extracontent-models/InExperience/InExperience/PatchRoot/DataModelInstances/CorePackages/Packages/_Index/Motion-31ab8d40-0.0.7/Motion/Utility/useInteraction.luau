local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
return function(v2) --[[ Line: 11 ]] --[[ Name: useInteraction ]]
    -- upvalues: v1 (copy)
    local v3, v4 = v1.useState(false);
    local v5, v6 = v1.useState(false);
    return {
        onInputBegan = function(_, v8) --[[ Line: 16 ]] --[[ Name: onInputBegan ]]
            -- upvalues: v4 (copy)
            if v8.UserInputType == Enum.UserInputType.MouseButton1 then
                v4(true);
            end;
        end, 
        onInputEnded = function(_, v10) --[[ Line: 22 ]] --[[ Name: onInputEnded ]]
            -- upvalues: v3 (copy), v5 (copy), v2 (copy), v4 (copy)
            if v10.UserInputType == Enum.UserInputType.MouseButton1 then
                if v3 and v5 then
                    v2();
                end;
                v4(false);
            end;
        end, 
        onMouseEnter = function() --[[ Line: 31 ]] --[[ Name: onMouseEnter ]]
            -- upvalues: v6 (copy)
            v6(true);
        end, 
        onMouseLeave = function() --[[ Line: 35 ]] --[[ Name: onMouseLeave ]]
            -- upvalues: v6 (copy), v4 (copy)
            v6(false);
            v4(false);
        end
    }, v3, v5;
end;