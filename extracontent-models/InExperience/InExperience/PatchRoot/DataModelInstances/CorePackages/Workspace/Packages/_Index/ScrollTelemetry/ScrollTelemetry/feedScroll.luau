local l_Parent_0 = script:FindFirstAncestor("ScrollTelemetry").Parent;
local v1 = require(l_Parent_0.ArgCheck);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.t);
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local v5 = v3.strictInterface({
    distance = v3.number, 
    screenSizeX = v3.number, 
    screenSizeY = v3.number, 
    scrollAreaSize = v3.number, 
    scrollDepth = v3.optional(v3.number), 
    startDepth = v3.optional(v3.number), 
    startPos = v3.number, 
    scrollDuration = v3.number
});
local v6 = v3.strictInterface({
    distance = v3.number, 
    screenSizeX = v3.number, 
    screenSizeY = v3.number, 
    scrollAreaSize = v3.number, 
    scrollDepth = v3.optional(v3.number), 
    startDepth = v3.optional(v3.number), 
    startPos = v3.number, 
    scrollDuration = v3.number, 
    sortPos = v3.number, 
    gameSetTypeId = v3.string, 
    gameSetTargetId = v3.optional(v3.number)
});
return function(v7, v8, v9, v10) --[[ Line: 33 ]]
    -- upvalues: v1 (copy), v5 (copy), v6 (copy), l_mutedError_0 (copy), v2 (copy)
    v1.isType(v8, "string", "eventContext");
    local v11 = "unknown";
    local v12 = nil;
    if v9 == Enum.ScrollingDirection.Y then
        v11 = "vertical";
        v12 = v5;
    elseif v9 == Enum.ScrollingDirection.X then
        v11 = "horizontal";
        v12 = v6;
    elseif v9 == Enum.ScrollingDirection.XY then
        l_mutedError_0((("Direction %* is an unsupported option for feedScroll event"):format(v9.Name)));
    end;
    if v12 then
        local v13, v14 = v12(v10);
        if not v13 then
            l_mutedError_0(v14);
        end;
    else
        l_mutedError_0((("Missing interface for unknown direction %* to type check feedScroll event parameters"):format(v9.Name)));
    end;
    v7:sendEventDeferred(v8, "feedScroll", (v2.Dictionary.join(v10, {
        direction = v11
    })));
end;