local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Actions.CarouselIndexSelected);
local v2 = require(l_Parent_0.Constants);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v4) --[[ Line: 7 ]]
        -- upvalues: v2 (ref), v3 (copy), v1 (ref)
        local l_Captures_0 = v4:getState()[v2.RoduxKey].Captures;
        local v6 = math.clamp(v3, 1, #l_Captures_0);
        v4:dispatch(v1(v6));
    end;
end;