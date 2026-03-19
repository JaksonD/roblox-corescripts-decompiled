local function v3(v0, _, _) --[[ Line: 1 ]] --[[ Name: step ]]
    return {
        value = v0.__targetValue, 
        complete = true
    };
end;
return function(v4) --[[ Line: 8 ]] --[[ Name: instant ]]
    -- upvalues: v3 (copy)
    return {
        __targetValue = v4, 
        step = v3
    };
end;