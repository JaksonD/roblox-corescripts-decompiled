local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local v2 = require(l_CorePackages_0.Packages.Cryo);
local function v8(v3) --[[ Line: 30 ]] --[[ Name: sortWidgetIndexes ]]
    -- upvalues: v2 (copy)
    local v5 = v2.List.filter(v2.Dictionary.keys(v3), function(v4) --[[ Line: 31 ]]
        return tonumber(v4) ~= nil;
    end);
    local v7 = v2.List.map(v5, function(v6) --[[ Line: 35 ]]
        return (tonumber(v6));
    end);
    table.sort(v7);
    return v7;
end;
local function v15(v9) --[[ Line: 44 ]] --[[ Name: flattenHydratedContent ]]
    local v10 = {};
    for _, v12 in v9 do
        for v13, v14 in v12 do
            v10[tostring(v13)] = v14;
        end;
    end;
    return v10;
end;
local function v21(v16, v17) --[[ Line: 55 ]] --[[ Name: getItemsForWidget ]]
    -- upvalues: v2 (copy)
    if not v16 then
        return nil;
    else
        local v19 = v2.List.map(v16.content, function(v18) --[[ Line: 60 ]]
            -- upvalues: v17 (copy)
            return v17[tostring(v18.id)];
        end);
        return (v2.List.filter(v19, function(v20) --[[ Line: 64 ]]
            return v20 ~= nil;
        end));
    end;
end;
local function v30(v22, v23, v24) --[[ Line: 74 ]] --[[ Name: buildHydratedItemsForAllWidgets ]]
    -- upvalues: v21 (copy)
    local v25 = {};
    for _, v27 in v23 do
        local v28 = v22[tostring(v27)];
        local v29 = v21(v28, v24);
        if v29 and #v29 > 0 then
            table.insert(v25, {
                id = tostring(v28.id), 
                items = v29
            });
        end;
    end;
    return v25;
end;
local function _(v31, v32) --[[ Line: 97 ]] --[[ Name: getSelectedWidgetItems ]]
    local v33 = v31[v32];
    if v33 then
        return {
            [v33.id] = v33.items
        };
    else
        return nil;
    end;
end;
return function(v35) --[[ Line: 118 ]] --[[ Name: getHydratedWidgetItems ]]
    -- upvalues: v15 (copy), v8 (copy), v30 (copy)
    local l_hydratedWidgetData_0 = v35.hydratedWidgetData;
    local l_widgetInfoDetails_0 = v35.widgetInfoDetails;
    local l_selectedWidgetIndex_0 = v35.selectedWidgetIndex;
    if not l_widgetInfoDetails_0 or not l_hydratedWidgetData_0 or not next(l_hydratedWidgetData_0) then
        return nil;
    else
        local v39 = v15(l_hydratedWidgetData_0);
        local v40 = v8(l_widgetInfoDetails_0);
        if not v40 or #v40 == 0 then
            return nil;
        elseif l_selectedWidgetIndex_0 and #v40 < l_selectedWidgetIndex_0 then
            return nil;
        else
            local v41 = v30(l_widgetInfoDetails_0, v40, v39);
            if l_selectedWidgetIndex_0 then
                local v42 = v41[l_selectedWidgetIndex_0];
                if v42 then
                    return {
                        [v42.id] = v42.items
                    };
                else
                    return nil;
                end;
            else
                local v43 = {};
                for _, v45 in v41 do
                    v43[v45.id] = v45.items;
                end;
                return v43;
            end;
        end;
    end;
end;