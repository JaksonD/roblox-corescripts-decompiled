local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local l_Roact_0 = require(l_script_FirstAncestor_0.dependencies).Roact;
local v2 = l_Roact_0.PureComponent:extend("SortedList");
v2.defaultProps = {
    entries = {}, 
    renderEntry = nil, 
    entryHeight = 48, 
    sortComparator = function(_, _) --[[ Line: 12 ]] --[[ Name: sortComparator ]]
        return true;
    end, 
    LayoutOrder = 0
};
v2.sortEntries = function(v5) --[[ Line: 19 ]] --[[ Name: sortEntries ]]
    local v6 = {};
    for _, v8 in pairs(v5.props.entries) do
        table.insert(v6, v8);
    end;
    table.sort(v6, v5.props.sortComparator);
    return v6;
end;
v2.render = function(v9) --[[ Line: 31 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy)
    local v10 = v9:sortEntries();
    local v11 = {
        layout = l_Roact_0.createElement("UIListLayout", {
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    for v12, v13 in pairs(v10) do
        local v14 = v12 == #v10;
        table.insert(v11, l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v9.props.entryHeight), 
            BackgroundTransparency = 1, 
            LayoutOrder = v12
        }, {
            entry = v9.props.renderEntry(v13, v14)
        }));
    end;
    return l_Roact_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, #v9.props.entries * v9.props.entryHeight), 
        BackgroundTransparency = 1, 
        LayoutOrder = v9.props.LayoutOrder
    }, v11);
end;
return v2;