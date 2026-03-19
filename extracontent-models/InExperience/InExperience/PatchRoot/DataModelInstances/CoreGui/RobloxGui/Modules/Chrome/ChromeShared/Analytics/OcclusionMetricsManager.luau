local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v5 = require(l_CorePackages_0.Packages.Signals);
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local v7 = require(l_script_FirstAncestor_0.Unibar.Constants);
local v8 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon);
local l_FFlagTopBarSignalizeKeepOutAreas_0 = v8.Flags.FFlagTopBarSignalizeKeepOutAreas;
local v10 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFIntLuaUIOcclusionMetricsReportingPeriodSeconds();
local l_game_EngineFeature_0 = game:GetEngineFeature("GuiServiceSendUIOcclusionMetricsForQueryRegion");
local function _(v12) --[[ Line: 28 ]] --[[ Name: convertCoreUIPointToHardwareSafeAreaPoint ]]
    -- upvalues: l_GuiService_0 (copy)
    return v12 + l_GuiService_0:GetGuiInset();
end;
local function _(v14) --[[ Line: 33 ]] --[[ Name: vector2ToUDim2 ]]
    return UDim2.fromOffset(v14.X, v14.Y);
end;
local function _(v16) --[[ Line: 37 ]] --[[ Name: reportOcclusionMetrics ]]
    -- upvalues: l_GuiService_0 (copy)
    local v17 = v16.position + l_GuiService_0:GetGuiInset();
    local l_l_GuiService_0_0 = l_GuiService_0;
    local v19 = UDim2.fromOffset(v17.X, v17.Y);
    local l_size_0 = v16.size;
    l_l_GuiService_0_0:SendUIOcclusionMetricsForQueryRegion(v19, UDim2.fromOffset(l_size_0.X, l_size_0.Y), "currentSizeTR");
end;
return function() --[[ Line: 46 ]] --[[ Name: OcclusionMetricsManager ]]
    -- upvalues: l_game_EngineFeature_0 (copy), v3 (copy), v7 (copy), l_FFlagTopBarSignalizeKeepOutAreas_0 (copy), v8 (copy), v5 (copy), l_useSelector_0 (copy), l_GuiService_0 (copy), v10 (copy)
    if not l_game_EngineFeature_0 then
        return;
    else
        local v22 = nil;
        local v23 = v3.useRef({
            id = v7.UNIBAR_KEEP_OUT_AREA_ID, 
            position = Vector2.new(), 
            size = Vector2.new()
        });
        if l_FFlagTopBarSignalizeKeepOutAreas_0 then
            local v24 = v8.Stores.GetKeepOutAreasStore(false);
            v22 = v5.createEffect(function(_) --[[ Line: 63 ]]
                -- upvalues: v23 (copy), v24 (copy), v7 (ref)
                v23.current = v24.getKeepOutAreas(false)[v7.UNIBAR_KEEP_OUT_AREA_ID];
            end);
        else
            local v27 = l_useSelector_0(function(v26) --[[ Line: 67 ]]
                -- upvalues: v7 (ref)
                return v26.displayOptions.keepOutAreas[v7.UNIBAR_KEEP_OUT_AREA_ID];
            end);
            v3.useEffect(function() --[[ Line: 71 ]]
                -- upvalues: v23 (copy), v27 (copy)
                v23.current = v27;
            end, {
                v27
            });
        end;
        v3.useEffect(function() --[[ Line: 76 ]]
            -- upvalues: v23 (copy), l_GuiService_0 (ref), v10 (ref), l_FFlagTopBarSignalizeKeepOutAreas_0 (ref), v22 (ref)
            local v33 = task.spawn(function() --[[ Line: 78 ]]
                -- upvalues: v23 (ref), l_GuiService_0 (ref), v10 (ref)
                while true do
                    if v23.current then
                        local l_current_0 = v23.current;
                        local v29 = l_current_0.position + l_GuiService_0:GetGuiInset();
                        local l_l_GuiService_0_1 = l_GuiService_0;
                        local v31 = UDim2.fromOffset(v29.X, v29.Y);
                        local l_size_1 = l_current_0.size;
                        l_l_GuiService_0_1:SendUIOcclusionMetricsForQueryRegion(v31, UDim2.fromOffset(l_size_1.X, l_size_1.Y), "currentSizeTR");
                    end;
                    task.wait(v10);
                end;
            end);
            return function() --[[ Line: 87 ]]
                -- upvalues: v33 (copy), l_FFlagTopBarSignalizeKeepOutAreas_0 (ref), v22 (ref)
                task.cancel(v33);
                if l_FFlagTopBarSignalizeKeepOutAreas_0 then
                    v22();
                end;
            end;
        end, {});
        return;
    end;
end;