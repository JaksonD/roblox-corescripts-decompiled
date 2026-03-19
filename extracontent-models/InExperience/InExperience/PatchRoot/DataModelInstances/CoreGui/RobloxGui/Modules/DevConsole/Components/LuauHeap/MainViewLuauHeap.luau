local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("ScriptContext");
local l_HttpService_0 = game:GetService("HttpService");
local l_HeapProfilerService_0 = game:GetService("HeapProfilerService");
local l_Players_0 = game:GetService("Players");
local v5 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local v6 = require(l_CorePackages_0.Packages.Roact);
local v7 = require(l_CorePackages_0.Packages.RoactRodux);
local l_memoize_0 = v5.memoize;
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v10 = require(l_Components_0.DataConsumer);
local v11 = require(l_Components_0.UtilAndTab);
local v12 = require(l_Components_0.BoxButton);
local v13 = require(script.Parent.LuauHeapView);
local _ = require(script.Parent.LuauHeapTypes);
local l_Actions_0 = script.Parent.Parent.Parent.Actions;
local v16 = require(l_Actions_0.SetLuauHeapState);
local v17 = require(l_Actions_0.SetLuauHeapProfileTarget);
local v18 = require(script.Parent.Parent.Parent.Constants);
local l_MainRowPadding_0 = v18.GeneralFormatting.MainRowPadding;
local v20 = v6.PureComponent:extend("MainViewLuauHeap");
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local function v22(v23, v24) --[[ Line: 34 ]] --[[ Name: filterNode ]]
    -- upvalues: v22 (copy)
    if v24 == nil then
        return false;
    else
        local v25 = table.clone(v23);
        local v26 = false;
        if v25.Name ~= nil then
            v26 = string.find(string.lower(v25.Name), string.lower(v24), 1, true) ~= nil;
        end;
        if v25.Source ~= nil then
            local v27 = string.find(string.lower(v25.Source), string.lower(v24), 1, true) ~= nil;
            v26 = v26 or v27;
        end;
        if v25.Paths ~= nil then
            for _, v29 in v25.Paths do
                for _, v31 in v29 do
                    local v32 = string.find(string.lower(v31), string.lower(v24), 1, true) ~= nil;
                    v26 = v26 or v32;
                end;
            end;
        end;
        if v25.Roots ~= nil then
            local v33 = {};
            for _, v35 in v25.Roots do
                local v36 = table.clone(v35);
                local v37 = v22(v36, v24);
                if v37 then
                    table.insert(v33, v36);
                end;
                v26 = v26 or v37;
            end;
            v25.Roots = v33;
        end;
        if v25.Children ~= nil then
            local v38 = {};
            for _, v40 in v25.Children do
                local v41 = table.clone(v40);
                local v42 = v22(v41, v24);
                if v42 then
                    table.insert(v38, v40);
                end;
                v26 = v26 or v42;
            end;
            v25.Children = v38;
        end;
        if v26 then
            return v25;
        else
            return nil;
        end;
    end;
end;
local function v48(v43, v44) --[[ Line: 93 ]] --[[ Name: filterHeapReportsStatEntryList ]]
    if v44 == nil then
        return v43;
    else
        local v45 = {};
        for _, v47 in v43 do
            if string.find(string.lower(v47.Name), string.lower(v44), 1, true) ~= nil then
                table.insert(v45, (table.clone(v47)));
            end;
        end;
        return v45;
    end;
end;
local function v49(v50, v51, v52) --[[ Line: 112 ]] --[[ Name: filterHeapReportGraph ]]
    -- upvalues: v49 (copy)
    if v51 == nil then
        return v50;
    else
        v50 = table.clone(v50);
        local v53 = {};
        for _, v55 in v50.Children do
            local v56 = v49(v55, v51, v52 + 1);
            if v56 then
                table.insert(v53, v56);
            end;
        end;
        v50.Children = v53;
        if v52 == 0 then
            return v50;
        else
            local v57 = #v53 > 0;
            if string.find(string.lower(v50.Name), string.lower(v51), 1, true) ~= nil then
                v57 = true;
            end;
            if v57 then
                return v50;
            else
                return nil;
            end;
        end;
    end;
end;
local function v63(v58, v59) --[[ Line: 143 ]] --[[ Name: filterUniqueRefEntryPath ]]
    if v59 == nil then
        return v58;
    else
        local v60 = {};
        for _, v62 in v58 do
            if string.find(string.lower(v62), string.lower(v59), 1, true) ~= nil then
                table.insert(v60, v62);
            end;
        end;
        if #v60 > 0 then
            return v60;
        else
            return nil;
        end;
    end;
end;
local function v70(v64, v65) --[[ Line: 162 ]] --[[ Name: filterUniqueRefEntryPathList ]]
    -- upvalues: v63 (copy)
    if v65 == nil then
        return v64;
    else
        local v66 = {};
        for _, v68 in v64 do
            local v69 = v63(v68, v65);
            if v69 then
                table.insert(v66, v69);
            end;
        end;
        return v66;
    end;
end;
local function v76(v71, v72) --[[ Line: 182 ]] --[[ Name: filterUniqueRefEntry ]]
    -- upvalues: v70 (copy)
    if v72 == nil then
        return v71;
    else
        local v73 = table.clone(v71);
        local v74 = false;
        if string.find(string.lower(v73.Name), string.lower(v72), 1, true) ~= nil then
            v74 = true;
        end;
        local v75 = v70(v73.Paths, v72);
        v73.Paths = v75;
        if #v75 > 0 then
            v74 = true;
        end;
        if v74 then
            return v73;
        else
            return nil;
        end;
    end;
end;
local function v83(v77, v78) --[[ Line: 211 ]] --[[ Name: filterUniqueRefReport ]]
    -- upvalues: v76 (copy)
    if v78 == nil or v77 == nil then
        return v77;
    else
        v77 = table.clone(v77);
        local v79 = {};
        for _, v81 in v77.Roots do
            local v82 = v76(v81, v78);
            if v82 then
                table.insert(v79, v82);
            end;
        end;
        v77.Roots = v79;
        return v77;
    end;
end;
local function v91(v84, v85, _) --[[ Line: 230 ]] --[[ Name: filterSnapshots ]]
    -- upvalues: v48 (copy), v49 (copy), v83 (copy)
    if v85 == nil then
        return v84;
    else
        local v87 = {};
        for _, v89 in v84 do
            local v90 = table.clone(v89);
            v90.TagBreakdown = v48(v90.TagBreakdown, v85);
            v90.MemcatBreakdown = v48(v90.MemcatBreakdown, v85);
            v90.UserdataBreakdown = v48(v90.UserdataBreakdown, v85);
            v90.Graph = v49(v90.Graph, v85, 0);
            if v90.Refs then
                v90.Refs = v83(v90.Refs, v85);
            end;
            table.insert(v87, v90);
        end;
        return v87;
    end;
end;
v20.getState = function(v92, v93) --[[ Line: 258 ]] --[[ Name: getState ]]
    if v93 then
        return v92.props.client;
    else
        return v92.props.server;
    end;
end;
v20.getActiveState = function(v94) --[[ Line: 262 ]] --[[ Name: getActiveState ]]
    return v94.props.isClientView, v94:getState(v94.props.isClientView);
end;
v20.init = function(v95) --[[ Line: 266 ]] --[[ Name: init ]]
    -- upvalues: l_memoize_0 (copy), v91 (copy), l_HeapProfilerService_0 (copy), l_Players_0 (copy), l_HttpService_0 (copy), v6 (copy)
    v95.onUtilTabHeightChanged = function(v96) --[[ Line: 267 ]]
        -- upvalues: v95 (copy)
        v95:setState({
            utilTabHeight = v96
        });
    end;
    v95.version = 0;
    v95.dispatchSetLuauHeapState = function(v97, v98) --[[ Line: 275 ]]
        -- upvalues: v95 (copy)
        v95.version = v95.version + 1;
        v95.props.dispatchSetLuauHeapState(v97, v98);
    end;
    v95.onClientButton = function() --[[ Line: 279 ]]
        -- upvalues: v95 (copy)
        v95.props.dispatchSetLuauHeapProfileTarget(true);
    end;
    v95.onServerButton = function() --[[ Line: 283 ]]
        -- upvalues: v95 (copy)
        v95.props.dispatchSetLuauHeapProfileTarget(false);
    end;
    v95.filterSnapshots = l_memoize_0(v91);
    v95.onCreateSnapshot = function() --[[ Line: 289 ]]
        -- upvalues: v95 (copy), l_HeapProfilerService_0 (ref), l_Players_0 (ref), l_HttpService_0 (ref)
        local v99, v100 = v95:getActiveState();
        local v101 = nil;
        local v102 = nil;
        if v99 then
            local l_status_0, l_result_0 = pcall(l_HeapProfilerService_0.ClientRequestDataAsync, l_HeapProfilerService_0, l_Players_0.LocalPlayer);
            v101 = l_status_0;
            v102 = l_result_0;
        else
            local l_status_1, l_result_1 = pcall(l_HeapProfilerService_0.ServerRequestDataAsync, l_HeapProfilerService_0);
            v101 = l_status_1;
            v102 = l_result_1;
        end;
        if not v101 then
            warn(v102);
            return;
        else
            local v107 = l_HttpService_0:JSONDecode(v102);
            local l_Report_0 = v107.Report;
            l_Report_0.Refs = v107.Refs;
            local v109 = table.clone(v100);
            table.insert(v109.snapshots, l_Report_0);
            v109.active = #v109.snapshots;
            v95.dispatchSetLuauHeapState(v99, v109);
            return;
        end;
    end;
    v95.onClearSnapshots = function() --[[ Line: 317 ]]
        -- upvalues: v95 (copy)
        local v110, v111 = v95:getActiveState();
        local v112 = table.clone(v111);
        table.clear(v112.snapshots);
        v112.active = 0;
        v95.dispatchSetLuauHeapState(v110, v112);
    end;
    v95.utilRef = v6.createRef();
    v95.state = {
        searchTerm = nil, 
        utilTabHeight = 0
    };
    v95.onSearchTermChanged = function(v113) --[[ Line: 335 ]]
        -- upvalues: v95 (copy), v6 (ref)
        if v113 == nil or v113 == "" then
            v95:setState({
                searchTerm = v6.None
            });
            return;
        else
            v95:setState({
                searchTerm = v113
            });
            return;
        end;
    end;
end;
v20.didMount = function(v114) --[[ Line: 348 ]] --[[ Name: didMount ]]
    v114:setState({
        utilTabHeight = v114.utilRef.current.Size.Y.Offset
    });
end;
v20.willUnmount = function(_) --[[ Line: 355 ]] --[[ Name: willUnmount ]]

end;
v20.didUpdate = function(v116) --[[ Line: 358 ]] --[[ Name: didUpdate ]]
    local l_Size_0 = v116.utilRef.current.Size;
    if l_Size_0.Y.Offset ~= v116.state.utilTabHeight then
        v116:setState({
            utilTabHeight = l_Size_0.Y.Offset
        });
    end;
end;
v20.render = function(v118) --[[ Line: 367 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v18 (copy), l_MainRowPadding_0 (copy), v11 (copy), v12 (copy), v13 (copy)
    local l_size_0 = v118.props.size;
    local l_formFactor_0 = v118.props.formFactor;
    local l_tabList_0 = v118.props.tabList;
    local l_utilTabHeight_0 = v118.state.utilTabHeight;
    local v123, v124 = v118:getActiveState();
    return v6.createElement("Frame", {
        Size = l_size_0, 
        BackgroundColor3 = v18.Color.BaseGray, 
        BackgroundTransparency = 1, 
        LayoutOrder = 3
    }, {
        UIListLayout = v6.createElement("UIListLayout", {
            Padding = UDim.new(0, l_MainRowPadding_0), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        UtilAndTab = v6.createElement(v11, {
            windowWidth = l_size_0.X.Offset, 
            formFactor = l_formFactor_0, 
            tabList = l_tabList_0, 
            layoutOrder = 1, 
            isClientView = v123, 
            onClientButton = v118.onClientButton, 
            onServerButton = v118.onServerButton, 
            refForParent = v118.utilRef, 
            onHeightChanged = v118.onUtilTabHeightChanged, 
            onSearchTermChanged = v118.onSearchTermChanged
        }, {
            v6.createElement(v12, {
                text = "Create Snapshot", 
                onClicked = v118.onCreateSnapshot
            }), 
            v6.createElement(v12, {
                text = "Clear Snapshots", 
                onClicked = v118.onClearSnapshots
            })
        }), 
        LuauHeapView = v6.createElement(v13, {
            size = UDim2.new(1, 0, 1, -l_utilTabHeight_0), 
            layoutOrder = 2, 
            data = v118.filterSnapshots(v124.snapshots, v118.state.searchTerm, v118.version), 
            activeSnapshot = v124.active, 
            compareSnapshot = v124.compare
        })
    });
end;
return v7.UNSTABLE_connect2(function(v125, _) --[[ Line: 423 ]] --[[ Name: mapStateToProps ]]
    return {
        isClientView = v125.LuauHeap.isClientView, 
        client = v125.LuauHeap.client, 
        server = v125.LuauHeap.server
    };
end, function(v127) --[[ Line: 432 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v16 (copy), v17 (copy)
    return {
        dispatchSetLuauHeapState = function(v128, v129) --[[ Line: 434 ]] --[[ Name: dispatchSetLuauHeapState ]]
            -- upvalues: v127 (copy), v16 (ref)
            v127(v16(v128, v129));
        end, 
        dispatchSetLuauHeapProfileTarget = function(v130) --[[ Line: 437 ]] --[[ Name: dispatchSetLuauHeapProfileTarget ]]
            -- upvalues: v127 (copy), v17 (ref)
            v127(v17(v130));
        end
    };
end)(v10(v20, "LuauHeapData"));