local l_script_FirstAncestor_0 = script:FindFirstAncestor("DetailsPageComponents");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.DetailsInfoTableRow);
local v3 = require(l_Parent_0.React);
local l_ListTable_0 = require(l_Parent_0.UIBlox).App.Table.ListTable;
return v3.memo(function(v5) --[[ Line: 21 ]]
    -- upvalues: v3 (copy), v2 (copy), l_ListTable_0 (copy)
    local v9 = v3.useMemo(function() --[[ Line: 23 ]]
        -- upvalues: v5 (copy), v3 (ref), v2 (ref)
        local v6 = {};
        for _, v8 in v5.rows do
            table.insert(v6, v3.createElement(v2, {
                horizontalPadding = v5.horizontalPadding, 
                infoData = v8.infoData, 
                infoName = v8.infoName
            }));
        end;
        return v6;
    end, {
        v5.horizontalPadding, 
        v5.rows
    });
    return v3.createElement(l_ListTable_0, {
        automaticSize = Enum.AutomaticSize.Y, 
        cells = v9, 
        dividerStartOffset = v5.dividerStartOffset
    });
end);