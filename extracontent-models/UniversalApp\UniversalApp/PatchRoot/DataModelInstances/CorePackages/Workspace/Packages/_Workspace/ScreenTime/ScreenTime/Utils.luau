local l_Parent_0 = script:FindFirstAncestor("ScreenTime").Parent;
local v1 = require(l_Parent_0.ArgCheck);
local l_Logging_0 = require(l_Parent_0.AppCommonLib).Logging;
return {
    globalGetter = nil, 
    globalSetter = nil, 
    new = function(v3, v4) --[[ Line: 30 ]] --[[ Name: new ]]
        -- upvalues: v1 (copy)
        v1.isType(v4.globalGetter, "function", "globalGetter");
        v1.isType(v4.globalSetter, "function", "globalSetter");
        local v5 = {
            globalGetter = v4.globalGetter, 
            globalSetter = v4.globalSetter
        };
        setmetatable(v5, v3);
        v3.__index = v3;
        return v5;
    end, 
    isLockedOut = function(v6) --[[ Line: 45 ]] --[[ Name: isLockedOut ]]
        -- upvalues: v1 (copy)
        v1.isType(v6.globalGetter, "function", "globalGetter");
        return v6.globalGetter("ScreenTime.lockedOut") == "true";
    end, 
    setLockedOut = function(v7) --[[ Line: 54 ]] --[[ Name: setLockedOut ]]
        -- upvalues: l_Logging_0 (copy), v1 (copy)
        l_Logging_0.warn("Utils setLockedOut");
        v1.isType(v7.globalSetter, "function", "globalSetter");
        v7.globalSetter("ScreenTime.lockedOut", "true");
    end
};