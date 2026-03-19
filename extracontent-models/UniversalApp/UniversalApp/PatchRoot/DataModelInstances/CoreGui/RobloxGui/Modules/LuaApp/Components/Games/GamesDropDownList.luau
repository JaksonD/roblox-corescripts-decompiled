local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local l_TopicInfosReducer_0 = require(l_CorePackages_0.Workspace.Packages.TopicInfosRodux).TopicInfosReducer;
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local l_OmniFeedTypes_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).OmniFeedTypes;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v7 = require(l_Modules_0.LuaApp.Components.DropDownList);
local l_isSduiGameOmniFeedItem_0 = require(l_CorePackages_0.Workspace.Packages.ServerDrivenUi).isSduiGameOmniFeedItem;
local v9 = v1.PureComponent:extend("GamesDropDownList");
v9.init = function(v10) --[[ Line: 30 ]] --[[ Name: init ]]
    v10.state = {};
    v10.dropDownSelectedCallback = function(v11, v12) --[[ Line: 33 ]]
        -- upvalues: v10 (copy)
        if v10.props.onSelected then
            local l_items_0 = v10.props.items;
            local l_dropdownPositionToStoreIndex_0 = v10.props.dropdownPositionToStoreIndex;
            assert(l_dropdownPositionToStoreIndex_0);
            if v12 <= #l_items_0 then
                local v15 = l_dropdownPositionToStoreIndex_0[v12];
                if v15 then
                    return v10.props.onSelected(v11, v15, v12);
                end;
            end;
        end;
    end;
end;
v9.render = function(v16) --[[ Line: 49 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v7 (copy)
    local l_items_1 = v16.props.items;
    local l_itemSelected_0 = v16.props.itemSelected;
    local l_position_0 = v16.props.position;
    local l_size_0 = v16.props.size;
    return v1.createElement(v7, {
        position = l_position_0, 
        size = l_size_0, 
        items = l_items_1, 
        itemSelected = l_itemSelected_0, 
        onSelected = v16.dropDownSelectedCallback
    });
end;
local v37 = l_memoize_0(function(v21, v22, v23, v24) --[[ Line: 65 ]]
    -- upvalues: l_OmniFeedTypes_0 (copy), l_isSduiGameOmniFeedItem_0 (copy)
    local v25 = {};
    local v26 = {};
    local function _(v27, v28) --[[ Line: 69 ]] --[[ Name: addSortToResult ]]
        -- upvalues: v25 (copy), v26 (copy)
        table.insert(v25, v27);
        v26[#v25] = v28;
    end;
    for _, v31 in pairs(v24) do
        if v31.isOmni then
            for v32, v33 in ipairs(v23) do
                local v34 = v21[v33.topicId];
                if v34.treatmentType == l_OmniFeedTypes_0.Carousel or l_isSduiGameOmniFeedItem_0(v34.treatmentType, v34.topicId) then
                    table.insert(v25, v34);
                    v26[#v25] = v32;
                end;
            end;
        else
            for v35, v36 in ipairs(v22[v31.sortType].sorts) do
                table.insert(v25, v21[v36]);
                v26[#v25] = v35;
            end;
        end;
    end;
    return v25, v26;
end);
return v2.connect(function(v38, v39) --[[ Line: 96 ]]
    -- upvalues: l_TopicInfosReducer_0 (copy), v37 (copy)
    local v40 = v38.Personalization[l_TopicInfosReducer_0.key][v39.selectedSortName];
    local v41 = {};
    if v39.isOmni then
        local l_sortType_0 = v39.sortCategories.OMNI_HOME.sortType;
        if v38.OmniRecommendations and v38.OmniRecommendations[l_sortType_0] then
            v41 = v38.OmniRecommendations[l_sortType_0].sorts or {};
        end;
    end;
    local v43, v44 = v37(v38.Personalization[l_TopicInfosReducer_0.key], v38.GameSortGroups, v41, v39.sortCategories);
    return {
        items = v43 or {}, 
        itemSelected = v40 or {}, 
        dropdownPositionToStoreIndex = v44
    };
end)(v9);