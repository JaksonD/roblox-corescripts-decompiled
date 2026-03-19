local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(l_CoreGui_0.RobloxGui.Modules.Stats.BaseMemoryAnalyzer);
local v2 = require(l_CoreGui_0.RobloxGui.Modules.Stats.TreeViewItem);
local _ = require(l_CoreGui_0.RobloxGui.Modules.Common.CommonUtil);
local function v10(v4, v5) --[[ Line: 25 ]] --[[ Name: __ReadAndSumValues ]]
    local v6 = 0;
    for v7, v8 in pairs(v5) do
        local v9 = v8 / 1048576;
        v6 = v6 + v9;
        v4:getOrMakeChildById(v7):setLabelAndValue(v7, v9);
    end;
    return v6;
end;
local v11 = {};
setmetatable(v11, v1);
v11.__index = v11;
v11.new = function(v12) --[[ Line: 52 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v11 (copy)
    local v13 = v1.new(v12);
    setmetatable(v13, v11);
    v13._cachedRootTreeViewItem = nil;
    v13._coreTreeViewItem = nil;
    v13._placeTreeViewItem = nil;
    v13._untrackedTreeViewItem = nil;
    v13._isVisible = false;
    return v13;
end;
v11.filterServerMemoryTreeStats = function(_, v15) --[[ Line: 78 ]] --[[ Name: filterServerMemoryTreeStats ]]
    if v15.ServerMemoryTree == nil then
        return {};
    else
        return v15.ServerMemoryTree;
    end;
end;
v11.updateWithTreeStats = function(v16, v17) --[[ Line: 86 ]] --[[ Name: updateWithTreeStats ]]
    -- upvalues: v2 (copy), v10 (copy)
    local v18 = 0;
    if v16._cachedRootTreeViewItem == nil then
        v16._cachedRootTreeViewItem = v2.new("root", nil);
        v16._coreTreeViewItem = v16._cachedRootTreeViewItem:getOrMakeChildById("CoreMemory");
        v16._placeTreeViewItem = v16._cachedRootTreeViewItem:getOrMakeChildById("PlaceMemory");
        v16._untrackedTreeViewItem = v16._cachedRootTreeViewItem:getOrMakeChildById("UntrackedMemory");
    end;
    for v19, v20 in pairs(v17) do
        if v19 == "totalServerMemory" then
            v18 = v20 / 1048576;
        elseif v19 == "developerTags" then
            local v21 = v10(v16._placeTreeViewItem, v20);
            v16._placeTreeViewItem:setLabelAndValue("PlaceMemory", v21);
        elseif v19 == "internalCategories" then
            local v22 = v10(v16._coreTreeViewItem, v20);
            v16._coreTreeViewItem:setLabelAndValue("CoreMemory", v22);
        end;
    end;
    v16._cachedRootTreeViewItem:setLabelAndValue("Memory", v18);
    local v23 = v18 - (v16._coreTreeViewItem:getValue() + v16._placeTreeViewItem:getValue());
    v16._untrackedTreeViewItem:setLabelAndValue("UntrackedMemory", v23);
    v16:renderUpdates();
end;
v11.getMemoryUsageTree = function(v24) --[[ Line: 123 ]] --[[ Name: getMemoryUsageTree ]]
    return v24._cachedRootTreeViewItem;
end;
v11.setVisible = function(v25, v26) --[[ Line: 127 ]] --[[ Name: setVisible ]]
    v25._isVisible = v26;
    if v25._isVisible then
        v25:renderUpdates();
    end;
end;
return v11;