local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local _ = require(l_script_FirstAncestor_0.Components.Types);
return function(v2) --[[ Line: 6 ]] --[[ Name: getGridSizeTag ]]
    if typeof(v2) == "number" then
        return (("col-%*"):format(v2));
    else
        local v3 = {};
        for v4, v5 in v2 do
            if typeof(v5) == "number" then
                table.insert(v3, (("%*-col-%*"):format(v4, v5)));
            end;
        end;
        return table.concat(v3, " ");
    end;
end;