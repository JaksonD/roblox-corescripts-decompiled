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
local l_FFlagLuaAppCompositionSupport_0 = require(l_Parent_1.SharedFlags).FFlagLuaAppCompositionSupport;
local v15 = if l_FFlagLuaAppCompositionSupport_0 then l_GuiService_0:IsTenFootInterface() else nil;
local function v21(v16) --[[ Line: 45 ]] --[[ Name: forceConsoleSafeInsets ]]
    -- upvalues: l_Parent_1 (copy)
    local l_MessageBus_0 = require(l_Parent_1.MessageBus).MessageBus;
    local v18 = require(l_Parent_1.t);
    local v19 = {
        mid = l_MessageBus_0.getMessageId("Screen", "safeAreaInsets"), 
        validateParams = v18.strictInterface({
            left = v18.number, 
            top = v18.number, 
            right = v18.number, 
            bottom = v18.number
        })
    };
    local v20 = {
        left = v16.X * 0.05, 
        top = v16.Y * 0.05, 
        right = v16.X * 0.05, 
        bottom = v16.Y * 0.05
    };
    l_MessageBus_0.publish(v19, v20);
end;
return function() --[[ Line: 68 ]]
    -- upvalues: v3 (copy), v4 (copy), l_GuiService_0 (copy), l_FFlagExtendScrollingFramesBySafeInsets_0 (copy), v5 (copy), l_FFlagDebugForceConsoleSafeInsets_0 (copy), v21 (copy), l_game_EngineFeature_0 (copy), v6 (copy), v10 (copy), v7 (copy), v11 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), v15 (copy)
    local v22 = nil;
    local v23, v24 = v3.createSignal(workspace.CurrentCamera);
    v22 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 71 ]]
        -- upvalues: v24 (copy)
        v24(workspace.CurrentCamera);
    end);
    local v25 = nil;
    local v26, v27 = v3.createSignal(v4.isSpatial());
    v25 = v4.connectToIsSpatialChanged(function(v28) --[[ Line: 77 ]]
        -- upvalues: v27 (copy)
        v27(v28);
    end);
    local function v31() --[[ Line: 81 ]] --[[ Name: calculateDeviceSafePadding ]]
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
    local v32 = nil;
    local v33 = nil;
    if l_FFlagExtendScrollingFramesBySafeInsets_0 then
        local v34, v35 = v3.createSignal((v31()));
        v32 = v34;
        v33 = v35;
    end;
    local v36 = Vector2.new(1, 1);
    local v37 = v23(false);
    if v37 then
        v36 = v37.ViewportSize;
    end;
    local v38, v39 = v3.createSignal(v36);
    local v40 = nil;
    local v43 = v3.createEffect(function(v41) --[[ Line: 104 ]]
        -- upvalues: v23 (copy), v40 (ref), v26 (copy), v39 (copy), v5 (ref), l_FFlagExtendScrollingFramesBySafeInsets_0 (ref), v33 (ref), v31 (copy), l_FFlagDebugForceConsoleSafeInsets_0 (ref), v21 (ref), v38 (copy)
        local v42 = v23(v41);
        if v42 then
            if v40 then
                v40:Disconnect();
                v40 = nil;
            end;
            if v26(v41) then
                v39(v5.VRConstants.MainScreenResolution);
                return;
            else
                v40 = v42:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 115 ]]
                    -- upvalues: v39 (ref), v42 (copy), l_FFlagExtendScrollingFramesBySafeInsets_0 (ref), v33 (ref), v31 (ref), l_FFlagDebugForceConsoleSafeInsets_0 (ref), v21 (ref), v38 (ref), v41 (copy)
                    v39(v42.ViewportSize);
                    if l_FFlagExtendScrollingFramesBySafeInsets_0 then
                        v33((v31()));
                        if l_FFlagDebugForceConsoleSafeInsets_0 then
                            v21(v38(v41));
                        end;
                    end;
                end);
            end;
        end;
    end);
    local v44 = nil;
    if l_game_EngineFeature_0 then
        v44 = l_GuiService_0.ViewportDisplaySize;
    end;
    local v45, v46 = v3.createSignal(v44);
    local v47 = nil;
    if l_game_EngineFeature_0 then
        v47 = l_GuiService_0:GetPropertyChangedSignal("ViewportDisplaySize"):Connect(function() --[[ Line: 136 ]]
            -- upvalues: v46 (copy), l_GuiService_0 (ref)
            v46(l_GuiService_0.ViewportDisplaySize);
        end);
    end;
    local v48 = v6();
    local v49, v50 = v3.createSignal(v48);
    local v51, v52 = v3.createSignal(v48.top);
    local v58 = v3.createComputed(function(v53) --[[ Line: 145 ]]
        -- upvalues: v45 (copy), v38 (copy), v10 (ref), v7 (ref), v11 (ref)
        local v54 = v45(v53);
        local v55 = v38(v53);
        if v54 == nil or v55.X == 0 then
            return 1;
        else
            local v56 = true;
            if v54 ~= Enum.DisplaySize.Small then
                v56 = v10;
            end;
            local v57 = v55.X > v7;
            if v11 and v56 and v57 then
                return v55.X / v7;
            else
                return 1;
            end;
        end;
    end);
    local v59 = nil;
    local v60 = nil;
    if l_FFlagLuaAppCompositionSupport_0 then
        v59 = v3.createComputed(function(v61) --[[ Line: 165 ]]
            -- upvalues: v15 (ref), v58 (copy)
            if v15 then
                return 1.5;
            else
                return v58(v61);
            end;
        end);
        v60 = v3.createComputed(function(v62) --[[ Line: 174 ]]
            -- upvalues: v38 (copy), v59 (ref)
            local v63 = v38(v62);
            local v64 = v59(v62);
            if not v64 or v64 == 0 then
                v64 = 1;
            end;
            return v63.X / v64;
        end);
    end;
    return {
        getViewportSize = v38, 
        getDisplaySize = v45, 
        getGuiInset = v49, 
        getTopBarHeight = v51, 
        getUIScale = v58, 
        getPlatformScale = if l_FFlagLuaAppCompositionSupport_0 then v59 else nil, 
        getDesignSpaceViewportWidth = if l_FFlagLuaAppCompositionSupport_0 then v60 else nil, 
        getIsSpatial = v26, 
        setGuiInset = v50, 
        setTopBarHeight = v52, 
        getDeviceSafePadding = if l_FFlagExtendScrollingFramesBySafeInsets_0 then v32 else nil, 
        cleanUp = function() --[[ Line: 198 ]] --[[ Name: cleanUp ]]
            -- upvalues: v47 (ref), v40 (ref), v22 (ref), v25 (ref), v43 (copy)
            if v47 then
                v47:Disconnect();
                v47 = nil;
            end;
            if v40 then
                v40:Disconnect();
                v40 = nil;
            end;
            if v22 then
                v22:Disconnect();
                v22 = nil;
            end;
            if v25 then
                v25:Disconnect();
                v25 = nil;
            end;
            if v43 then
                v43();
            end;
        end, 
        forceConsoleSafeInsets = l_FFlagDebugForceConsoleSafeInsets_0 and function() --[[ Line: 220 ]]
            -- upvalues: v21 (ref), v38 (copy)
            v21(v38());
        end or nil
    };
end;