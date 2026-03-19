local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.t);
return (v1.intersection(v1.Vector2, function(v2) --[[ Line: 7 ]]
    if v2.X < 0 or v2.Y < 0 then
        return false, ("each component of the Vector2 must be >= 0; component values are: %d, %d"):format(v2.X, v2.Y);
    else
        return true;
    end;
end));