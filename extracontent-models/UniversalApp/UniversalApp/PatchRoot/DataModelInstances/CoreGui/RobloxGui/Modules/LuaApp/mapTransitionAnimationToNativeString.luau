local v0 = require(script.Parent.Enum.TransitionAnimation);
local v1 = {
    [v0.SlideInFromRight] = "slideInFromRight", 
    [v0.SlideInFromBottom] = "slideInFromBottom"
};
return function(v2) --[[ Line: 8 ]]
    -- upvalues: v1 (copy)
    if v2 then
        return v1[v2];
    else
        return nil;
    end;
end;