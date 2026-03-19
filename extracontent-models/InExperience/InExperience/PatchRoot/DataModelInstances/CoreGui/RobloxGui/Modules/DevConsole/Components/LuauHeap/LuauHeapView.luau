local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v4 = require(l_Components_0.HeaderButton);
local v5 = require(l_Components_0.BannerButton);
local v6 = require(l_Components_0.CellLabel);
local v7 = require(l_Components_0.BoxButton);
local v8 = require(script.Parent.LuauHeapViewEntry);
local v9 = require(script.Parent.LuauHeapViewStatEntry);
local v10 = require(script.Parent.LuauHeapViewRefEntry);
local _ = require(script.Parent.LuauHeapTypes);
local l_Actions_0 = script.Parent.Parent.Parent.Actions;
local v13 = require(l_Actions_0.SetLuauHeapActiveSnapshot);
local v14 = require(l_Actions_0.SetLuauHeapCompareSnapshot);
local v15 = require(script.Parent.Parent.Parent.Constants);
local l_LineWidth_0 = v15.GeneralFormatting.LineWidth;
local l_LineColor_0 = v15.GeneralFormatting.LineColor;
local l_HeaderFrameHeight_0 = v15.GeneralFormatting.HeaderFrameHeight;
local l_EntryFrameHeight_0 = v15.GeneralFormatting.EntryFrameHeight;
local l_ValueCellWidth_0 = v15.LuauHeapFormatting.ValueCellWidth;
local l_CellPadding_0 = v15.LuauHeapFormatting.CellPadding;
local l_ValuePadding_0 = v15.LuauHeapFormatting.ValuePadding;
local l_SnapshotWidth_0 = v15.LuauHeapFormatting.SnapshotWidth;
local l_SnapshotHighlightSize_0 = v15.LuauHeapFormatting.SnapshotHighlightSize;
local l_TabsHeight_0 = v15.LuauHeapFormatting.TabsHeight;
local l_TabButtonWidth_0 = v15.LuauHeapFormatting.TabButtonWidth;
local l_TabButtonHeight_0 = v15.LuauHeapFormatting.TabButtonHeight;
local _ = v15.LuauHeapFormatting.TabButtonPad;
local l_TabHighlightHeight_0 = v15.LuauHeapFormatting.TabHighlightHeight;
local l_TableHintHeight_0 = v15.LuauHeapFormatting.TableHintHeight;
local v36 = {
    graph = {
        hint = "Graph displays the size of the objects in Luau VM aggregated by the shortest path from the root Engine references to them.\n\t\tMost important root references are ModuleScript tables and functions connected to signals or the task scheduler.", 
        headers = {
            "Name", 
            "Size", 
            "Self"
        }, 
        initFragmentSource = function(v31) --[[ Line: 47 ]] --[[ Name: initFragmentSource ]]
            return v31:renderChildren();
        end
    }, 
    tag = {
        hint = "This memory breakdown displays how much memory is used by Luau VM types.", 
        headers = {
            "Name", 
            "Size", 
            "Count"
        }, 
        initFragmentSource = function(v32) --[[ Line: 55 ]] --[[ Name: initFragmentSource ]]
            return v32:renderChildrenStats("TagBreakdown");
        end
    }, 
    memcat = {
        hint = "Memory separated by the category at the time of allocation.\n\t\tMemory category is assigned to the thread performing the allocation, not the script.\n\t\tDefault value is based on the script name. Custom value can be assigned using 'debug.setmemorycategory' API.", 
        headers = {
            "Name", 
            "Size", 
            "Count"
        }, 
        initFragmentSource = function(v33) --[[ Line: 65 ]] --[[ Name: initFragmentSource ]]
            return v33:renderChildrenStats("MemcatBreakdown");
        end
    }, 
    userdata = {
        hint = "This breakdown shows how much memory inside Luau VM is taken by custom Roblox engine classes.\n\t\tFor DataModel classes like 'Part' this does not include the memory taken inside the engine itself.", 
        headers = {
            "Name", 
            "Size", 
            "Count"
        }, 
        initFragmentSource = function(v34) --[[ Line: 74 ]] --[[ Name: initFragmentSource ]]
            return v34:renderChildrenStats("UserdataBreakdown");
        end
    }, 
    [game:GetEngineFeature("UnparentedInstances") and "UniqueRefs" or "refs"] = {
        hint = "This view shows engine DataModel instances that are only referenced by Luau VM and are not directly parented to the DataModel.\n\t\tFor each instance, it will show the set of paths that make it accessible and prevent garbage collection.\n\t\tMost often, engine Luau references come from ModuleScript tables, active signal connections and active coroutines in the task scheduler.", 
        headers = {
            "Name", 
            "Count", 
            "Total Instances"
        }, 
        initFragmentSource = function(v35) --[[ Line: 84 ]] --[[ Name: initFragmentSource ]]
            return v35:renderChildrenRefs();
        end
    }
};
if game:GetEngineFeature("UnparentedInstances") then
    v36.UnparentedRefs = {
        hint = "This view shows engine DataModel instances that are not parented to any instance (and are also not unique references).\n\t\tFor each instance, it will show the set of paths that make it accessible and prevent garbage collection.\n\t\t", 
        headers = {
            "Name", 
            "Count", 
            "Total Instances"
        }, 
        initFragmentSource = function(v37) --[[ Line: 97 ]] --[[ Name: initFragmentSource ]]
            return v37:renderUnparentedRefs();
        end
    };
end;
local v38 = v1.PureComponent:extend("LuauHeapView");
v38.renderSnapshotList = function(v39) --[[ Line: 105 ]] --[[ Name: renderSnapshotList ]]
    -- upvalues: v1 (copy), v5 (copy), l_EntryFrameHeight_0 (copy), v6 (copy), l_CellPadding_0 (copy), l_SnapshotHighlightSize_0 (copy), l_LineColor_0 (copy), v7 (copy)
    local l_data_0 = v39.props.data;
    local v41 = {};
    for v42, _ in l_data_0 do
        v41[v42] = v1.createElement(v5, {
            size = UDim2.new(1, 0, 0, l_EntryFrameHeight_0), 
            inset = 0, 
            isExpanded = false, 
            isExpandable = false, 
            layoutOrder = v42, 
            onButtonPress = function() --[[ Line: 117 ]] --[[ Name: onButtonPress ]]
                -- upvalues: v39 (copy), v42 (copy)
                v39.props.dispatchSetLuauHeapActiveSnapshot(v42);
            end
        }, {
            name = v1.createElement(v6, {
                text = ("Snapshot #%*"):format(v42), 
                size = UDim2.new(UDim.new(1, 0), UDim.new(1, 0)), 
                pos = UDim2.new(0, l_CellPadding_0, 0, 0)
            }), 
            HorizontalHighlightTop = if v39.props.activeSnapshot == v42 then v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_SnapshotHighlightSize_0), 
                BackgroundColor3 = l_LineColor_0
            }) else nil, 
            HorizontalHighlightBottom = if v39.props.activeSnapshot == v42 then v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_SnapshotHighlightSize_0), 
                Position = UDim2.new(0, 0, 1, -l_SnapshotHighlightSize_0), 
                BackgroundColor3 = l_LineColor_0
            }) else nil, 
            HorizontalHighlightLeft = if v39.props.activeSnapshot == v42 then v1.createElement("Frame", {
                Size = UDim2.new(0, l_SnapshotHighlightSize_0, 1, 0), 
                BackgroundColor3 = l_LineColor_0
            }) else nil, 
            HorizontalHighlightRight = if v39.props.activeSnapshot == v42 then v1.createElement("Frame", {
                Size = UDim2.new(0, l_SnapshotHighlightSize_0, 1, 0), 
                Position = UDim2.new(1, -l_SnapshotHighlightSize_0, 0, 0), 
                BackgroundColor3 = l_LineColor_0
            }) else nil, 
            Compare = if v39.props.activeSnapshot ~= v42 then v1.createElement(v7, {
                text = "Compare", 
                size = UDim2.new(0.3, -6, 1, -6), 
                pos = UDim2.new(0.7, 3, 0, 3), 
                onClicked = function() --[[ Line: 162 ]] --[[ Name: onClicked ]]
                    -- upvalues: v39 (copy), v42 (copy)
                    v39.props.dispatchSetLuauHeapCompareSnapshot(v42);
                end
            }) else nil
        });
    end;
    return v41;
end;
v38.renderChildren = function(v44) --[[ Line: 173 ]] --[[ Name: renderChildren ]]
    -- upvalues: v1 (copy), v8 (copy)
    local v45 = v44.props.data[v44.props.activeSnapshot];
    local v46 = v44.props.data[v44.props.compareSnapshot];
    return v1.createElement(v8, {
        layoutOrder = 0, 
        depth = 0, 
        data = if v45 then v45.Graph else nil, 
        compare = if v46 then v46.Graph else nil
    });
end;
v38.renderChildrenStats = function(v47, v48) --[[ Line: 185 ]] --[[ Name: renderChildrenStats ]]
    -- upvalues: v1 (copy), v9 (copy)
    local v49 = v47.props.data[v47.props.activeSnapshot];
    local v50 = v47.props.data[v47.props.compareSnapshot];
    local v51 = v49[v48];
    local v52 = if v50 then v50[v48] else nil;
    local v53 = {};
    for v54, v55 in v51 do
        local v56 = nil;
        if v52 then
            for _, v58 in ipairs(v52) do
                if v55.Name == v58.Name then
                    v56 = v58;
                    break;
                end;
            end;
        end;
        v53[v54] = v1.createElement(v9, {
            layoutOrder = -v55.Size, 
            depth = 0, 
            data = v55, 
            compare = v56
        });
    end;
    return v53;
end;
v38.renderUnparentedRefs = function(v59) --[[ Line: 217 ]] --[[ Name: renderUnparentedRefs ]]
    -- upvalues: v1 (copy), v10 (copy)
    local l_Refs_0 = v59.props.data[v59.props.activeSnapshot].Refs;
    if not l_Refs_0 then
        return {};
    else
        local l_UnparentedReferences_0 = l_Refs_0.UnparentedReferences;
        if not l_UnparentedReferences_0 then
            return {};
        else
            local v62 = {};
            for v63, v64 in l_UnparentedReferences_0 do
                v62[v63] = v1.createElement(v10, {
                    layoutOrder = -v64.Instances, 
                    depth = 0, 
                    data = v64
                });
            end;
            return v62;
        end;
    end;
end;
v38.renderChildrenRefs = function(v65) --[[ Line: 242 ]] --[[ Name: renderChildrenRefs ]]
    -- upvalues: v1 (copy), v10 (copy)
    local l_Refs_1 = v65.props.data[v65.props.activeSnapshot].Refs;
    if not l_Refs_1 then
        return {};
    else
        assert(l_Refs_1);
        local l_Roots_0 = l_Refs_1.Roots;
        local v68 = {};
        for v69, v70 in l_Roots_0 do
            v68[v69] = v1.createElement(v10, {
                layoutOrder = -v70.Instances, 
                depth = 0, 
                data = v70
            });
        end;
        return v68;
    end;
end;
v38.createTabSelector = function(v71, v72, v73) --[[ Line: 267 ]] --[[ Name: createTabSelector ]]
    -- upvalues: v1 (copy), v7 (copy), l_TabButtonWidth_0 (copy), l_TabButtonHeight_0 (copy), l_TabHighlightHeight_0 (copy), v15 (copy)
    local function _(v74) --[[ Line: 268 ]] --[[ Name: onTabSelected ]]
        -- upvalues: v71 (copy)
        v71:setState({
            activeTab = v74
        });
    end;
    local function v79(v76, v77, v78) --[[ Line: 274 ]] --[[ Name: createButton ]]
        -- upvalues: v1 (ref), v7 (ref), l_TabButtonWidth_0 (ref), l_TabButtonHeight_0 (ref), v71 (copy)
        return v1.createElement(v7, {
            text = v77, 
            size = UDim2.new(0, l_TabButtonWidth_0, 0, l_TabButtonHeight_0), 
            pos = UDim2.new(0, l_TabButtonWidth_0 * v78, 0, 0), 
            onClicked = function() --[[ Line: 279 ]] --[[ Name: onClicked ]]
                -- upvalues: v76 (copy), v71 (ref)
                v71:setState({
                    activeTab = v76
                });
            end
        });
    end;
    local function v82(v80, v81) --[[ Line: 285 ]] --[[ Name: createHighlight ]]
        -- upvalues: v71 (copy), v1 (ref), l_TabButtonWidth_0 (ref), l_TabHighlightHeight_0 (ref), l_TabButtonHeight_0 (ref), v15 (ref)
        if v71.state.activeTab == v80 then
            return (v1.createElement("Frame", {
                Size = UDim2.new(0, l_TabButtonWidth_0, 0, l_TabHighlightHeight_0), 
                Position = UDim2.new(0, l_TabButtonWidth_0 * v81, 0, l_TabButtonHeight_0 - l_TabHighlightHeight_0), 
                BorderSizePixel = 0, 
                BackgroundColor3 = v15.Color.HighlightBlue, 
                ZIndex = 10
            }));
        else
            return nil;
        end;
    end;
    if game:GetEngineFeature("UnparentedInstances") then
        return v1.createElement("Frame", {
            Size = v72, 
            Position = v73, 
            BackgroundTransparency = 1
        }, {
            Graph = v79("graph", "Graph", 0), 
            GraphHighlight = v82("graph", 0), 
            Tags = v79("tag", "Object Tags", 1), 
            TagHighlight = v82("tag", 1), 
            Memcat = v79("memcat", "Memory Categories", 2), 
            MemcatHighlight = v82("memcat", 2), 
            Userdata = v79("userdata", "Object Classes", 3), 
            UserdataHighlight = v82("userdata", 3), 
            Refs = v79("UniqueRefs", "Unique References", 4), 
            RefHighlight = v82("UniqueRefs", 4), 
            UnparentedInstances = v79("UnparentedRefs", "Unparented Instances", 5), 
            UnparentedHighlight = v82("UnparentedRefs", 5)
        });
    else
        return v1.createElement("Frame", {
            Size = v72, 
            Position = v73, 
            BackgroundTransparency = 1
        }, {
            Graph = v79("graph", "Graph", 0), 
            GraphHighlight = v82("graph", 0), 
            Tags = v79("tag", "Object Tags", 1), 
            TagHighlight = v82("tag", 1), 
            Memcat = v79("memcat", "Memory Categories", 2), 
            MemcatHighlight = v82("memcat", 2), 
            Userdata = v79("userdata", "Object Classes", 3), 
            UserdataHighlight = v82("userdata", 3), 
            Refs = v79("refs", "Unique References", 4), 
            RefHighlight = v82("refs", 4), 
            UnparentedInstances = v79("UnparentedRefs", "Unparented Instances", 5), 
            UnparentedHighlight = v82("UnparentedRefs", 5)
        });
    end;
end;
v38.createStatsTableHeader = function(v83, v84, v85, v86) --[[ Line: 347 ]] --[[ Name: createStatsTableHeader ]]
    -- upvalues: v1 (copy), l_SnapshotWidth_0 (copy), l_HeaderFrameHeight_0 (copy), v4 (copy), l_ValueCellWidth_0 (copy), l_ValuePadding_0 (copy), l_CellPadding_0 (copy), l_LineColor_0 (copy), l_LineWidth_0 (copy)
    return v1.createElement("Frame", {
        Size = UDim2.new(1 - l_SnapshotWidth_0, 0, 0, l_HeaderFrameHeight_0), 
        Position = UDim2.new(l_SnapshotWidth_0, 0, v84, v85), 
        BackgroundTransparency = 1
    }, {
        First = if v86[1] then v1.createElement(v4, {
            text = v86[1], 
            size = UDim2.new(1 - l_ValueCellWidth_0 * 2, -l_ValuePadding_0 - l_CellPadding_0, 0, l_HeaderFrameHeight_0), 
            pos = UDim2.new(0, l_CellPadding_0, 0, 0), 
            sortfunction = v83.onSortChanged
        }) else nil, 
        Second = if v86[2] then v1.createElement(v4, {
            text = v86[2], 
            size = UDim2.new(l_ValueCellWidth_0, -l_CellPadding_0, 0, l_HeaderFrameHeight_0), 
            pos = UDim2.new(1 - l_ValueCellWidth_0 * 2, l_ValuePadding_0, 0, 0), 
            sortfunction = v83.onSortChanged
        }) else nil, 
        Third = if v86[3] then v1.createElement(v4, {
            text = v86[3], 
            size = UDim2.new(l_ValueCellWidth_0, -l_CellPadding_0, 0, l_HeaderFrameHeight_0), 
            pos = UDim2.new(1 - l_ValueCellWidth_0, l_ValuePadding_0, 0, 0), 
            sortfunction = v83.onSortChanged
        }) else nil, 
        TopHorizontal = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 1), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        }), 
        LowerHorizontal = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
            Position = UDim2.new(0, 0, 1, 0), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        }), 
        Vertical1 = v1.createElement("Frame", {
            Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
            Position = UDim2.new(1 - l_ValueCellWidth_0, 0, 0, 0), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        }), 
        Vertical2 = v1.createElement("Frame", {
            Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
            Position = UDim2.new(1 - l_ValueCellWidth_0 * 2, 0, 0, 0), 
            BackgroundColor3 = l_LineColor_0, 
            BorderSizePixel = 0
        })
    });
end;
v38.init = function(v87) --[[ Line: 403 ]] --[[ Name: init ]]
    v87.state = {
        activeTab = "graph"
    };
end;
v38.render = function(v88) --[[ Line: 409 ]] --[[ Name: render ]]
    -- upvalues: v36 (copy), v1 (copy), v15 (copy), v4 (copy), l_SnapshotWidth_0 (copy), l_CellPadding_0 (copy), l_HeaderFrameHeight_0 (copy), l_TabsHeight_0 (copy), l_TableHintHeight_0 (copy)
    local l_layoutOrder_0 = v88.props.layoutOrder;
    local l_size_0 = v88.props.size;
    local v91 = nil;
    local v92 = v36[v88.state.activeTab];
    if not v88.props.data or #v88.props.data == 0 then
        v91 = v1.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            Text = "Capture a Snapshot to view details", 
            TextColor3 = v15.Color.Text, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_layoutOrder_0
        });
    end;
    return v1.createElement("Frame", {
        Size = l_size_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0
    }, {
        SnapshotHeader = v1.createElement(v4, {
            text = "Snapshots", 
            size = UDim2.new(l_SnapshotWidth_0, -l_CellPadding_0, 0, l_HeaderFrameHeight_0), 
            pos = UDim2.new(0, l_CellPadding_0, 0, 0)
        }), 
        Snapshots = v1.createElement("ScrollingFrame", {
            Size = UDim2.new(l_SnapshotWidth_0, -4, 1, -l_HeaderFrameHeight_0), 
            Position = UDim2.new(0, 2, 0, l_HeaderFrameHeight_0), 
            BackgroundTransparency = 1, 
            VerticalScrollBarInset = Enum.ScrollBarInset.None, 
            ScrollBarThickness = 5, 
            CanvasSize = UDim2.fromScale(0, 0), 
            AutomaticCanvasSize = Enum.AutomaticSize.Y
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Stroke = v1.createElement("UIStroke", {
                Thickness = 2, 
                Color = Color3.new(0.6, 0.6, 0.6)
            }), 
            Children = v1.createFragment(v88:renderSnapshotList())
        }), 
        Tabs = v88:createTabSelector(UDim2.new(1 - l_SnapshotWidth_0, 0, 0, l_TabsHeight_0), UDim2.new(l_SnapshotWidth_0, 0, 0, 0)), 
        Hint = v1.createElement("TextLabel", {
            Size = UDim2.new(1 - l_SnapshotWidth_0, 0, 0, l_TableHintHeight_0), 
            Position = UDim2.new(l_SnapshotWidth_0, 0, 0, l_TabsHeight_0), 
            Text = v92.hint, 
            TextColor3 = v15.Color.Text, 
            BackgroundTransparency = 1
        }), 
        Headers = v88:createStatsTableHeader(0, l_TabsHeight_0 + l_TableHintHeight_0, v92.headers), 
        Entries = v1.createElement("ScrollingFrame", {
            Size = UDim2.new(1 - l_SnapshotWidth_0, 0, 1, -(l_TabsHeight_0 + l_TableHintHeight_0 + l_HeaderFrameHeight_0)), 
            Position = UDim2.new(l_SnapshotWidth_0, 0, 0, l_TabsHeight_0 + l_TableHintHeight_0 + l_HeaderFrameHeight_0), 
            BackgroundTransparency = 1, 
            VerticalScrollBarInset = Enum.ScrollBarInset.None, 
            ScrollBarThickness = 5, 
            CanvasSize = UDim2.fromScale(0, 0), 
            AutomaticCanvasSize = Enum.AutomaticSize.Y
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Children = if v91 then v91 else v1.createFragment(v92.initFragmentSource(v88))
        })
    });
end;
return v2.UNSTABLE_connect2(nil, function(v93) --[[ Line: 491 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v13 (copy), v14 (copy)
    return {
        dispatchSetLuauHeapActiveSnapshot = function(v94) --[[ Line: 493 ]] --[[ Name: dispatchSetLuauHeapActiveSnapshot ]]
            -- upvalues: v93 (copy), v13 (ref)
            v93(v13(v94));
        end, 
        dispatchSetLuauHeapCompareSnapshot = function(v95) --[[ Line: 496 ]] --[[ Name: dispatchSetLuauHeapCompareSnapshot ]]
            -- upvalues: v93 (copy), v14 (ref)
            v93(v14(v95));
        end
    };
end)(v38);