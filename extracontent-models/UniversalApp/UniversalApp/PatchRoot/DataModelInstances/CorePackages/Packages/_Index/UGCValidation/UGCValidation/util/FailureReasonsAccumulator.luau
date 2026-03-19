local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        passed = true, 
        reasons = {}
    }, v0));
end;
v0.updateReasons = function(v1, v2, v3) --[[ Line: 13 ]] --[[ Name: updateReasons ]]
    if v2 then
        return;
    else
        table.insert(v1.reasons, table.concat(v3, "\n"));
        v1.passed = false;
        return;
    end;
end;
v0.getFinalResults = function(v4) --[[ Line: 22 ]] --[[ Name: getFinalResults ]]
    if v4.passed then
        return true;
    else
        return false, v4.reasons;
    end;
end;
return v0;