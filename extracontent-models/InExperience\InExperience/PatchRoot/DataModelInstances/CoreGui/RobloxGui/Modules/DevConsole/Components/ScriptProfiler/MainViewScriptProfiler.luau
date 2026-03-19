local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local l_ScriptProfilerService_0 = game:GetService("ScriptProfilerService");
local l_Players_0 = game:GetService("Players");
local v5 = require(script.Parent.Parent.Parent.Immutable);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v7 = require(l_Components_0.UtilAndTab);
local v8 = require(l_Components_0.BoxButton);
local v9 = require(l_Components_0.DropDown);
local v10 = require(script.Parent.ProfilerView);
local v11 = require(script.Parent.ProfilerFunctionsView);
local _ = require(script.Parent.ProfilerDataFormatV2);
local v13 = require(script.Parent.ProfilerExportView);
local v14 = require(script.Parent.MobileSettingsView);
local v15 = require(script.Parent.ProfilerUtil);
local l_getPluginFlag_0 = v15.getPluginFlag;
local l_getDurations_0 = v15.getDurations;
local l_formatFrequency_0 = v15.formatFrequency;
local l_Actions_0 = script.Parent.Parent.Parent.Actions;
local v20 = require(l_Actions_0.SetScriptProfilerState);
local v21 = require(script.Parent.Actions.SetIsProfiling);
local v22 = require(script.Parent.Actions.SetData);
local v23 = require(script.Parent.Actions.SetThreads);
local v24 = require(script.Parent.Actions.SetTimerState);
local v25 = require(script.Parent.Actions.ClearStateForNewProfilingSession);
local v26 = require(script.Parent.Actions.SetAverage);
local v27 = require(script.Parent.Actions.SetFrequency);
local v28 = require(script.Parent.Actions.SetDataView);
local v29 = require(script.Parent.Actions.SetLiveUpdate);
local v30 = require(script.Parent.Actions.SetShowPlugins);
local v31 = require(script.Parent.Actions.SetShowGC);
local v32 = require(script.Parent.Actions.SetSearchData);
local v33 = require(script.Parent.Parent.Parent.Constants);
local l_MainRowPadding_0 = v33.GeneralFormatting.MainRowPadding;
local l_SmallFrameHeight_0 = v33.UtilityBarFormatting.SmallFrameHeight;
local l_MainWindowHeader_0 = v33.Font.MainWindowHeader;
local l_MainWindowHeader_1 = v33.DefaultFontSize.MainWindowHeader;
local l_Text_0 = v33.Color.Text;
local l_UnselectedGray_0 = v33.Color.UnselectedGray;
local v40 = v1.PureComponent:extend("MainViewScriptProfiler");
local v41 = game:DefineFastFlag("ScriptProfilerShowPlugins2", false);
local v42 = game:DefineFastInt("ScriptProfilerLiveUpdateIntervalMS", 1000);
local v43 = {
    "Callgraph", 
    "Functions"
};
local function v44(v45, v46, v47, v48, v49, v50) --[[ Line: 64 ]] --[[ Name: annotateSearchFilterNodes ]]
    -- upvalues: v44 (copy)
    local v51 = v45.Nodes[v49];
    if not v51.Children then
        v47[v49] = v48 > 0 and v46[v48] or v50;
        local v52 = false;
        if v48 > 0 then
            v52 = v46[v48];
        end;
        return v52;
    else
        local l_Children_0 = v51.Children;
        local v54 = false;
        if v48 > 0 and v46[v48] then
            v54 = true;
            v47[v49] = true;
            for v55, v56 in pairs(l_Children_0) do
                v47[v56] = true;
                v44(v45, v46, v47, v55, v56, true);
            end;
            return v54;
        else
            for v57, v58 in pairs(l_Children_0) do
                local v59 = v44(v45, v46, v47, v57, v58, v50);
                v54 = v54 or v59;
            end;
            if v54 or v50 then
                v47[v49] = true;
            end;
            return v54;
        end;
    end;
end;
local function v73(v60, v61) --[[ Line: 109 ]] --[[ Name: generateSearchFilters ]]
    -- upvalues: v15 (copy), v44 (copy)
    if v61 == "" then
        return nil, nil;
    else
        local l_data_0 = v60.data;
        if not l_data_0 then
            return nil, nil;
        else
            local v63 = table.create(#l_data_0.Functions, false);
            for v64, v65 in l_data_0.Functions do
                local v66 = v15.getName(l_data_0, v65);
                if v66 and string.find(v66, v61, 1, true) then
                    v63[v64] = true;
                end;
            end;
            local v67 = table.create(#l_data_0.Nodes, false);
            for _, v69 in l_data_0.Categories do
                v44(l_data_0, v63, v67, 0, v69.NodeId, false);
            end;
            for v70, v71 in l_data_0.Functions do
                if v63[v70] ~= true and not v15.getName(l_data_0, v71) then
                    local v72 = v15.getSourceName(l_data_0, v71);
                    if v72 and string.find(v72, v61, 1, true) then
                        v63[v70] = true;
                    end;
                end;
            end;
            return v63, v67;
        end;
    end;
end;
local function v89(v74, v75) --[[ Line: 153 ]] --[[ Name: generatePluginDurationOffsets ]]
    -- upvalues: l_getPluginFlag_0 (copy), l_getDurations_0 (copy)
    if v75 then
        assert(v75.Version == 2);
        local v76 = table.create(#v75.Categories, 0);
        local v77 = table.create(#v75.Categories, 0);
        local v78 = 0;
        local v79 = 0;
        for v80, v81 in v75.Categories do
            local v82 = v75.Nodes[v81.NodeId];
            local v83 = 0;
            local v84 = 0;
            local l_Children_1 = v82.Children;
            if l_Children_1 then
                for v86, v87 in pairs(l_Children_1) do
                    local _ = v75.Functions[v86];
                    if l_getPluginFlag_0(v75, v75.Functions[v86]) then
                        v83 = v83 + l_getDurations_0(v75, v87);
                        if #v74 > 0 then
                            v84 = v84 + v74[v87];
                        end;
                    end;
                end;
            end;
            v76[v80] = v83;
            v77[v80] = v84;
            v78 = v78 + v83;
            v79 = v79 + v84;
        end;
        v76.Total = v78;
        v77.Total = v78;
        return v76, v77;
    else
        return {}, {};
    end;
end;
local function v90(v91, v92, v93, v94, v95) --[[ Line: 203 ]] --[[ Name: getGCOverhead ]]
    -- upvalues: v90 (copy)
    local v96 = v93.Nodes[v94];
    local v97 = 0;
    if v96.Children then
        for v98, v99 in pairs(v96.Children) do
            local v100 = nil;
            v100 = if v98 == v95 then v93.Nodes[v99].TotalDuration else v90(v91, v92, v93, v99, v95);
            v91[v98] = v91[v98] + v100;
            v92[v99] = v100;
            v97 = v97 + v100;
        end;
    end;
    return v97;
end;
local function v110(v101) --[[ Line: 231 ]] --[[ Name: generateGCOverheadOffsets ]]
    -- upvalues: v90 (copy)
    if v101 and v101.GCFuncId then
        local l_GCFuncId_0 = v101.GCFuncId;
        local v103 = table.create(#v101.Functions, 0);
        local v104 = table.create(#v101.Nodes, 0);
        local v105 = 0;
        for _, v107 in v101.Categories do
            local l_NodeId_0 = v107.NodeId;
            local v109 = v90(v103, v104, v101, l_NodeId_0, l_GCFuncId_0);
            v105 = v105 + v109;
            v104[l_NodeId_0] = v109;
        end;
        v104.Total = v105;
        return v103, v104;
    else
        return {}, {};
    end;
end;
v40.getActiveState = function(v111) --[[ Line: 259 ]] --[[ Name: getActiveState ]]
    local l_isClientView_0 = v111.props.isClientView;
    if v111.props.isClientView then
        return l_isClientView_0, v111.props.client;
    else
        return l_isClientView_0, v111.props.server;
    end;
end;
v40.getState = function(v113, v114) --[[ Line: 263 ]] --[[ Name: getState ]]
    if v114 then
        return v113.props.client;
    else
        return v113.props.server;
    end;
end;
v40.UpdateState = function(v115, v116, v117) --[[ Line: 267 ]] --[[ Name: UpdateState ]]
    if v116 then
        v115.props.dispatchSetScriptProfilerState(nil, nil, v117, nil);
        return;
    else
        v115.props.dispatchSetScriptProfilerState(nil, nil, nil, v117);
        return;
    end;
end;
local function v125(v118, v119, v120) --[[ Line: 275 ]] --[[ Name: OnNewProfilingData ]]
    -- upvalues: l_ScriptProfilerService_0 (copy), v110 (copy), v41 (copy), v89 (copy)
    v118.serializedData = v120;
    v118.data = l_ScriptProfilerService_0:DeserializeJSON(v120);
    local v121, v122 = v110(v118.data);
    v118.gcFunctionOffsets = v121;
    v118.gcNodeOffsets = v122;
    if v41 then
        v121, v122 = v89(v118.gcNodeOffsets, v118.data);
        v118.pluginOffsets = v121;
        v118.pluginGCOffsets = v122;
    end;
    v121 = if v118.data then #v118.data.Nodes else 0;
    v122 = if v119.data then #v119.data.Nodes else 0;
    local v123 = table.create(v121, false);
    local l_expandedNodes_0 = v119.expandedNodes;
    table.move(l_expandedNodes_0, 1, v122, 1, v123);
    v118.expandedNodes = v123;
end;
v40.init = function(v126) --[[ Line: 293 ]] --[[ Name: init ]]
    -- upvalues: l_ScriptProfilerService_0 (copy), l_Players_0 (copy), v42 (copy), v73 (copy), v1 (copy)
    local function _(v127, v128) --[[ Line: 294 ]] --[[ Name: StartScriptProfiling ]]
        -- upvalues: l_ScriptProfilerService_0 (ref), l_Players_0 (ref)
        if v127 then
            l_ScriptProfilerService_0:ClientStart(l_Players_0.LocalPlayer, v128.frequency);
            return;
        else
            l_ScriptProfilerService_0:ServerStart(v128.frequency);
            return;
        end;
    end;
    local function _(v130) --[[ Line: 302 ]] --[[ Name: StopScriptProfiling ]]
        -- upvalues: l_ScriptProfilerService_0 (ref), l_Players_0 (ref)
        if v130 then
            l_ScriptProfilerService_0:ClientStop(l_Players_0.LocalPlayer);
        else
            l_ScriptProfilerService_0:ServerStop();
        end;
        return nil;
    end;
    local function _(v132) --[[ Line: 311 ]] --[[ Name: RequestNewData ]]
        -- upvalues: l_ScriptProfilerService_0 (ref), l_Players_0 (ref)
        if v132 then
            l_ScriptProfilerService_0:ClientRequestData(l_Players_0.LocalPlayer);
            return;
        else
            l_ScriptProfilerService_0:ServerRequestData();
            return;
        end;
    end;
    local _ = function(v134) --[[ Line: 319 ]] --[[ Name: StopTimedProfiling ]]
        -- upvalues: v126 (copy), l_ScriptProfilerService_0 (ref), l_Players_0 (ref)
        if v126:getState(v134).isProfiling then
            if v134 then
                l_ScriptProfilerService_0:ClientStop(l_Players_0.LocalPlayer);
            else
                l_ScriptProfilerService_0:ServerStop();
            end;
            local _ = nil;
            v126.props.dispatchSetIsProfiling(v134, false);
            if v134 then
                l_ScriptProfilerService_0:ClientRequestData(l_Players_0.LocalPlayer);
                return;
            else
                l_ScriptProfilerService_0:ServerRequestData();
            end;
        end;
    end;
    v126.onUtilTabHeightChanged = function(v137) --[[ Line: 331 ]]
        -- upvalues: v126 (copy)
        v126:setState({
            utilTabHeight = v137
        });
    end;
    local function v140(v138) --[[ Line: 337 ]] --[[ Name: UpdateTimedProfilingTimer ]]
        -- upvalues: v126 (copy)
        while task.wait(0.5) do
            local l_timedProfilingCountdown_0 = v126:getState(v138).timedProfilingCountdown;
            if l_timedProfilingCountdown_0 > 0 then
                v126.props.dispatchSetTimer(v138, {
                    timedProfilingCountdown = l_timedProfilingCountdown_0 - 0.5
                });
            else
                break;
            end;
        end;
    end;
    local function v142(v141) --[[ Line: 352 ]] --[[ Name: LiveUpdate ]]
        -- upvalues: v42 (ref), v126 (copy), l_ScriptProfilerService_0 (ref), l_Players_0 (ref)
        while task.wait(v42 / 1000) do
            if v126:getState(v141).liveUpdate then
                if v141 then
                    l_ScriptProfilerService_0:ClientRequestData(l_Players_0.LocalPlayer);
                else
                    l_ScriptProfilerService_0:ServerRequestData();
                end;
            end;
        end;
    end;
    v126.onBeginProfile = function() --[[ Line: 362 ]]
        -- upvalues: v126 (copy), l_ScriptProfilerService_0 (ref), l_Players_0 (ref), v140 (copy), v142 (copy)
        local v143, v144 = v126:getActiveState();
        if v143 then
            l_ScriptProfilerService_0:ClientStart(l_Players_0.LocalPlayer, v144.frequency);
        else
            l_ScriptProfilerService_0:ServerStart(v144.frequency);
        end;
        v126.props.dispatchSetIsProfiling(v143, true);
        v126.props.dispatchClearStateForNewSession(v143);
        local v145 = {};
        if v144.timedProfilingDuration > 0 then
            v126.props.dispatchSetTimer(v143, {
                timedProfilingCountdown = v144.timedProfilingDuration
            });
            v145.timedProfilingThread = task.delay(v144.timedProfilingDuration, function() --[[ Line: 375 ]]
                -- upvalues: v143 (copy), v126 (ref), l_ScriptProfilerService_0 (ref), l_Players_0 (ref)
                local l_v143_0 = v143;
                if v126:getState(l_v143_0).isProfiling then
                    if l_v143_0 then
                        l_ScriptProfilerService_0:ClientStop(l_Players_0.LocalPlayer);
                    else
                        l_ScriptProfilerService_0:ServerStop();
                    end;
                    local _ = nil;
                    v126.props.dispatchSetIsProfiling(l_v143_0, false);
                    if l_v143_0 then
                        l_ScriptProfilerService_0:ClientRequestData(l_Players_0.LocalPlayer);
                        return;
                    else
                        l_ScriptProfilerService_0:ServerRequestData();
                    end;
                end;
            end);
            v145.timedProfilingTimerThread = task.spawn(function() --[[ Line: 379 ]]
                -- upvalues: v140 (ref), v143 (copy)
                v140(v143);
            end);
        end;
        v145.liveUpdateThread = task.spawn(v142, v143);
        v126.props.dispatchSetThreads(v143, v145);
    end;
    v126.onEndProfile = function() --[[ Line: 389 ]]
        -- upvalues: v126 (copy), l_ScriptProfilerService_0 (ref), l_Players_0 (ref)
        local v148, v149 = v126:getActiveState();
        if v148 then
            l_ScriptProfilerService_0:ClientStop(l_Players_0.LocalPlayer);
        else
            l_ScriptProfilerService_0:ServerStop();
        end;
        local _ = nil;
        local v151 = {};
        if v149.timedProfilingThread then
            task.cancel(v149.timedProfilingThread);
            v151.timedProfilingThread = nil;
        end;
        if v149.timedProfilingTimerThread then
            task.cancel(v149.timedProfilingTimerThread);
            v151.timedProfilingTimerThread = nil;
        end;
        if v149.liveUpdateThread then
            task.cancel(v149.liveUpdateThread);
            v151.liveUpdateThread = nil;
        end;
        v126.props.dispatchSetThreads(v148, {});
        v126.props.dispatchSetIsProfiling(v148, false);
        if v148 then
            l_ScriptProfilerService_0:ClientRequestData(l_Players_0.LocalPlayer);
            return;
        else
            l_ScriptProfilerService_0:ServerRequestData();
            return;
        end;
    end;
    v126.toggleTimedProfiling = function() --[[ Line: 417 ]]
        -- upvalues: v126 (copy)
        local v152, v153 = v126:getActiveState();
        local l_timedProfilingDuration_0 = v153.timedProfilingDuration;
        l_timedProfilingDuration_0 = l_timedProfilingDuration_0 == 0 and 60 or l_timedProfilingDuration_0 == 60 and 300 or l_timedProfilingDuration_0 == 300 and 600 or 0;
        v126.props.dispatchSetTimer(v152, {
            timedProfilingDuration = l_timedProfilingDuration_0
        });
    end;
    v126.toggleAverage = function() --[[ Line: 435 ]]
        -- upvalues: v126 (copy)
        local v155, v156 = v126:getActiveState();
        local l_average_0 = v156.average;
        l_average_0 = l_average_0 == 0 and 1 or l_average_0 == 1 and 60 or l_average_0 == 60 and 300 or l_average_0 == 300 and 600 or 0;
        v126.props.dispatchSetAverage(v155, l_average_0);
    end;
    v126.toggleUnits = function() --[[ Line: 455 ]]
        -- upvalues: v126 (copy)
        v126.props.dispatchSetScriptProfilerState(nil, not v126.props.usePercentages, nil, nil);
    end;
    v126.toggleFrequency = function() --[[ Line: 459 ]]
        -- upvalues: v126 (copy)
        local v158, v159 = v126:getActiveState();
        local v160 = v159.frequency == 1000 and 10000 or 1000;
        v126.props.dispatchSetFrequency(v158, v160);
    end;
    v126.onClientButton = function() --[[ Line: 473 ]]
        -- upvalues: v126 (copy)
        v126.props.dispatchSetScriptProfilerState(true);
    end;
    v126.onServerButton = function() --[[ Line: 477 ]]
        -- upvalues: v126 (copy)
        v126.props.dispatchSetScriptProfilerState(false);
    end;
    v126.dataViewDropDownCallback = function(v161) --[[ Line: 481 ]]
        -- upvalues: v126 (copy)
        local v162, v163 = v126:getActiveState();
        local l_isFunctionsView_0 = v163.isFunctionsView;
        if v161 == 1 then
            l_isFunctionsView_0 = false;
        elseif v161 == 2 then
            l_isFunctionsView_0 = true;
        end;
        v126.props.dispatchSetDataView(v162, l_isFunctionsView_0);
    end;
    v126.onCheckboxChanged = function(v165, v166) --[[ Line: 495 ]]
        -- upvalues: v126 (copy)
        local l_isClientView_1 = v126.props.isClientView;
        if v165 == "Live" then
            v126.props.dispatchSetLiveUpdate(l_isClientView_1, v166);
            return;
        elseif v165 == "Plugins" then
            v126.props.dispatchSetShowPlugins(l_isClientView_1, v166);
            return;
        else
            if v165 == "GC" then
                v126.props.dispatchSetShowGC(l_isClientView_1, v166);
            end;
            return;
        end;
    end;
    v126.onSearchTermChanged = function(v168) --[[ Line: 507 ]]
        -- upvalues: v126 (copy), v73 (ref)
        local v169, v170 = v126:getActiveState();
        local v171, v172 = v73(v170, v168);
        v126.props.dispatchSetSearchData(v169, {
            searchTerm = v168, 
            searchFilterFlat = v171 or {}, 
            searchFilterGraph = v172 or {}
        });
    end;
    v126.utilRef = v1.createRef();
    v126.state = {
        utilTabHeight = 0
    };
end;
v40.didMount = function(v173) --[[ Line: 525 ]] --[[ Name: didMount ]]
    -- upvalues: l_ScriptProfilerService_0 (copy), v125 (copy)
    v173:setState({
        utilTabHeight = v173.utilRef.current.Size.Y.Offset
    });
    v173.scriptProfilerConnection = l_ScriptProfilerService_0.OnNewData:Connect(function(v174, v175) --[[ Line: 531 ]]
        -- upvalues: v173 (copy), v125 (ref)
        local v176 = v174 ~= nil;
        local v177 = v173:getState(v176);
        local v178 = {};
        v125(v178, v177, v175);
        v173.props.dispatchSetData(v176, v178);
    end);
end;
v40.willUnmount = function(v179) --[[ Line: 543 ]] --[[ Name: willUnmount ]]
    v179.scriptProfilerConnection:Disconnect();
    v179.scriptProfilerConnection = nil;
end;
v40.didUpdate = function(v180) --[[ Line: 548 ]] --[[ Name: didUpdate ]]
    local l_Size_0 = v180.utilRef.current.Size;
    if l_Size_0.Y.Offset ~= v180.state.utilTabHeight then
        v180:setState({
            utilTabHeight = l_Size_0.Y.Offset
        });
    end;
end;
local function _(v182) --[[ Line: 557 ]] --[[ Name: formatTimer ]]
    -- upvalues: v15 (copy)
    local v183 = v15.formatTimer(v182);
    if v183 ~= "" then
        return ": " .. v183;
    else
        return v183;
    end;
end;
v40.renderUtilButtons = function(v185, v186, v187, v188) --[[ Line: 567 ]] --[[ Name: renderUtilButtons ]]
    -- upvalues: v1 (copy), v8 (copy), l_formatFrequency_0 (copy), l_MainWindowHeader_1 (copy), l_Text_0 (copy), l_MainWindowHeader_0 (copy), v33 (copy), l_UnselectedGray_0 (copy), v15 (copy), v9 (copy), l_SmallFrameHeight_0 (copy), v43 (copy)
    local l_isProfiling_0 = v186.isProfiling;
    local v190 = {};
    table.insert(v190, v1.createElement(v8, {
        text = l_isProfiling_0 and "Stop" or "Start", 
        onClicked = l_isProfiling_0 and v185.onEndProfile or v185.onBeginProfile
    }));
    if not v188 then
        table.insert(v190, v1.createElement(v8, {
            text = v185.props.usePercentages and "Unit: %" or "Unit: ms", 
            onClicked = v185.toggleUnits
        }));
    end;
    if not v188 then
        table.insert(v190, v1.createElement("TextButton", {
            Text = "Freq: " .. l_formatFrequency_0(v186.frequency), 
            TextSize = l_MainWindowHeader_1, 
            TextColor3 = l_Text_0, 
            Font = l_MainWindowHeader_0, 
            AutoButtonColor = true, 
            BackgroundColor3 = if l_isProfiling_0 then v33.Color.InactiveBox else l_UnselectedGray_0, 
            BackgroundTransparency = 0, 
            [v1.Event.Activated] = function() --[[ Line: 608 ]]
                -- upvalues: l_isProfiling_0 (copy), v185 (copy)
                if not l_isProfiling_0 then
                    v185.toggleFrequency();
                end;
            end
        }));
    end;
    if not v188 then
        local l_v190_0 = v190;
        local l_createElement_0 = v1.createElement;
        local v193 = "TextButton";
        local v194 = {};
        local v195 = "Time";
        local v196 = if l_isProfiling_0 then v186.timedProfilingCountdown else v186.timedProfilingDuration;
        local v197 = v15.formatTimer(v196);
        v194.Text = v195 .. if v197 ~= "" then ": " .. v197 else v197;
        v194.TextSize = l_MainWindowHeader_1;
        v194.TextColor3 = l_Text_0;
        v194.Font = l_MainWindowHeader_0;
        v194.AutoButtonColor = true;
        v194.BackgroundColor3 = if l_isProfiling_0 then v33.Color.InactiveBox else l_UnselectedGray_0;
        v194.BackgroundTransparency = 0;
        v194[v1.Event.Activated] = function() --[[ Line: 631 ]]
            -- upvalues: l_isProfiling_0 (copy), v185 (copy)
            if not l_isProfiling_0 then
                v185.toggleTimedProfiling();
            end;
        end;
        table.insert(l_v190_0, l_createElement_0(v193, v194));
    end;
    if not v188 then
        local l_v190_1 = v190;
        local l_createElement_1 = v1.createElement;
        local v200 = "TextButton";
        local v201 = {};
        local v202 = "Average";
        local l_average_1 = v186.average;
        local v204 = v15.formatTimer(l_average_1);
        v201.Text = v202 .. if v204 ~= "" then ": " .. v204 else v204;
        v201.TextSize = l_MainWindowHeader_1;
        v201.TextColor3 = l_Text_0;
        v201.Font = l_MainWindowHeader_0;
        v201.AutoButtonColor = true;
        v201.BackgroundColor3 = if l_isProfiling_0 then v33.Color.InactiveBox else l_UnselectedGray_0;
        v201.BackgroundTransparency = 0;
        v201[v1.Event.Activated] = function() --[[ Line: 653 ]]
            -- upvalues: l_isProfiling_0 (copy), v185 (copy)
            if not l_isProfiling_0 then
                v185.toggleAverage();
            end;
        end;
        table.insert(l_v190_1, l_createElement_1(v200, v201));
    end;
    if not v188 then
        table.insert(v190, v1.createElement(v8, {
            text = "Export", 
            onClicked = v185.props.dispatchStartExport
        }));
    end;
    if not v188 then
        table.insert(v190, v1.createElement(v9, {
            buttonSize = UDim2.new(0, 100, 0, l_SmallFrameHeight_0), 
            dropDownList = v43, 
            selectedIndex = v186.isFunctionsView and 2 or 1, 
            onSelection = v185.dataViewDropDownCallback
        }));
    end;
    if v187 then
        table.insert(v190, v1.createElement(v8, {
            text = "More...", 
            onClicked = function() --[[ Line: 689 ]] --[[ Name: onClicked ]]
                -- upvalues: v185 (copy)
                v185.props.dispatchShowMobileSettings();
            end
        }));
    end;
    return v190;
end;
v40.renderUtilAndTab = function(v205, v206, v207) --[[ Line: 699 ]] --[[ Name: renderUtilAndTab ]]
    -- upvalues: v1 (copy), v7 (copy), v5 (copy)
    local l_size_0 = v205.props.size;
    local l_formFactor_0 = v205.props.formFactor;
    local l_tabList_0 = v205.props.tabList;
    return v1.createElement(v7, v5.JoinDictionaries({
        windowWidth = l_size_0.X.Offset, 
        formFactor = l_formFactor_0, 
        tabList = l_tabList_0, 
        layoutOrder = 1, 
        refForParent = v205.utilRef, 
        onHeightChanged = v205.onUtilTabHeightChanged
    }, v206), v207);
end;
v40.renderExportView = function(v211) --[[ Line: 719 ]] --[[ Name: renderExportView ]]
    -- upvalues: v1 (copy), v33 (copy), l_MainRowPadding_0 (copy), v8 (copy), v13 (copy)
    local l_size_1 = v211.props.size;
    local l_utilTabHeight_0 = v211.state.utilTabHeight;
    return v1.createElement("Frame", {
        Size = l_size_1, 
        BackgroundColor3 = v33.Color.BaseGray, 
        BackgroundTransparency = 1, 
        LayoutOrder = 3
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            Padding = UDim.new(0, l_MainRowPadding_0), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        UtilAndTab = v211:renderUtilAndTab({}, {
            v1.createElement(v8, {
                text = "Exit", 
                onClicked = v211.props.dispatchFinishedExporting
            })
        }), 
        ExportView = v1.createElement(v13, {
            size = UDim2.new(1, 0, 1, -l_utilTabHeight_0)
        })
    });
end;
v40.renderMobileSettingsUI = function(v214) --[[ Line: 748 ]] --[[ Name: renderMobileSettingsUI ]]
    -- upvalues: v1 (copy), v33 (copy), l_MainRowPadding_0 (copy), v8 (copy), v14 (copy)
    local l_size_2 = v214.props.size;
    local l_utilTabHeight_1 = v214.state.utilTabHeight;
    return v1.createElement("Frame", {
        Size = l_size_2, 
        BackgroundColor3 = v33.Color.BaseGray, 
        BackgroundTransparency = 1, 
        LayoutOrder = 3
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            Padding = UDim.new(0, l_MainRowPadding_0), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        UtilAndTab = v214:renderUtilAndTab({}, {
            v1.createElement(v8, {
                text = "Export", 
                onClicked = v214.props.dispatchStartExport
            }), 
            v1.createElement(v8, {
                text = "Exit", 
                onClicked = v214.props.dispatchHideMobileSettings
            })
        }), 
        MobileSettingsView = v1.createElement(v14, {
            size = UDim2.new(1, 0, 1, -l_utilTabHeight_1)
        })
    });
end;
v40.renderProfilerView = function(v217, v218, v219, v220, v221) --[[ Line: 783 ]] --[[ Name: renderProfilerView ]]
    -- upvalues: v1 (copy), v33 (copy), l_MainRowPadding_0 (copy), v11 (copy), v10 (copy), v41 (copy)
    local l_isProfiling_1 = v219.isProfiling;
    local l_data_1 = v219.data;
    local l_usePercentages_0 = v217.props.usePercentages;
    local l_isFunctionsView_1 = v219.isFunctionsView;
    local l_rootNode_0 = v219.rootNode;
    local l_rootNodeName_0 = v219.rootNodeName;
    local l_rootFunc_0 = v219.rootFunc;
    local l_size_3 = v217.props.size;
    local l_utilTabHeight_2 = v217.state.utilTabHeight;
    local v231 = nil;
    if l_data_1 and l_data_1.SessionStartTime and l_data_1.SessionEndTime then
        v231 = l_data_1.SessionEndTime - l_data_1.SessionStartTime;
    end;
    return v1.createElement("Frame", {
        Size = l_size_3, 
        BackgroundColor3 = v33.Color.BaseGray, 
        BackgroundTransparency = 1, 
        LayoutOrder = 3
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            Padding = UDim.new(0, l_MainRowPadding_0), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        UtilAndTab = v217:renderUtilAndTab({
            isClientView = v218, 
            onClientButton = v217.onClientButton, 
            onServerButton = v217.onServerButton, 
            orderedCheckboxState = v221, 
            onCheckboxChanged = v217.onCheckboxChanged, 
            onSearchTermChanged = v217.onSearchTermChanged, 
            searchTerm = v219.searchTerm
        }, v220), 
        ProfilerView = v1.createElement(if l_isFunctionsView_1 then v11 else v10, {
            size = UDim2.new(1, 0, 1, -l_utilTabHeight_2), 
            searchFilter = if l_isFunctionsView_1 then v219.searchFilterFlat else v219.searchFilterGraph, 
            layoutOrder = 2, 
            data = l_data_1, 
            profiling = l_isProfiling_1, 
            showAsPercentages = l_usePercentages_0, 
            sessionLength = v231, 
            rootNode = l_rootNode_0, 
            rootFunc = l_rootFunc_0, 
            rootNodeName = l_rootNodeName_0, 
            average = v219.average, 
            showPlugins = v219.showPlugins or not v41, 
            pluginOffsets = v219.pluginOffsets, 
            showGC = v219.showGC, 
            gcFunctionOffsets = v219.gcFunctionOffsets, 
            gcNodeOffsets = v219.gcNodeOffsets, 
            pluginGCOffsets = v219.pluginGCOffsets, 
            expandedNodes = if l_isFunctionsView_1 then nil else v219.expandedNodes
        })
    });
end;
v40.render = function(v232) --[[ Line: 847 ]] --[[ Name: render ]]
    -- upvalues: v33 (copy), v41 (copy)
    if v232.props.isExporting then
        return v232:renderExportView();
    elseif v232.props.isShowingMobileSettings then
        return v232:renderMobileSettingsUI();
    else
        local l_formFactor_1 = v232.props.formFactor;
        local v234, v235 = v232:getActiveState();
        local v236 = {};
        local v237 = 1;
        local v238 = l_formFactor_1 == v33.FormFactor.Small;
        if not v238 then
            v236[1] = {
                name = "Live", 
                state = v235.liveUpdate
            };
            if v41 then
                v237 = v237 + 1;
                v236[v237] = {
                    name = "Plugins", 
                    state = v235.showPlugins
                };
            end;
            v236[v237 + 1] = {
                name = "GC", 
                state = v235.showGC
            };
        end;
        return v232:renderProfilerView(v234, v235, v232:renderUtilButtons(v235, v238, v238), v236);
    end;
end;
return v2.UNSTABLE_connect2(function(v239, _) --[[ Line: 882 ]] --[[ Name: mapStateToProps ]]
    return {
        isClientView = v239.ScriptProfiler.isClientView, 
        usePercentages = v239.ScriptProfiler.usePercentages, 
        isExporting = v239.ScriptProfiler.isExporting, 
        isShowingMobileSettings = v239.ScriptProfiler.isShowingMobileSettings, 
        client = v239.ScriptProfiler.client, 
        server = v239.ScriptProfiler.server
    };
end, function(v241) --[[ Line: 894 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v20 (copy), v21 (copy), v22 (copy), v23 (copy), v24 (copy), v25 (copy), v26 (copy), v27 (copy), v28 (copy), v29 (copy), v30 (copy), v31 (copy), v32 (copy)
    return {
        dispatchSetScriptProfilerState = function(v242, v243, v244, v245) --[[ Line: 896 ]] --[[ Name: dispatchSetScriptProfilerState ]]
            -- upvalues: v241 (copy), v20 (ref)
            v241(v20(v242, v243, v244, v245));
        end, 
        dispatchSetIsProfiling = function(v246, v247) --[[ Line: 900 ]] --[[ Name: dispatchSetIsProfiling ]]
            -- upvalues: v241 (copy), v21 (ref)
            v241(v21(v246, v247));
        end, 
        dispatchSetData = function(v248, v249) --[[ Line: 904 ]] --[[ Name: dispatchSetData ]]
            -- upvalues: v241 (copy), v22 (ref)
            v241(v22(v248, v249));
        end, 
        dispatchSetThreads = function(v250, v251) --[[ Line: 908 ]] --[[ Name: dispatchSetThreads ]]
            -- upvalues: v241 (copy), v23 (ref)
            v241(v23(v250, v251));
        end, 
        dispatchSetTimer = function(v252, v253) --[[ Line: 912 ]] --[[ Name: dispatchSetTimer ]]
            -- upvalues: v241 (copy), v24 (ref)
            v241(v24(v252, v253));
        end, 
        dispatchClearStateForNewSession = function(v254) --[[ Line: 916 ]] --[[ Name: dispatchClearStateForNewSession ]]
            -- upvalues: v241 (copy), v25 (ref)
            v241(v25(v254));
        end, 
        dispatchSetAverage = function(v255, v256) --[[ Line: 920 ]] --[[ Name: dispatchSetAverage ]]
            -- upvalues: v241 (copy), v26 (ref)
            v241(v26(v255, v256));
        end, 
        dispatchSetFrequency = function(v257, v258) --[[ Line: 924 ]] --[[ Name: dispatchSetFrequency ]]
            -- upvalues: v241 (copy), v27 (ref)
            v241(v27(v257, v258));
        end, 
        dispatchSetDataView = function(v259, v260) --[[ Line: 928 ]] --[[ Name: dispatchSetDataView ]]
            -- upvalues: v241 (copy), v28 (ref)
            v241(v28(v259, v260));
        end, 
        dispatchSetLiveUpdate = function(v261, v262) --[[ Line: 932 ]] --[[ Name: dispatchSetLiveUpdate ]]
            -- upvalues: v241 (copy), v29 (ref)
            v241(v29(v261, v262));
        end, 
        dispatchSetShowPlugins = function(v263, v264) --[[ Line: 936 ]] --[[ Name: dispatchSetShowPlugins ]]
            -- upvalues: v241 (copy), v30 (ref)
            v241(v30(v263, v264));
        end, 
        dispatchSetShowGC = function(v265, v266) --[[ Line: 940 ]] --[[ Name: dispatchSetShowGC ]]
            -- upvalues: v241 (copy), v31 (ref)
            v241(v31(v265, v266));
        end, 
        dispatchSetSearchData = function(v267, v268) --[[ Line: 944 ]] --[[ Name: dispatchSetSearchData ]]
            -- upvalues: v241 (copy), v32 (ref)
            v241(v32(v267, v268));
        end, 
        dispatchStartExport = function() --[[ Line: 948 ]] --[[ Name: dispatchStartExport ]]
            -- upvalues: v241 (copy), v20 (ref)
            v241(v20(nil, nil, nil, nil, true));
        end, 
        dispatchFinishedExporting = function() --[[ Line: 952 ]] --[[ Name: dispatchFinishedExporting ]]
            -- upvalues: v241 (copy), v20 (ref)
            v241(v20(nil, nil, nil, nil, false));
        end, 
        dispatchShowMobileSettings = function() --[[ Line: 956 ]] --[[ Name: dispatchShowMobileSettings ]]
            -- upvalues: v241 (copy), v20 (ref)
            v241(v20(nil, nil, nil, nil, nil, true));
        end, 
        dispatchHideMobileSettings = function() --[[ Line: 960 ]] --[[ Name: dispatchHideMobileSettings ]]
            -- upvalues: v241 (copy), v20 (ref)
            v241(v20(nil, nil, nil, nil, nil, false));
        end
    };
end)(v40);