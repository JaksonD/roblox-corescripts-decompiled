local v0 = require(script.Parent.Config);
local v1 = require(script.Parent.MotionType);
return {
    spring = function(v2, v3, v4, v5) --[[ Line: 18 ]] --[[ Name: spring ]]
        -- upvalues: v0 (copy), v1 (copy)
        v3 = v3 or v0.DEFAULT_STIFFNESS;
        v4 = v4 or v0.DEFAULT_DAMPING;
        local v6 = v5 or v0.SPRING_PRECISION;
        return {
            type = v1.Spring, 
            value = v2, 
            stiffness = v3, 
            damping = v4, 
            precision = v6
        };
    end, 
    extractValue = function(v7) --[[ Line: 35 ]] --[[ Name: extractValue ]]
        if type(v7) == "table" then
            return v7.value;
        else
            return v7;
        end;
    end, 
    getType = function(v8) --[[ Line: 46 ]] --[[ Name: getType ]]
        -- upvalues: v1 (copy)
        if type(v8) == "table" then
            return v8.type;
        else
            return v1.Instant;
        end;
    end
};