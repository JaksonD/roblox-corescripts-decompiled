local l_Parent_0 = script:FindFirstAncestor("Components").Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Dash);
local v4 = require(l_Parent_0.Utils.InlineElementType);
local _ = require(l_Parent_0.Components.InlineLayout.InlineLayoutElements.RenderableInlineElement);
local v6 = require(l_Parent_0.Components.InlineLayout.InlineLayoutElements.HardBreakElement);
local v7 = require(l_Parent_0.Utils.isInlineElement);
local v8 = {};
v8.__index = v8;
v8.__type = v4;
local function v15(v9, v10) --[[ Line: 20 ]] --[[ Name: getSplitPoint ]]
    local v11 = 0;
    for v12, v13 in v9 do
        local v14 = v13:getWidth();
        if v10 < v11 + v14 then
            return v12, v10 - v11;
        else
            v11 = v11 + v14;
        end;
    end;
    return -1, -1;
end;
local _ = function(v16, v17, v18, v19, v20, v21) --[[ Line: 32 ]] --[[ Name: handleSplitTrailingElement ]]
    local v22 = nil;
    local _ = nil;
    if not v20 then
        if v18.canForceSplit and v21 then
            local v24, v25 = v18:split(v19, true);
            return v24, v25;
        else
            return v16, v17;
        end;
    else
        return v22, v18;
    end;
end;
v8.new = function(v27, v28, v29, v30) --[[ Line: 56 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy), v7 (copy), v6 (copy)
    local v31 = setmetatable({}, v8);
    v31.WrapperElement = v27;
    v31.wrapperElementProps = v28;
    v31.Elements = {};
    v31.startingIndex = v30 or 1;
    for _, v33 in v29 do
        if not v7(v33) or v33 == v6 then
            warn("InlineSpanElement: invalid element provided. Only non inline elements, excluding HardBreakElement, are allowed.");
        else
            table.insert(v31.Elements, v33);
        end;
    end;
    if #v31.Elements == 0 then
        warn("InlineSpanElement: no elements provided");
    end;
    v31.canForceSplit = #v31.Elements > 0 and v31.Elements[#v31.Elements].canForceSplit;
    return v31;
end;
v8.getWidth = function(v34) --[[ Line: 85 ]] --[[ Name: getWidth ]]
    -- upvalues: v3 (copy)
    return v3.sum(v3.map(v34.Elements, function(v35) --[[ Line: 86 ]]
        return v35:getWidth();
    end));
end;
v8._splitChildAtIndex = function(v36, v37, v38) --[[ Line: 91 ]] --[[ Name: _splitChildAtIndex ]]
    local v39, v40 = v36.Elements[v37]:split(v38, false);
    return v39, v40, v39:getWidth() <= v38;
end;
v8.split = function(v41, v42, v43) --[[ Line: 101 ]] --[[ Name: split ]]
    -- upvalues: v15 (copy), v8 (copy)
    local v44 = {};
    local v45 = {};
    local v46, v47 = v15(v41.Elements, v42);
    if v46 == -1 then
        return v41, nil;
    else
        local v48 = v46 + 1;
        local v49, v50, v51 = v41:_splitChildAtIndex(v46, v47);
        if not v51 then
            local l_v49_0 = v49;
            local l_v50_0 = v50;
            local v54 = v41.Elements[v46];
            local v55 = v46 > 1;
            local v56 = nil;
            local v57 = nil;
            if not v55 then
                if v54.canForceSplit and v43 then
                    local v58, v59 = v54:split(v47, true);
                    v56 = v58;
                    v57 = v59;
                else
                    v56 = l_v49_0;
                    v57 = l_v50_0;
                end;
            else
                v57 = v54;
            end;
            local l_v56_0 = v56;
            local l_v57_0 = v57;
            v49 = l_v56_0;
            v50 = l_v57_0;
        end;
        if v46 > 1 then
            table.move(v41.Elements, 1, v46 - 1, 1, v44);
        end;
        if v49 then
            table.insert(v44, v49);
            v48 = v48 - 1;
        end;
        if v50 then
            table.insert(v45, v50);
        end;
        if v46 < #v41.Elements then
            table.move(v41.Elements, v46 + 1, #v41.Elements, #v45 + 1, v45);
        end;
        local v62 = v8.new(v41.WrapperElement, v41.wrapperElementProps, v44, v41.startingIndex);
        if #v45 > 0 then
            return v62, (v8.new(v41.WrapperElement, v41.wrapperElementProps, v45, v48));
        else
            return v62, nil;
        end;
    end;
end;
v8.render = function(v63, v64, v65) --[[ Line: 147 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v68 = v3.map(v63.Elements, function(v66, v67) --[[ Line: 148 ]]
        -- upvalues: v64 (copy), v63 (copy)
        return v66:render(("%*-%*"):format(v64, v63.startingIndex + v67 - 1), v67);
    end);
    return v2.createElement(v63.WrapperElement, v3.join(v63.wrapperElementProps, {
        id = v64, 
        LayoutOrder = v65
    }), v68);
end;
return v8;