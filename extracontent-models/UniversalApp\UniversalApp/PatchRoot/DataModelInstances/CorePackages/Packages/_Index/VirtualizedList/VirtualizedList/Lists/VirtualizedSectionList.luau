local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Boolean_0 = v2.Boolean;
local l_Object_0 = v2.Object;
local v6 = require(l_Parent_0.jsUtils.invariant);
local _ = require(script.Parent.ViewabilityHelper);
local l_keyExtractor_0 = require(script.Parent.VirtualizeUtils).keyExtractor;
local v9 = require(l_Parent_0.Components.View.View);
local v10 = require(script.Parent.VirtualizedList);
local v11 = require(l_Parent_1.React);
local v12 = nil;
local v13 = v11.PureComponent:extend("VirtualizedSectionList");
v13.init = function(v14) --[[ Line: 206 ]] --[[ Name: init ]]
    -- upvalues: v6 (copy), l_keyExtractor_0 (copy), l_Object_0 (copy), l_Array_0 (copy), l_Boolean_0 (copy), v11 (copy), v12 (ref)
    v14._updateHighlightMap = {};
    v14._updatePropsMap = {};
    v14._listRef = nil;
    v14._captureRef = function(v15) --[[ Line: 210 ]]
        -- upvalues: v14 (copy)
        v14._listRef = v15;
    end;
    v14._keyExtractor = function(_, v17) --[[ Line: 214 ]]
        -- upvalues: v14 (copy)
        local v18 = v14:_subExtractor(v17);
        if v18 then
            return v18.key;
        else
            return (tostring(v17));
        end;
    end;
    v14._convertViewable = function(v19) --[[ Line: 219 ]]
        -- upvalues: v6 (ref), v14 (copy), l_keyExtractor_0 (ref), l_Object_0 (ref)
        v6(v19.index ~= nil, "Received a broken ViewToken");
        local v20 = v14:_subExtractor(v19.index);
        if not v20 then
            return nil;
        else
            local l_keyExtractor_1 = v20.section.keyExtractor;
            local v22 = if v14.props.keyExtractor then v14.props.keyExtractor else l_keyExtractor_0;
            local v23 = if l_keyExtractor_1 ~= nil then l_keyExtractor_1(v19.item, v20.index) else v22(v19.item, v20.index == nil and 1 or v20.index);
            return l_Object_0.assign({}, v19, {
                index = v20.index, 
                key = v23, 
                section = v20.section
            });
        end;
    end;
    v14._onViewableItemsChanged = function(v24) --[[ Line: 242 ]]
        -- upvalues: v14 (copy), l_Array_0 (ref), l_Boolean_0 (ref)
        local l_viewableItems_0 = v24.viewableItems;
        local l_changed_0 = v24.changed;
        local l_onViewableItemsChanged_0 = v14.props.onViewableItemsChanged;
        if l_onViewableItemsChanged_0 ~= nil then
            l_onViewableItemsChanged_0({
                viewableItems = l_Array_0.filter(l_Array_0.map(l_viewableItems_0, v14._convertViewable, v14), l_Boolean_0.toJSBoolean), 
                changed = l_Array_0.filter(l_Array_0.map(l_changed_0, v14._convertViewable, v14), l_Boolean_0.toJSBoolean)
            });
        end;
    end;
    v14._renderItem = function(v28) --[[ Line: 259 ]]
        -- upvalues: v14 (copy), l_Boolean_0 (ref), v6 (ref), v11 (ref), v12 (ref)
        return function(v29) --[[ Line: 260 ]]
            -- upvalues: v14 (ref), l_Boolean_0 (ref), v28 (copy), v6 (ref), v11 (ref), v12 (ref)
            local l_item_0 = v29.item;
            local l_index_0 = v29.index;
            local v32 = v14:_subExtractor(l_index_0);
            if not v32 then
                return nil;
            else
                local l_index_1 = v32.index;
                if l_index_1 == nil then
                    local l_section_0 = v32.section;
                    if v32.header == true then
                        local l_renderSectionHeader_0 = v14.props.renderSectionHeader;
                        if l_Boolean_0.toJSBoolean(l_renderSectionHeader_0) then
                            return (l_renderSectionHeader_0({
                                section = l_section_0
                            }));
                        else
                            return nil;
                        end;
                    else
                        local l_renderSectionFooter_0 = v14.props.renderSectionFooter;
                        if l_Boolean_0.toJSBoolean(l_renderSectionFooter_0) then
                            return (l_renderSectionFooter_0({
                                section = l_section_0
                            }));
                        else
                            return nil;
                        end;
                    end;
                else
                    local v37 = v32.section.renderItem or v14.props.renderItem;
                    local v38 = v14:_getSeparatorComponent(l_index_0, v32, v28);
                    v6(v37, "no renderItem!");
                    return v11.createElement(v12, {
                        SeparatorComponent = v38, 
                        LeadingSeparatorComponent = if l_index_1 == 1 then v14.props.SectionSeparatorComponent else nil, 
                        cellKey = v32.key, 
                        index = l_index_1, 
                        item = l_item_0, 
                        leadingItem = v32.leadingItem, 
                        leadingSection = v32.leadingSection, 
                        prevCellKey = (v14:_subExtractor(l_index_0 - 1) or {}).key, 
                        setSelfHighlightCallback = v14._setUpdateHighlightFor, 
                        setSelfUpdatePropsCallback = v14._setUpdatePropsFor, 
                        updateHighlightFor = v14._updateHighlightFor, 
                        updatePropsFor = v14._updatePropsFor, 
                        renderItem = v37, 
                        section = v32.section, 
                        trailingItem = v32.trailingItem, 
                        trailingSection = v32.trailingSection, 
                        inverted = l_Boolean_0.toJSBoolean(v14.props.inverted), 
                        horizontal = v14.props.horizontal
                    });
                end;
            end;
        end;
    end;
    v14._updatePropsFor = function(v39, v40) --[[ Line: 312 ]]
        -- upvalues: v14 (copy)
        local v41 = v14._updatePropsMap[v39];
        if v41 ~= nil then
            v41(v40);
        end;
    end;
    v14._updateHighlightFor = function(v42, v43) --[[ Line: 319 ]]
        -- upvalues: v14 (copy)
        local v44 = v14._updateHighlightMap[v42];
        if v44 ~= nil then
            v44(v43);
        end;
    end;
    v14._setUpdateHighlightFor = function(v45, v46) --[[ Line: 326 ]]
        -- upvalues: v14 (copy)
        if v46 ~= nil then
            v14._updateHighlightMap[v45] = v46;
            return;
        else
            v14._updateHighlightMap[v45] = nil;
            return;
        end;
    end;
    v14._setUpdatePropsFor = function(v47, v48) --[[ Line: 334 ]]
        -- upvalues: v14 (copy)
        if v48 ~= nil then
            v14._updatePropsMap[v47] = v48;
            return;
        else
            v14._updatePropsMap[v47] = nil;
            return;
        end;
    end;
end;
v13.scrollToLocation = function(v49, v50) --[[ Line: 343 ]] --[[ Name: scrollToLocation ]]
    -- upvalues: l_Object_0 (copy)
    local l_itemIndex_0 = v50.itemIndex;
    local v52 = 1;
    while v52 < v50.sectionIndex do
        l_itemIndex_0 = l_itemIndex_0 + (v49.props.getItemCount(v49.props.sections[v52].data) + 2);
        v52 = v52 + 1;
    end;
    local v53 = v50.viewOffset or 0;
    if v49._listRef == nil then
        return;
    else
        if v50.itemIndex > 1 and v49.props.stickySectionHeadersEnabled then
            v53 = v53 + v49._listRef.__getFrameMetricsApprox(l_itemIndex_0 - v50.itemIndex).length;
        end;
        local v54 = l_Object_0.assign({}, v50, {
            viewOffset = v53, 
            index = l_itemIndex_0
        });
        v49._listRef:scrollToIndex(v54);
        return;
    end;
end;
v13.getListRef = function(v55) --[[ Line: 365 ]] --[[ Name: getListRef ]]
    return v55._listRef;
end;
v13.render = function(v56) --[[ Line: 369 ]] --[[ Name: render ]]
    -- upvalues: l_Object_0 (copy), v11 (copy), v10 (copy)
    local _ = v56.props.renderItem;
    local _ = v56.props.sections;
    local v59 = l_Object_0.assign({}, v56.props, {
        ItemSeparatorComponent = l_Object_0.None, 
        SectionSeparatorComponent = l_Object_0.None, 
        renderItem = l_Object_0.None, 
        renderSectionFooter = l_Object_0.None, 
        renderSectionHeader = l_Object_0.None, 
        sections = l_Object_0.None, 
        stickySectionHeadersEnabled = l_Object_0.None
    });
    local v60 = v56.props.ListHeaderComponent and 1 or 0;
    local v61 = if v56.props.stickySectionHeadersEnabled then {} else nil;
    local v62 = 0;
    for _, v64 in ipairs(v56.props.sections) do
        if v61 ~= nil then
            table.insert(v61, v62 + v60);
        end;
        v62 = v62 + 2 + v56.props.getItemCount(v64.data);
    end;
    local v65 = v56._renderItem(v62);
    return v11.createElement(v10, l_Object_0.assign({}, v59, {
        keyExtractor = v56._keyExtractor, 
        stickyHeaderIndices = v61, 
        renderItem = v65, 
        data = v56.props.sections, 
        getItem = function(v66, v67) --[[ Line: 406 ]] --[[ Name: getItem ]]
            -- upvalues: v56 (copy)
            return v56:_getItem(v56.props, v66, v67);
        end, 
        getItemCount = function() --[[ Line: 409 ]] --[[ Name: getItemCount ]]
            -- upvalues: v62 (ref)
            return v62;
        end, 
        onViewableItemsChanged = if v56.props.onViewableItemsChanged then v56._onViewableItemsChanged else nil, 
        ref = v56._captureRef
    }));
end;
v13._getItem = function(_, v69, v70, v71) --[[ Line: 418 ]] --[[ Name: _getItem ]]
    if not v70 then
        return nil;
    else
        local v72 = v71 - 1;
        local v73 = 1;
        while true do
            if v73 <= #v70 then
                local v74 = v70[v73];
                local l_data_0 = v74.data;
                local v76 = v69.getItemCount(l_data_0);
                if v72 == 0 or v72 == v76 + 1 then
                    return v74;
                elseif v72 <= v76 then
                    return v69.getItem(l_data_0, v72);
                else
                    v72 = v72 - (v76 + 2);
                    v73 = v73 + 1;
                end;
            else
                return nil;
            end;
        end;
    end;
end;
v13._subExtractor = function(v77, v78) --[[ Line: 449 ]] --[[ Name: _subExtractor ]]
    -- upvalues: l_Boolean_0 (copy), l_keyExtractor_0 (copy)
    local l_v78_0 = v78;
    local v80 = nil;
    local v81 = nil;
    local v82 = nil;
    local v83 = nil;
    local l_props_0 = v77.props;
    v80 = l_props_0.getItem;
    v81 = l_props_0.getItemCount;
    v82 = l_props_0.keyExtractor;
    v83 = l_props_0.sections;
    l_props_0 = 1;
    while true do
        if l_props_0 <= #v83 then
            local v85 = v83[l_props_0];
            local l_data_1 = v85.data;
            local v87 = if l_Boolean_0.toJSBoolean(v85.key) then tostring(v85.key) else tostring(l_props_0);
            l_v78_0 = l_v78_0 - 1;
            if v81(l_data_1) + 1 < l_v78_0 then
                l_v78_0 = l_v78_0 - (v81(l_data_1) + 1);
                l_props_0 = l_props_0 + 1;
            elseif l_v78_0 == 0 then
                return {
                    section = v85, 
                    key = v87 .. ":header", 
                    index = nil, 
                    header = true, 
                    trailingSection = v83[l_props_0 + 1]
                };
            elseif l_v78_0 == v81(l_data_1) + 1 then
                return {
                    section = v85, 
                    key = v87 .. ":footer", 
                    index = nil, 
                    header = false, 
                    trailingSection = v83[l_props_0 + 1]
                };
            else
                local v88 = v85.keyExtractor or v82 or l_keyExtractor_0;
                return {
                    section = v85, 
                    key = v87 .. ":" .. tostring(v88(v80(l_data_1, l_v78_0), l_v78_0)), 
                    index = l_v78_0, 
                    leadingItem = v80(l_data_1, l_v78_0 - 1), 
                    leadingSection = v83[l_props_0 - 1], 
                    trailingItem = v80(l_data_1, l_v78_0 + 1), 
                    trailingSection = v83[l_props_0 + 1]
                };
            end;
        else
            return nil;
        end;
    end;
end;
v13._getSeparatorComponent = function(v89, v90, v91, v92) --[[ Line: 511 ]] --[[ Name: _getSeparatorComponent ]]
    -- upvalues: l_Boolean_0 (copy)
    if not v91 then
        v91 = v89:_subExtractor(v90);
    end;
    if not v91 then
        return nil;
    else
        local l_v91_0 = v91;
        local v94 = l_Boolean_0.toJSBoolean(l_v91_0.section.ItemSeparatorComponent) and l_v91_0.section.ItemSeparatorComponent or v89.props.ItemSeparatorComponent;
        local l_SectionSeparatorComponent_0 = v89.props.SectionSeparatorComponent;
        local v96 = v90 == v92;
        local v97 = l_v91_0.index == v89.props.getItemCount(l_v91_0.section.data);
        if l_SectionSeparatorComponent_0 and v97 then
            return l_SectionSeparatorComponent_0;
        elseif v94 and not v97 and not v96 then
            return v94;
        else
            return nil;
        end;
    end;
end;
v12 = function(v98) --[[ Line: 563 ]] --[[ Name: ItemWithSeparator ]]
    -- upvalues: v11 (copy), l_Object_0 (copy), v9 (copy)
    local l_LeadingSeparatorComponent_0 = v98.LeadingSeparatorComponent;
    local l_SeparatorComponent_0 = v98.SeparatorComponent;
    local l_cellKey_0 = v98.cellKey;
    local l_prevCellKey_0 = v98.prevCellKey;
    local l_setSelfHighlightCallback_0 = v98.setSelfHighlightCallback;
    local l_updateHighlightFor_0 = v98.updateHighlightFor;
    local l_setSelfUpdatePropsCallback_0 = v98.setSelfUpdatePropsCallback;
    local l_updatePropsFor_0 = v98.updatePropsFor;
    local l_item_1 = v98.item;
    local l_index_2 = v98.index;
    local l_section_1 = v98.section;
    local l_inverted_0 = v98.inverted;
    local v111, v112 = v11.useState(false);
    local v113, v114 = v11.useState(false);
    local v115, v116 = v11.useState({
        leadingItem = v98.leadingItem, 
        leadingSection = v98.leadingSection, 
        section = v98.section, 
        trailingItem = v98.item, 
        trailingSection = v98.trailingSection, 
        LayoutOrder = -1
    });
    local v117, v118 = v11.useState({
        leadingItem = v98.item, 
        leadingSection = v98.leadingSection, 
        section = v98.section, 
        trailingItem = v98.trailingItem, 
        trailingSection = v98.trailingSection, 
        LayoutOrder = 1
    });
    v11.useEffect(function() --[[ Line: 601 ]]
        -- upvalues: l_setSelfHighlightCallback_0 (copy), l_cellKey_0 (copy), v114 (copy), l_setSelfUpdatePropsCallback_0 (copy), v118 (copy)
        l_setSelfHighlightCallback_0(l_cellKey_0, v114);
        l_setSelfUpdatePropsCallback_0(l_cellKey_0, v118);
        return function() --[[ Line: 604 ]]
            -- upvalues: l_setSelfUpdatePropsCallback_0 (ref), l_cellKey_0 (ref), l_setSelfHighlightCallback_0 (ref)
            l_setSelfUpdatePropsCallback_0(l_cellKey_0, nil);
            l_setSelfHighlightCallback_0(l_cellKey_0, nil);
        end;
    end, {
        l_cellKey_0, 
        l_setSelfHighlightCallback_0, 
        v118, 
        l_setSelfUpdatePropsCallback_0
    });
    local v121 = {
        highlight = function() --[[ Line: 611 ]] --[[ Name: highlight ]]
            -- upvalues: v112 (copy), v114 (copy), l_prevCellKey_0 (copy), l_updateHighlightFor_0 (copy)
            v112(true);
            v114(true);
            if l_prevCellKey_0 ~= nil then
                l_updateHighlightFor_0(l_prevCellKey_0, true);
            end;
        end, 
        unhighlight = function() --[[ Line: 618 ]] --[[ Name: unhighlight ]]
            -- upvalues: v112 (copy), v114 (copy), l_prevCellKey_0 (copy), l_updateHighlightFor_0 (copy)
            v112(false);
            v114(false);
            if l_prevCellKey_0 ~= nil then
                l_updateHighlightFor_0(l_prevCellKey_0, false);
            end;
        end, 
        updateProps = function(v119, v120) --[[ Line: 625 ]] --[[ Name: updateProps ]]
            -- upvalues: l_LeadingSeparatorComponent_0 (copy), v116 (copy), l_Object_0 (ref), v115 (copy), l_prevCellKey_0 (copy), l_updatePropsFor_0 (copy), l_SeparatorComponent_0 (copy), v118 (copy), v117 (copy)
            if v119 == "leading" then
                if l_LeadingSeparatorComponent_0 ~= nil then
                    v116(l_Object_0.assign({}, v115, v120));
                    return;
                elseif l_prevCellKey_0 ~= nil then
                    l_updatePropsFor_0(l_prevCellKey_0, l_Object_0.assign({}, v115, v120));
                    return;
                end;
            elseif v119 == "trailing" and l_SeparatorComponent_0 ~= nil then
                v118(l_Object_0.assign({}, v117, v120));
            end;
        end
    };
    local v122 = v98.renderItem({
        item = l_item_1, 
        index = l_index_2, 
        section = l_section_1, 
        separators = v121
    });
    local v123 = false;
    if l_LeadingSeparatorComponent_0 ~= nil then
        v123 = v11.createElement(l_LeadingSeparatorComponent_0, l_Object_0.assign({
            highlighted = v111
        }, v115));
    end;
    local v124 = false;
    if l_SeparatorComponent_0 ~= nil then
        v124 = v11.createElement(l_SeparatorComponent_0, l_Object_0.assign({
            highlighted = v113
        }, v117));
    end;
    if v123 or v124 then
        return (v11.createElement(v9, {
            Size = if v98.horizontal then UDim2.new(0, 0, 1, 0) else UDim2.new(1, 0, 0, 0), 
            AutomaticSize = if v98.horizontal then Enum.AutomaticSize.X else Enum.AutomaticSize.Y
        }, v11.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = if v98.horizontal then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical
        }), if l_inverted_0 == false then v123 else v124, v122, if l_inverted_0 == false then v124 else v123));
    else
        return v122;
    end;
end;
return v13;