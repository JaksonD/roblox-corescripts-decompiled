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
local l_FFlagDebugForceConsoleSafeInsets_0 = require(l_Parent_1.SharedFlags).FFlagDebugForceConsoleSafeInsets;
local l_FFlagEnableLeftNavOnConsole_0 = require(l_Parent_1.SharedFlags).FFlagEnableLeftNavOnConsole;
local l_FFlagLuaAppCompositionSupport_0 = require(l_Parent_1.SharedFlags).FFlagLuaAppCompositionSupport;
local v16 = if l_FFlagLuaAppCompositionSupport_0 then l_GuiService_0:IsTenFootInterface() else nil;
local function v22(v17) --[[ Line: 46 ]] --[[ Name: forceConsoleSafeInsets ]]
    -- upvalues: l_Parent_1 (copy)
    local l_MessageBus_0 = require(l_Parent_1.MessageBus).MessageBus;
    local v19 = require(l_Parent_1.t);
    local v20 = {
        mid = l_MessageBus_0.getMessageId("Screen", "safeAreaInsets"), 
        validateParams = v19.strictInterface({
            left = v19.number, 
            top = v19.number, 
            right = v19.number, 
            bottom = v19.number
        })
    };
    local v21 = {
        left = v17.X * 0.05, 
        top = v17.Y * 0.05, 
        right = v17.X * 0.05, 
        bottom = v17.Y * 0.05
    };
    l_MessageBus_0.publish(v20, v21);
end;
return function() --[[ Line: 69 ]]
    -- upvalues: v3 (copy), v4 (copy), l_GuiService_0 (copy), l_FFlagExtendScrollingFramesBySafeInsets_0 (copy), v5 (copy), l_FFlagDebugForceConsoleSafeInsets_0 (copy), v22 (copy), l_game_EngineFeature_0 (copy), v6 (copy), v10 (copy), v7 (copy), v11 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), v16 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy)
    local v23 = nil;
    local v24, v25 = v3.createSignal(workspace.CurrentCamera);
    v23 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 72 ]]
        -- upvalues: v25 (copy)
        v25(workspace.CurrentCamera);
    end);
    local v26 = nil;
    local v27, v28 = v3.createSignal(v4.isSpatial());
    v26 = v4.connectToIsSpatialChanged(function(v29) --[[ Line: 78 ]]
        -- upvalues: v28 (copy)
        v28(v29);
    end);
    local function v32() --[[ Line: 82 ]] --[[ Name: calculateDeviceSafePadding ]]
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
    local v33 = nil;
    local v34 = nil;
    if l_FFlagExtendScrollingFramesBySafeInsets_0 then
        local v35, v36 = v3.createSignal((v32()));
        v33 = v35;
        v34 = v36;
    end;
    local v37 = Vector2.new(1, 1);
    local v38 = v24(false);
    if v38 then
        v37 = v38.ViewportSize;
    end;
    local v39, v40 = v3.createSignal(v37);
    local v41 = nil;
    local v44 = v3.createEffect(function(v42) --[[ Line: 105 ]]
        -- upvalues: v24 (copy), v41 (ref), v27 (copy), v40 (copy), v5 (ref), l_FFlagExtendScrollingFramesBySafeInsets_0 (ref), v34 (ref), v32 (copy), l_FFlagDebugForceConsoleSafeInsets_0 (ref), v22 (ref), v39 (copy)
        local v43 = v24(v42);
        if v43 then
            if v41 then
                v41:Disconnect();
                v41 = nil;
            end;
            if v27(v42) then
                v40(v5.VRConstants.MainScreenResolution);
                return;
            else
                v41 = v43:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 116 ]]
                    -- upvalues: v40 (ref), v43 (copy), l_FFlagExtendScrollingFramesBySafeInsets_0 (ref), v34 (ref), v32 (ref), l_FFlagDebugForceConsoleSafeInsets_0 (ref), v22 (ref), v39 (ref), v42 (copy)
                    v40(v43.ViewportSize);
                    if l_FFlagExtendScrollingFramesBySafeInsets_0 then
                        v34((v32()));
                        if l_FFlagDebugForceConsoleSafeInsets_0 then
                            v22(v39(v42));
                        end;
                    end;
                end);
            end;
        end;
    end);
    local v45 = nil;
    if l_game_EngineFeature_0 then
        v45 = l_GuiService_0.ViewportDisplaySize;
    end;
    local v46, v47 = v3.createSignal(v45);
    local v48 = nil;
    if l_game_EngineFeature_0 then
        v48 = l_GuiService_0:GetPropertyChangedSignal("ViewportDisplaySize"):Connect(function() --[[ Line: 137 ]]
            -- upvalues: v47 (copy), l_GuiService_0 (ref)
            v47(l_GuiService_0.ViewportDisplaySize);
        end);
    end;
    local v49 = v6();
    local v50, v51 = v3.createSignal(v49);
    local v52, v53 = v3.createSignal(v49.top);
    local v59 = v3.createComputed(function(v54) --[[ Line: 146 ]]
        -- upvalues: v46 (copy), v39 (copy), v10 (ref), v7 (ref), v11 (ref)
        local v55 = v46(v54);
        local v56 = v39(v54);
        if v55 == nil or v56.X == 0 then
            return 1;
        else
            local v57 = true;
            if v55 ~= Enum.DisplaySize.Small then
                v57 = v10;
            end;
            local v58 = v56.X > v7;
            if v11 and v57 and v58 then
                return v56.X / v7;
            else
                return 1;
            end;
        end;
    end);
    local v60 = nil;
    local v61 = nil;
    if l_FFlagLuaAppCompositionSupport_0 then
        v60 = v3.createComputed(function(v62) --[[ Line: 166 ]]
            -- upvalues: v16 (ref), v59 (copy)
            if v16 then
                return 1.5;
            else
                return v59(v62);
            end;
        end);
        v61 = v3.createComputed(function(v63) --[[ Line: 175 ]]
            -- upvalues: v39 (copy), v60 (ref)
            local v64 = v39(v63);
            local v65 = v60(v63);
            if not v65 or v65 == 0 then
                v65 = 1;
            end;
            return v64.X / v65;
        end);
    end;
    return {
        getViewportSize = v39, 
        getDisplaySize = v46, 
        getGuiInset = v50, 
        getTopBarHeight = v52, 
        getUIScale = v59, 
        getPlatformScale = if l_FFlagLuaAppCompositionSupport_0 then v60 else nil, 
        getDesignSpaceViewportWidth = if l_FFlagLuaAppCompositionSupport_0 then v61 else nil, 
        getIsSpatial = v27, 
        setGuiInset = v51, 
        setTopBarHeight = v53, 
        getDeviceSafePadding = if not not l_FFlagExtendScrollingFramesBySafeInsets_0 or l_FFlagEnableLeftNavOnConsole_0 then v33 else nil, 
        cleanUp = function() --[[ Line: 201 ]] --[[ Name: cleanUp ]]
            -- upvalues: v48 (ref), v41 (ref), v23 (ref), v26 (ref), v44 (copy)
            if v48 then
                v48:Disconnect();
                v48 = nil;
            end;
            if v41 then
                v41:Disconnect();
                v41 = nil;
            end;
            if v23 then
                v23:Disconnect();
                v23 = nil;
            end;
            if v26 then
                v26:Disconnect();
                v26 = nil;
            end;
            if v44 then
                v44();
            end;
        end, 
        forceConsoleSafeInsets = l_FFlagDebugForceConsoleSafeInsets_0 and function() --[[ Line: 223 ]]
            -- upvalues: v22 (ref), v39 (copy)
            v22(v39());
        end or nil
    };
end;