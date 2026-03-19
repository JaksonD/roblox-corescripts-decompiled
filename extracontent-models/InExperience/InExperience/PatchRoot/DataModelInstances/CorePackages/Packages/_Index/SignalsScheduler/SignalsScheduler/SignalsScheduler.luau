local v0 = false;
local v1 = {};
local function v5(v2) --[[ Line: 7 ]] --[[ Name: batch ]]
    -- upvalues: v0 (ref), v1 (copy)
    if not v0 then
        v0 = true;
        v2();
        for _, v4 in v1 do
            v4();
        end;
        table.clear(v1);
        v0 = false;
        return;
    else
        v2();
        return;
    end;
end;
return {
    batch = v5, 
    flush = function() --[[ Line: 21 ]] --[[ Name: flush ]]
        -- upvalues: v5 (copy)
        v5(function() --[[ Line: 22 ]]

        end);
    end, 
    schedule = function(v6) --[[ Line: 25 ]] --[[ Name: schedule ]]
        -- upvalues: v1 (copy)
        table.insert(v1, v6);
    end
};