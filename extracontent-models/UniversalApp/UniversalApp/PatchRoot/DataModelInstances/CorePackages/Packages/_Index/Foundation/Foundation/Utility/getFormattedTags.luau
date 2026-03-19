local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local _ = require(l_script_FirstAncestor_0.Components.Types);
return function(v2) --[[ Line: 6 ]] --[[ Name: getFormattedTags ]]
    if v2 ~= nil then
        if typeof(v2) == "table" then
            local v3 = {};
            for v4, v5 in v2 do
                if v5 then
                    table.insert(v3, v4);
                end;
            end;
            return table.concat(v3, " ");
        elseif typeof(v2) == "string" then
            return v2;
        else
            assert(false, "Invalid argument to useStyleTags. Expected a table or string, got " .. typeof(v2));
        end;
    end;
    return nil;
end;