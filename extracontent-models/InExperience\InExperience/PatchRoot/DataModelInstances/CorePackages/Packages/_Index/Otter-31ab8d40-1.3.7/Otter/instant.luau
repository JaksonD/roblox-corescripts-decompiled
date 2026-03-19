local _ = require(script.Parent.types);
return function(v1) --[[ Line: 5 ]] --[[ Name: instant ]]
    return {
        step = function() --[[ Line: 7 ]] --[[ Name: step ]]
            -- upvalues: v1 (copy)
            return {
                value = v1, 
                complete = true
            };
        end, 
        startingValue = v1
    };
end;