local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.PresenceContext);
return {
    useIsPresent = function() --[[ Line: 39 ]] --[[ Name: useIsPresent ]]
        -- upvalues: v1 (copy), v2 (copy)
        local v3 = v1.useContext(v2);
        if v3 == nil then
            return true;
        else
            return v3.isPresent;
        end;
    end, 
    isPresent = function(v4) --[[ Line: 27 ]] --[[ Name: isPresent ]]
        if v4 == nil then
            return true;
        else
            return v4.isPresent;
        end;
    end
};