local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Signals);
local v4 = require(l_Parent_1.AppCommonLib);
local v5 = require(l_Parent_1.VrCompatibility);
local v6 = require(l_Parent_0.getGlobalGuiInset);
local v7 = require(l_Parent_0.Flags.FIntLuaAppSmallScreenDesignWidth);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableDisplaySize");
local v9 = game:DefineFastFlag("FFlagLuaAppEnableWindowsHandheldScale", false);
local v10 = game:DefineFastFlag("DebugLuaAppEnableScale", false);
local v11 = v10 or v9 and l_game_EngineFeature_0;
local l_FFlagExtendScrollingFramesBySafeInsets_0 = require(l_Parent_1.SharedFlags).FFlagExtendScrollingFramesBySafeInsets;
local l_FFlagLuaAppCompositionSupport_0 = require(l_Parent_1.SharedFlags).FFlagLuaAppCompositionSupport;
local v14 = if l_FFlagLuaAppCompositionSupport_0 then l_GuiService_0:IsTenFootInterface() else nil;
return function() --[[ Line: 43 ]]
    -- upvalues: v3 (copy), v4 (copy), l_GuiService_0 (copy), l_FFlagExtendScrollingFramesBySafeInsets_0 (copy), v5 (copy), l_game_EngineFeature_0 (copy), v6 (copy), v10 (copy), v7 (copy), v11 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), v14 (copy)
    local v15 = nil;
    local v16, v17 = v3.createSignal(workspace.CurrentCamera);
    v15 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 46 ]]
        -- upvalues: v17 (copy)
        v17(workspace.CurrentCamera);
    end);
    local v18 = nil;
    local v19, v20 = v3.createSignal(v4.isSpatial());
    v18 = v4.connectToIsSpatialChanged(function(v21) --[[ Line: 52 ]]
        -- upvalues: v20 (copy)
        v20(v21);
    end);
    local function v24() --[[ Line: 56 ]] --[[ Name: calculateDeviceSafePadding ]]
        -- upvalues: l_GuiService_0 (ref)
        local l_l_GuiService_0_InsetArea_0 = l_GuiService_0:GetInsetArea(Enum.ScreenInsets.None);
        local l_l_GuiService_0_InsetArea_1 = l_GuiService_0:GetInsetArea(Enum.ScreenInsets.DeviceSafeInsets);
        return {
            left = l_l_GuiService_0_InsetArea_1.Min.X - l_l_GuiService_0_InsetArea_0.Min.X, 
            top = l_l_GuiService_0_InsetArea_1.Min.Y - l_l_GuiService_0_InsetArea_0.Min.Y, 
            right = l_l_GuiService_0_InsetArea_0.Max.X - l_l_GuiService_0_InsetArea_1.Max.X, 
            bottom = l_l_GuiService_0_InsetArea_0.Max.Y - l_l_GuiService_0_InsetArea_1.Max.Y
        };
    end;
    local v25 = nil;
    local v26 = nil;
    if l_FFlagExtendScrollingFramesBySafeInsets_0 then
        local v27, v28 = v3.createSignal((v24()));
        v25 = v27;
        v26 = v28;
    end;
    local v29 = Vector2.new(1, 1);
    local v30 = v16(false);
    if v30 then
        v29 = v30.ViewportSize;
    end;
    local v31, v32 = v3.createSignal(v29);
    local v33 = nil;
    local v36 = v3.createEffect(function(v34) --[[ Line: 79 ]]
        -- upvalues: v16 (copy), v33 (ref), v19 (copy), v32 (copy), v5 (ref), l_FFlagExtendScrollingFramesBySafeInsets_0 (ref), v26 (ref), v24 (copy)
        local v35 = v16(v34);
        if v35 then
            if v33 then
                v33:Disconnect();
                v33 = nil;
            end;
            if v19(v34) then
                v32(v5.VRConstants.MainScreenResolution);
                return;
            else
                v33 = v35:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 90 ]]
                    -- upvalues: v32 (ref), v35 (copy), l_FFlagExtendScrollingFramesBySafeInsets_0 (ref), v26 (ref), v24 (ref)
                    v32(v35.ViewportSize);
                    if l_FFlagExtendScrollingFramesBySafeInsets_0 then
                        v26((v24()));
                    end;
                end);
            end;
        end;
    end);
    local v37 = nil;
    if l_game_EngineFeature_0 then
        v37 = l_GuiService_0.ViewportDisplaySize;
    end;
    local v38, v39 = v3.createSignal(v37);
    local v40 = nil;
    if l_game_EngineFeature_0 then
        v40 = l_GuiService_0:GetPropertyChangedSignal("ViewportDisplaySize"):Connect(function() --[[ Line: 108 ]]
            -- upvalues: v39 (copy), l_GuiService_0 (ref)
            v39(l_GuiService_0.ViewportDisplaySize);
        end);
    end;
    local v41 = v6();
    local v42, v43 = v3.createSignal(v41);
    local v44, v45 = v3.createSignal(v41.top);
    local v51 = v3.createComputed(function(v46) --[[ Line: 117 ]]
        -- upvalues: v38 (copy), v31 (copy), v10 (ref), v7 (ref), v11 (ref)
        local v47 = v38(v46);
        local v48 = v31(v46);
        if v47 == nil or v48.X == 0 then
            return 1;
        else
            local v49 = true;
            if v47 ~= Enum.DisplaySize.Small then
                v49 = v10;
            end;
            local v50 = v48.X > v7;
            if v11 and v49 and v50 then
                return v48.X / v7;
            else
                return 1;
            end;
        end;
    end);
    local v52 = nil;
    local v53 = nil;
    if l_FFlagLuaAppCompositionSupport_0 then
        v52 = v3.createComputed(function(v54) --[[ Line: 137 ]]
            -- upvalues: v14 (ref), v51 (copy)
            if v14 then
                return 1.5;
            else
                return v51(v54);
            end;
        end);
        v53 = v3.createComputed(function(v55) --[[ Line: 146 ]]
            -- upvalues: v31 (copy), v52 (ref)
            local v56 = v31(v55);
            local v57 = v52(v55);
            if not v57 or v57 == 0 then
                v57 = 1;
            end;
            return v56.X / v57;
        end);
    end;
    return {
        getViewportSize = v31, 
        getDisplaySize = v38, 
        getGuiInset = v42, 
        getTopBarHeight = v44, 
        getUIScale = v51, 
        getPlatformScale = if l_FFlagLuaAppCompositionSupport_0 then v52 else nil, 
        getDesignSpaceViewportWidth = if l_FFlagLuaAppCompositionSupport_0 then v53 else nil, 
        getIsSpatial = v19, 
        setGuiInset = v43, 
        setTopBarHeight = v45, 
        getDeviceSafePadding = if l_FFlagExtendScrollingFramesBySafeInsets_0 then v25 else nil, 
        cleanUp = function() --[[ Line: 170 ]] --[[ Name: cleanUp ]]
            -- upvalues: v40 (ref), v33 (ref), v15 (ref), v18 (ref), v36 (copy)
            if v40 then
                v40:Disconnect();
                v40 = nil;
            end;
            if v33 then
                v33:Disconnect();
                v33 = nil;
            end;
            if v15 then
                v15:Disconnect();
                v15 = nil;
            end;
            if v18 then
                v18:Disconnect();
                v18 = nil;
            end;
            if v36 then
                v36();
            end;
        end
    };
end;