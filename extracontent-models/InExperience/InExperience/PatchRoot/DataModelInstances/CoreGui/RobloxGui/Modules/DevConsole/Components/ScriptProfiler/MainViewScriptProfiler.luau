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
local function v80(v60, v61) --[[ Line: 109 ]] --[[ Name: generateSearchFilters ]]
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
                local l_NodeId_0 = v69.NodeId;
                local v71 = l_data_0.Nodes[l_NodeId_0];
                if not v71.Children then
                    v67[l_NodeId_0] = false;
                else
                    local l_Children_1 = v71.Children;
                    local v73 = false;
                    for v74, v75 in pairs(l_Children_1) do
                        local v76 = v44(l_data_0, v63, v67, v74, v75, false);
                        v73 = v73 or v76;
                    end;
                    if v73 then
                        v67[l_NodeId_0] = true;
                    end;
                end;
            end;
            for v77, v78 in l_data_0.Functions do
                if v63[v77] ~= true and not v15.getName(l_data_0, v78) then
                    local v79 = v15.getSourceName(l_data_0, v78);
                    if v79 and string.find(v79, v61, 1, true) then
                        v63[v77] = true;
                    end;
                end;
            end;
            return v63, v67;
        end;
    end;
end;
local function v96(v81, v82) --[[ Line: 153 ]] --[[ Name: generatePluginDurationOffsets ]]
    -- upvalues: l_getPluginFlag_0 (copy), l_getDurations_0 (copy)
    if v82 then
        assert(v82.Version == 2);
        local v83 = table.create(#v82.Categories, 0);
        local v84 = table.create(#v82.Categories, 0);
        local v85 = 0;
        local v86 = 0;
        for v87, v88 in v82.Categories do
            local v89 = v82.Nodes[v88.NodeId];
            local v90 = 0;
            local v91 = 0;
            local l_Children_2 = v89.Children;
            if l_Children_2 then
                for v93, v94 in pairs(l_Children_2) do
                    local _ = v82.Functions[v93];
                    if l_getPluginFlag_0(v82, v82.Functions[v93]) then
                        v90 = v90 + l_getDurations_0(v82, v94);
                        if #v81 > 0 then
                            v91 = v91 + v81[v94];
                        end;
                    end;
                end;
            end;
            v83[v87] = v90;
            v84[v87] = v91;
            v85 = v85 + v90;
            v86 = v86 + v91;
        end;
        v83.Total = v85;
        v84.Total = v85;
        return v83, v84;
    else
        return {}, {};
    end;
end;
local function v97(v98, v99, v100, v101, v102) --[[ Line: 203 ]] --[[ Name: getGCOverhead ]]
    -- upvalues: v97 (copy)
    local v103 = v100.Nodes[v101];
    local v104 = 0;
    if v103.Children then
        for v105, v106 in pairs(v103.Children) do
            local v107 = nil;
            v107 = if v105 == v102 then v100.Nodes[v106].TotalDuration else v97(v98, v99, v100, v106, v102);
            v98[v105] = v98[v105] + v107;
            v99[v106] = v107;
            v104 = v104 + v107;
        end;
    end;
    return v104;
end;
local function v117(v108) --[[ Line: 231 ]] --[[ Name: generateGCOverheadOffsets ]]
    -- upvalues: v97 (copy)
    if v108 and v108.GCFuncId then
        local l_GCFuncId_0 = v108.GCFuncId;
        local v110 = table.create(#v108.Functions, 0);
        local v111 = table.create(#v108.Nodes, 0);
        local v112 = 0;
        for _, v114 in v108.Categories do
            local l_NodeId_1 = v114.NodeId;
            local v116 = v97(v110, v111, v108, l_NodeId_1, l_GCFuncId_0);
            v112 = v112 + v116;
            v111[l_NodeId_1] = v116;
        end;
        v111.Total = v112;
        return v110, v111;
    else
        return {}, {};
    end;
end;
v40.getActiveState = function(v118) --[[ Line: 259 ]] --[[ Name: getActiveState ]]
    local l_isClientView_0 = v118.props.isClientView;
    if v118.props.isClientView then
        return l_isClientView_0, v118.props.client;
    else
        return l_isClientView_0, v118.props.server;
    end;
end;
v40.getState = function(v120, v121) --[[ Line: 263 ]] --[[ Name: getState ]]
    if v121 then
        return v120.props.client;
    else
        return v120.props.server;
    end;
end;
v40.UpdateState = function(v122, v123, v124) --[[ Line: 267 ]] --[[ Name: UpdateState ]]
    if v123 then
        v122.props.dispatchSetScriptProfilerState(nil, nil, v124, nil);
        return;
    else
        v122.props.dispatchSetScriptProfilerState(nil, nil, nil, v124);
        return;
    end;
end;
local function v132(v125, v126, v127) --[[ Line: 275 ]] --[[ Name: OnNewProfilingData ]]
    -- upvalues: l_ScriptProfilerService_0 (copy), v117 (copy), v41 (copy), v96 (copy)
    v125.serializedData = v127;
    v125.data = l_ScriptProfilerService_0:DeserializeJSON(v127);
    local v128, v129 = v117(v125.data);
    v125.gcFunctionOffsets = v128;
    v125.gcNodeOffsets = v129;
    if v41 then
        v128, v129 = v96(v125.gcNodeOffsets, v125.data);
        v125.pluginOffsets = v128;
        v125.pluginGCOffsets = v129;
    end;
    v128 = if v125.data then #v125.data.Nodes else 0;
    v129 = if v126.data then #v126.data.Nodes else 0;
    local v130 = table.create(v128, false);
    local l_expandedNodes_0 = v126.expandedNodes;
    table.move(l_expandedNodes_0, 1, v129, 1, v130);
    v125.expandedNodes = v130;
end;
v40.init = function(v133) --[[ Line: 293 ]] --[[ Name: init ]]
    -- upvalues: l_ScriptProfilerService_0 (copy), l_Players_0 (copy), v42 (copy), v80 (copy), v1 (copy)
    local function _(v134, v135) --[[ Line: 294 ]] --[[ Name: StartScriptProfiling ]]
        -- upvalues: l_ScriptProfilerService_0 (ref), l_Players_0 (ref)
        if v134 then
            l_ScriptProfilerService_0:ClientStart(l_Players_0.LocalPlayer, v135.frequency);
            return;
        else
            l_ScriptProfilerService_0:ServerStart(v135.frequency);
            return;
        end;
    end;
    local function _(v137) --[[ Line: 302 ]] --[[ Name: StopScriptProfiling ]]
        -- upvalues: l_ScriptProfilerService_0 (ref), l_Players_0 (ref)
        if v137 then
            l_ScriptProfilerService_0:ClientStop(l_Players_0.LocalPlayer);
        else
            l_ScriptProfilerService_0:ServerStop();
        end;
        return nil;
    end;
    local function _(v139) --[[ Line: 311 ]] --[[ Name: RequestNewData ]]
        -- upvalues: l_ScriptProfilerService_0 (ref), l_Players_0 (ref)
        if v139 then
            l_ScriptProfilerService_0:ClientRequestData(l_Players_0.LocalPlayer);
            return;
        else
            l_ScriptProfilerService_0:ServerRequestData();
            return;
        end;
    end;
    local _ = function(v141) --[[ Line: 319 ]] --[[ Name: StopTimedProfiling ]]
        -- upvalues: v133 (copy), l_ScriptProfilerService_0 (ref), l_Players_0 (ref)
        if v133:getState(v141).isProfiling then
            if v141 then
                l_ScriptProfilerService_0:ClientStop(l_Players_0.LocalPlayer);
            else
                l_ScriptProfilerService_0:ServerStop();
            end;
            local _ = nil;
            v133.props.dispatchSetIsProfiling(v141, false);
            if v141 then
                l_ScriptProfilerService_0:ClientRequestData(l_Players_0.LocalPlayer);
                return;
            else
                l_ScriptProfilerService_0:ServerRequestData();
            end;
        end;
    end;
    v133.onUtilTabHeightChanged = function(v144) --[[ Line: 331 ]]
        -- upvalues: v133 (copy)
        v133:setState({
            utilTabHeight = v144
        });
    end;
    local function v147(v145) --[[ Line: 337 ]] --[[ Name: UpdateTimedProfilingTimer ]]
        -- upvalues: v133 (copy)
        while task.wait(0.5) do
            local l_timedProfilingCountdown_0 = v133:getState(v145).timedProfilingCountdown;
            if l_timedProfilingCountdown_0 > 0 then
                v133.props.dispatchSetTimer(v145, {
                    timedProfilingCountdown = l_timedProfilingCountdown_0 - 0.5
                });
            else
                break;
            end;
        end;
    end;
    local function v149(v148) --[[ Line: 352 ]] --[[ Name: LiveUpdate ]]
        -- upvalues: v42 (ref), v133 (copy), l_ScriptProfilerService_0 (ref), l_Players_0 (ref)
        while task.wait(v42 / 1000) do
            if v133:getState(v148).liveUpdate then
                if v148 then
                    l_ScriptProfilerService_0:ClientRequestData(l_Players_0.LocalPlayer);
                else
                    l_ScriptProfilerService_0:ServerRequestData();
                end;
            end;
        end;
    end;
    v133.onBeginProfile = function() --[[ Line: 362 ]]
        -- upvalues: v133 (copy), l_ScriptProfilerService_0 (ref), l_Players_0 (ref), v147 (copy), v149 (copy)
        local v150, v151 = v133:getActiveState();
        if v150 then
            l_ScriptProfilerService_0:ClientStart(l_Players_0.LocalPlayer, v151.frequency);
        else
            l_ScriptProfilerService_0:ServerStart(v151.frequency);
        end;
        v133.props.dispatchSetIsProfiling(v150, true);
        v133.props.dispatchClearStateForNewSession(v150);
        local v152 = {};
        if v151.timedProfilingDuration > 0 then
            v133.props.dispatchSetTimer(v150, {
                timedProfilingCountdown = v151.timedProfilingDuration
            });
            v152.timedProfilingThread = task.delay(v151.timedProfilingDuration, function() --[[ Line: 375 ]]
                -- upvalues: v150 (copy), v133 (ref), l_ScriptProfilerService_0 (ref), l_Players_0 (ref)
                local l_v150_0 = v150;
                if v133:getState(l_v150_0).isProfiling then
                    if l_v150_0 then
                        l_ScriptProfilerService_0:ClientStop(l_Players_0.LocalPlayer);
                    else
                        l_ScriptProfilerService_0:ServerStop();
                    end;
                    local _ = nil;
                    v133.props.dispatchSetIsProfiling(l_v150_0, false);
                    if l_v150_0 then
                        l_ScriptProfilerService_0:ClientRequestData(l_Players_0.LocalPlayer);
                        return;
                    else
                        l_ScriptProfilerService_0:ServerRequestData();
                    end;
                end;
            end);
            v152.timedProfilingTimerThread = task.spawn(function() --[[ Line: 379 ]]
                -- upvalues: v147 (ref), v150 (copy)
                v147(v150);
            end);
        end;
        v152.liveUpdateThread = task.spawn(v149, v150);
        v133.props.dispatchSetThreads(v150, v152);
    end;
    v133.onEndProfile = function() --[[ Line: 389 ]]
        -- upvalues: v133 (copy), l_ScriptProfilerService_0 (ref), l_Players_0 (ref)
        local v155, v156 = v133:getActiveState();
        if v155 then
            l_ScriptProfilerService_0:ClientStop(l_Players_0.LocalPlayer);
        else
            l_ScriptProfilerService_0:ServerStop();
        end;
        local _ = nil;
        local v158 = {};
        if v156.timedProfilingThread then
            task.cancel(v156.timedProfilingThread);
            v158.timedProfilingThread = nil;
        end;
        if v156.timedProfilingTimerThread then
            task.cancel(v156.timedProfilingTimerThread);
            v158.timedProfilingTimerThread = nil;
        end;
        if v156.liveUpdateThread then
            task.cancel(v156.liveUpdateThread);
            v158.liveUpdateThread = nil;
        end;
        v133.props.dispatchSetThreads(v155, {});
        v133.props.dispatchSetIsProfiling(v155, false);
        if v155 then
            l_ScriptProfilerService_0:ClientRequestData(l_Players_0.LocalPlayer);
            return;
        else
            l_ScriptProfilerService_0:ServerRequestData();
            return;
        end;
    end;
    v133.toggleTimedProfiling = function() --[[ Line: 417 ]]
        -- upvalues: v133 (copy)
        local v159, v160 = v133:getActiveState();
        local l_timedProfilingDuration_0 = v160.timedProfilingDuration;
        l_timedProfilingDuration_0 = l_timedProfilingDuration_0 == 0 and 60 or l_timedProfilingDuration_0 == 60 and 300 or l_timedProfilingDuration_0 == 300 and 600 or 0;
        v133.props.dispatchSetTimer(v159, {
            timedProfilingDuration = l_timedProfilingDuration_0
        });
    end;
    v133.toggleAverage = function() --[[ Line: 435 ]]
        -- upvalues: v133 (copy)
        local v162, v163 = v133:getActiveState();
        local l_average_0 = v163.average;
        l_average_0 = l_average_0 == 0 and 1 or l_average_0 == 1 and 60 or l_average_0 == 60 and 300 or l_average_0 == 300 and 600 or 0;
        v133.props.dispatchSetAverage(v162, l_average_0);
    end;
    v133.toggleUnits = function() --[[ Line: 455 ]]
        -- upvalues: v133 (copy)
        v133.props.dispatchSetScriptProfilerState(nil, not v133.props.usePercentages, nil, nil);
    end;
    v133.toggleFrequency = function() --[[ Line: 459 ]]
        -- upvalues: v133 (copy)
        local v165, v166 = v133:getActiveState();
        local v167 = v166.frequency == 1000 and 10000 or 1000;
        v133.props.dispatchSetFrequency(v165, v167);
    end;
    v133.onClientButton = function() --[[ Line: 473 ]]
        -- upvalues: v133 (copy)
        v133.props.dispatchSetScriptProfilerState(true);
    end;
    v133.onServerButton = function() --[[ Line: 477 ]]
        -- upvalues: v133 (copy)
        v133.props.dispatchSetScriptProfilerState(false);
    end;
    v133.dataViewDropDownCallback = function(v168) --[[ Line: 481 ]]
        -- upvalues: v133 (copy)
        local v169, v170 = v133:getActiveState();
        local l_isFunctionsView_0 = v170.isFunctionsView;
        if v168 == 1 then
            l_isFunctionsView_0 = false;
        elseif v168 == 2 then
            l_isFunctionsView_0 = true;
        end;
        v133.props.dispatchSetDataView(v169, l_isFunctionsView_0);
    end;
    v133.onCheckboxChanged = function(v172, v173) --[[ Line: 495 ]]
        -- upvalues: v133 (copy)
        local l_isClientView_1 = v133.props.isClientView;
        if v172 == "Live" then
            v133.props.dispatchSetLiveUpdate(l_isClientView_1, v173);
            return;
        elseif v172 == "Plugins" then
            v133.props.dispatchSetShowPlugins(l_isClientView_1, v173);
            return;
        else
            if v172 == "GC" then
                v133.props.dispatchSetShowGC(l_isClientView_1, v173);
            end;
            return;
        end;
    end;
    v133.onSearchTermChanged = function(v175) --[[ Line: 507 ]]
        -- upvalues: v133 (copy), v80 (ref)
        local v176, v177 = v133:getActiveState();
        local v178, v179 = v80(v177, v175);
        v133.props.dispatchSetSearchData(v176, {
            searchTerm = v175, 
            searchFilterFlat = v178 or {}, 
            searchFilterGraph = v179 or {}
        });
    end;
    v133.utilRef = v1.createRef();
    v133.state = {
        utilTabHeight = 0
    };
end;
v40.didMount = function(v180) --[[ Line: 525 ]] --[[ Name: didMount ]]
    -- upvalues: l_ScriptProfilerService_0 (copy), v132 (copy)
    v180:setState({
        utilTabHeight = v180.utilRef.current.Size.Y.Offset
    });
    v180.scriptProfilerConnection = l_ScriptProfilerService_0.OnNewData:Connect(function(v181, v182) --[[ Line: 531 ]]
        -- upvalues: v180 (copy), v132 (ref)
        local v183 = v181 ~= nil;
        local v184 = v180:getState(v183);
        local v185 = {};
        v132(v185, v184, v182);
        v180.props.dispatchSetData(v183, v185);
    end);
end;
v40.willUnmount = function(v186) --[[ Line: 543 ]] --[[ Name: willUnmount ]]
    v186.scriptProfilerConnection:Disconnect();
    v186.scriptProfilerConnection = nil;
end;
v40.didUpdate = function(v187) --[[ Line: 548 ]] --[[ Name: didUpdate ]]
    local l_Size_0 = v187.utilRef.current.Size;
    if l_Size_0.Y.Offset ~= v187.state.utilTabHeight then
        v187:setState({
            utilTabHeight = l_Size_0.Y.Offset
        });
    end;
end;
local function _(v189) --[[ Line: 557 ]] --[[ Name: formatTimer ]]
    -- upvalues: v15 (copy)
    local v190 = v15.formatTimer(v189);
    if v190 ~= "" then
        return ": " .. v190;
    else
        return v190;
    end;
end;
v40.renderUtilButtons = function(v192, v193, v194, v195) --[[ Line: 567 ]] --[[ Name: renderUtilButtons ]]
    -- upvalues: v1 (copy), v8 (copy), l_formatFrequency_0 (copy), l_MainWindowHeader_1 (copy), l_Text_0 (copy), l_MainWindowHeader_0 (copy), v33 (copy), l_UnselectedGray_0 (copy), v15 (copy), v9 (copy), l_SmallFrameHeight_0 (copy), v43 (copy)
    local l_isProfiling_0 = v193.isProfiling;
    local v197 = {};
    table.insert(v197, v1.createElement(v8, {
        text = l_isProfiling_0 and "Stop" or "Start", 
        onClicked = l_isProfiling_0 and v192.onEndProfile or v192.onBeginProfile
    }));
    if not v195 then
        table.insert(v197, v1.createElement(v8, {
            text = v192.props.usePercentages and "Unit: %" or "Unit: ms", 
            onClicked = v192.toggleUnits
        }));
    end;
    if not v195 then
        table.insert(v197, v1.createElement("TextButton", {
            Text = "Freq: " .. l_formatFrequency_0(v193.frequency), 
            TextSize = l_MainWindowHeader_1, 
            TextColor3 = l_Text_0, 
            Font = l_MainWindowHeader_0, 
            AutoButtonColor = true, 
            BackgroundColor3 = if l_isProfiling_0 then v33.Color.InactiveBox else l_UnselectedGray_0, 
            BackgroundTransparency = 0, 
            [v1.Event.Activated] = function() --[[ Line: 608 ]]
                -- upvalues: l_isProfiling_0 (copy), v192 (copy)
                if not l_isProfiling_0 then
                    v192.toggleFrequency();
                end;
            end
        }));
    end;
    if not v195 then
        local l_v197_0 = v197;
        local l_createElement_0 = v1.createElement;
        local v200 = "TextButton";
        local v201 = {};
        local v202 = "Time";
        local v203 = if l_isProfiling_0 then v193.timedProfilingCountdown else v193.timedProfilingDuration;
        local v204 = v15.formatTimer(v203);
        v201.Text = v202 .. if v204 ~= "" then ": " .. v204 else v204;
        v201.TextSize = l_MainWindowHeader_1;
        v201.TextColor3 = l_Text_0;
        v201.Font = l_MainWindowHeader_0;
        v201.AutoButtonColor = true;
        v201.BackgroundColor3 = if l_isProfiling_0 then v33.Color.InactiveBox else l_UnselectedGray_0;
        v201.BackgroundTransparency = 0;
        v201[v1.Event.Activated] = function() --[[ Line: 631 ]]
            -- upvalues: l_isProfiling_0 (copy), v192 (copy)
            if not l_isProfiling_0 then
                v192.toggleTimedProfiling();
            end;
        end;
        table.insert(l_v197_0, l_createElement_0(v200, v201));
    end;
    if not v195 then
        local l_v197_1 = v197;
        local l_createElement_1 = v1.createElement;
        local v207 = "TextButton";
        local v208 = {};
        local v209 = "Average";
        local l_average_1 = v193.average;
        local v211 = v15.formatTimer(l_average_1);
        v208.Text = v209 .. if v211 ~= "" then ": " .. v211 else v211;
        v208.TextSize = l_MainWindowHeader_1;
        v208.TextColor3 = l_Text_0;
        v208.Font = l_MainWindowHeader_0;
        v208.AutoButtonColor = true;
        v208.BackgroundColor3 = if l_isProfiling_0 then v33.Color.InactiveBox else l_UnselectedGray_0;
        v208.BackgroundTransparency = 0;
        v208[v1.Event.Activated] = function() --[[ Line: 653 ]]
            -- upvalues: l_isProfiling_0 (copy), v192 (copy)
            if not l_isProfiling_0 then
                v192.toggleAverage();
            end;
        end;
        table.insert(l_v197_1, l_createElement_1(v207, v208));
    end;
    if not v195 then
        table.insert(v197, v1.createElement(v8, {
            text = "Export", 
            onClicked = v192.props.dispatchStartExport
        }));
    end;
    if not v195 then
        table.insert(v197, v1.createElement(v9, {
            buttonSize = UDim2.new(0, 100, 0, l_SmallFrameHeight_0), 
            dropDownList = v43, 
            selectedIndex = v193.isFunctionsView and 2 or 1, 
            onSelection = v192.dataViewDropDownCallback
        }));
    end;
    if v194 then
        table.insert(v197, v1.createElement(v8, {
            text = "More...", 
            onClicked = function() --[[ Line: 689 ]] --[[ Name: onClicked ]]
                -- upvalues: v192 (copy)
                v192.props.dispatchShowMobileSettings();
            end
        }));
    end;
    return v197;
end;
v40.renderUtilAndTab = function(v212, v213, v214) --[[ Line: 699 ]] --[[ Name: renderUtilAndTab ]]
    -- upvalues: v1 (copy), v7 (copy), v5 (copy)
    local l_size_0 = v212.props.size;
    local l_formFactor_0 = v212.props.formFactor;
    local l_tabList_0 = v212.props.tabList;
    return v1.createElement(v7, v5.JoinDictionaries({
        windowWidth = l_size_0.X.Offset, 
        formFactor = l_formFactor_0, 
        tabList = l_tabList_0, 
        layoutOrder = 1, 
        refForParent = v212.utilRef, 
        onHeightChanged = v212.onUtilTabHeightChanged
    }, v213), v214);
end;
v40.renderExportView = function(v218) --[[ Line: 719 ]] --[[ Name: renderExportView ]]
    -- upvalues: v1 (copy), v33 (copy), l_MainRowPadding_0 (copy), v8 (copy), v13 (copy)
    local l_size_1 = v218.props.size;
    local l_utilTabHeight_0 = v218.state.utilTabHeight;
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
        UtilAndTab = v218:renderUtilAndTab({}, {
            v1.createElement(v8, {
                text = "Exit", 
                onClicked = v218.props.dispatchFinishedExporting
            })
        }), 
        ExportView = v1.createElement(v13, {
            size = UDim2.new(1, 0, 1, -l_utilTabHeight_0)
        })
    });
end;
v40.renderMobileSettingsUI = function(v221) --[[ Line: 748 ]] --[[ Name: renderMobileSettingsUI ]]
    -- upvalues: v1 (copy), v33 (copy), l_MainRowPadding_0 (copy), v8 (copy), v14 (copy)
    local l_size_2 = v221.props.size;
    local l_utilTabHeight_1 = v221.state.utilTabHeight;
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
        UtilAndTab = v221:renderUtilAndTab({}, {
            v1.createElement(v8, {
                text = "Export", 
                onClicked = v221.props.dispatchStartExport
            }), 
            v1.createElement(v8, {
                text = "Exit", 
                onClicked = v221.props.dispatchHideMobileSettings
            })
        }), 
        MobileSettingsView = v1.createElement(v14, {
            size = UDim2.new(1, 0, 1, -l_utilTabHeight_1)
        })
    });
end;
v40.renderProfilerView = function(v224, v225, v226, v227, v228) --[[ Line: 783 ]] --[[ Name: renderProfilerView ]]
    -- upvalues: v1 (copy), v33 (copy), l_MainRowPadding_0 (copy), v11 (copy), v10 (copy), v41 (copy)
    local l_isProfiling_1 = v226.isProfiling;
    local l_data_1 = v226.data;
    local l_usePercentages_0 = v224.props.usePercentages;
    local l_isFunctionsView_1 = v226.isFunctionsView;
    local l_rootNode_0 = v226.rootNode;
    local l_rootNodeName_0 = v226.rootNodeName;
    local l_rootFunc_0 = v226.rootFunc;
    local l_size_3 = v224.props.size;
    local l_utilTabHeight_2 = v224.state.utilTabHeight;
    local v238 = nil;
    if l_data_1 and l_data_1.SessionStartTime and l_data_1.SessionEndTime then
        v238 = l_data_1.SessionEndTime - l_data_1.SessionStartTime;
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
        UtilAndTab = v224:renderUtilAndTab({
            isClientView = v225, 
            onClientButton = v224.onClientButton, 
            onServerButton = v224.onServerButton, 
            orderedCheckboxState = v228, 
            onCheckboxChanged = v224.onCheckboxChanged, 
            onSearchTermChanged = v224.onSearchTermChanged, 
            searchTerm = v226.searchTerm
        }, v227), 
        ProfilerView = v1.createElement(if l_isFunctionsView_1 then v11 else v10, {
            size = UDim2.new(1, 0, 1, -l_utilTabHeight_2), 
            searchFilter = if l_isFunctionsView_1 then v226.searchFilterFlat else v226.searchFilterGraph, 
            layoutOrder = 2, 
            data = l_data_1, 
            profiling = l_isProfiling_1, 
            showAsPercentages = l_usePercentages_0, 
            sessionLength = v238, 
            rootNode = l_rootNode_0, 
            rootFunc = l_rootFunc_0, 
            rootNodeName = l_rootNodeName_0, 
            average = v226.average, 
            showPlugins = v226.showPlugins or not v41, 
            pluginOffsets = v226.pluginOffsets, 
            showGC = v226.showGC, 
            gcFunctionOffsets = v226.gcFunctionOffsets, 
            gcNodeOffsets = v226.gcNodeOffsets, 
            pluginGCOffsets = v226.pluginGCOffsets, 
            expandedNodes = if l_isFunctionsView_1 then nil else v226.expandedNodes
        })
    });
end;
v40.render = function(v239) --[[ Line: 847 ]] --[[ Name: render ]]
    -- upvalues: v33 (copy), v41 (copy)
    if v239.props.isExporting then
        return v239:renderExportView();
    elseif v239.props.isShowingMobileSettings then
        return v239:renderMobileSettingsUI();
    else
        local l_formFactor_1 = v239.props.formFactor;
        local v241, v242 = v239:getActiveState();
        local v243 = {};
        local v244 = 1;
        local v245 = l_formFactor_1 == v33.FormFactor.Small;
        if not v245 then
            v243[1] = {
                name = "Live", 
                state = v242.liveUpdate
            };
            if v41 then
                v244 = v244 + 1;
                v243[v244] = {
                    name = "Plugins", 
                    state = v242.showPlugins
                };
            end;
            v243[v244 + 1] = {
                name = "GC", 
                state = v242.showGC
            };
        end;
        return v239:renderProfilerView(v241, v242, v239:renderUtilButtons(v242, v245, v245), v243);
    end;
end;
return v2.UNSTABLE_connect2(function(v246, _) --[[ Line: 882 ]] --[[ Name: mapStateToProps ]]
    return {
        isClientView = v246.ScriptProfiler.isClientView, 
        usePercentages = v246.ScriptProfiler.usePercentages, 
        isExporting = v246.ScriptProfiler.isExporting, 
        isShowingMobileSettings = v246.ScriptProfiler.isShowingMobileSettings, 
        client = v246.ScriptProfiler.client, 
        server = v246.ScriptProfiler.server
    };
end, function(v248) --[[ Line: 894 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v20 (copy), v21 (copy), v22 (copy), v23 (copy), v24 (copy), v25 (copy), v26 (copy), v27 (copy), v28 (copy), v29 (copy), v30 (copy), v31 (copy), v32 (copy)
    return {
        dispatchSetScriptProfilerState = function(v249, v250, v251, v252) --[[ Line: 896 ]] --[[ Name: dispatchSetScriptProfilerState ]]
            -- upvalues: v248 (copy), v20 (ref)
            v248(v20(v249, v250, v251, v252));
        end, 
        dispatchSetIsProfiling = function(v253, v254) --[[ Line: 900 ]] --[[ Name: dispatchSetIsProfiling ]]
            -- upvalues: v248 (copy), v21 (ref)
            v248(v21(v253, v254));
        end, 
        dispatchSetData = function(v255, v256) --[[ Line: 904 ]] --[[ Name: dispatchSetData ]]
            -- upvalues: v248 (copy), v22 (ref)
            v248(v22(v255, v256));
        end, 
        dispatchSetThreads = function(v257, v258) --[[ Line: 908 ]] --[[ Name: dispatchSetThreads ]]
            -- upvalues: v248 (copy), v23 (ref)
            v248(v23(v257, v258));
        end, 
        dispatchSetTimer = function(v259, v260) --[[ Line: 912 ]] --[[ Name: dispatchSetTimer ]]
            -- upvalues: v248 (copy), v24 (ref)
            v248(v24(v259, v260));
        end, 
        dispatchClearStateForNewSession = function(v261) --[[ Line: 916 ]] --[[ Name: dispatchClearStateForNewSession ]]
            -- upvalues: v248 (copy), v25 (ref)
            v248(v25(v261));
        end, 
        dispatchSetAverage = function(v262, v263) --[[ Line: 920 ]] --[[ Name: dispatchSetAverage ]]
            -- upvalues: v248 (copy), v26 (ref)
            v248(v26(v262, v263));
        end, 
        dispatchSetFrequency = function(v264, v265) --[[ Line: 924 ]] --[[ Name: dispatchSetFrequency ]]
            -- upvalues: v248 (copy), v27 (ref)
            v248(v27(v264, v265));
        end, 
        dispatchSetDataView = function(v266, v267) --[[ Line: 928 ]] --[[ Name: dispatchSetDataView ]]
            -- upvalues: v248 (copy), v28 (ref)
            v248(v28(v266, v267));
        end, 
        dispatchSetLiveUpdate = function(v268, v269) --[[ Line: 932 ]] --[[ Name: dispatchSetLiveUpdate ]]
            -- upvalues: v248 (copy), v29 (ref)
            v248(v29(v268, v269));
        end, 
        dispatchSetShowPlugins = function(v270, v271) --[[ Line: 936 ]] --[[ Name: dispatchSetShowPlugins ]]
            -- upvalues: v248 (copy), v30 (ref)
            v248(v30(v270, v271));
        end, 
        dispatchSetShowGC = function(v272, v273) --[[ Line: 940 ]] --[[ Name: dispatchSetShowGC ]]
            -- upvalues: v248 (copy), v31 (ref)
            v248(v31(v272, v273));
        end, 
        dispatchSetSearchData = function(v274, v275) --[[ Line: 944 ]] --[[ Name: dispatchSetSearchData ]]
            -- upvalues: v248 (copy), v32 (ref)
            v248(v32(v274, v275));
        end, 
        dispatchStartExport = function() --[[ Line: 948 ]] --[[ Name: dispatchStartExport ]]
            -- upvalues: v248 (copy), v20 (ref)
            v248(v20(nil, nil, nil, nil, true));
        end, 
        dispatchFinishedExporting = function() --[[ Line: 952 ]] --[[ Name: dispatchFinishedExporting ]]
            -- upvalues: v248 (copy), v20 (ref)
            v248(v20(nil, nil, nil, nil, false));
        end, 
        dispatchShowMobileSettings = function() --[[ Line: 956 ]] --[[ Name: dispatchShowMobileSettings ]]
            -- upvalues: v248 (copy), v20 (ref)
            v248(v20(nil, nil, nil, nil, nil, true));
        end, 
        dispatchHideMobileSettings = function() --[[ Line: 960 ]] --[[ Name: dispatchHideMobileSettings ]]
            -- upvalues: v248 (copy), v20 (ref)
            v248(v20(nil, nil, nil, nil, nil, false));
        end
    };
end)(v40);