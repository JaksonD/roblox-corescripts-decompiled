local v0 = require(script.Responsive);
local v1 = require(script.Parent.React);
local v2 = require(script.CommonConfigs.StandardBreakpoints);
local v3 = require(script.Context.ContainerRef);
local v4 = require(script.FindFirstAncestorWithTag);
local v5 = require(script.Hooks.useResponsiveImpl);
local v6 = require(script.InputMode);
local v7 = require(script.HardwareSafeAreaInsets);
local v8 = require(script.Hooks.useDeviceInsets);
local v9 = require(script.Stores.GetInputModeStore);
local v10 = require(script.Hooks.useIsInFullScreen);
local v11 = require(script.Hooks.useIsSpatial);
local v12 = require(script.Hooks.useLastInput);
local v13 = require(script.Hooks.usePreferredInput);
local v14 = require(script.getVirtualResolutionScale);
breakpointCompare = function(v15, v16) --[[ Line: 23 ]] --[[ Name: breakpointCompare ]]
    -- upvalues: v2 (copy), v0 (copy)
    local l_keyIndex_0 = v2.keyIndex;
    if v15 == v0.DefaultKey or v16 == v0.DefaultKey or l_keyIndex_0[v15] == nil or l_keyIndex_0[v16] == nil then
        return false;
    else
        return l_keyIndex_0[v15] >= l_keyIndex_0[v16];
    end;
end;
ResponsiveProvider = function(v18) --[[ Line: 31 ]] --[[ Name: ResponsiveProvider ]]
    -- upvalues: v1 (copy), v3 (copy)
    local v19 = v1.useRef(nil);
    return v1.createElement(v3.Provider, {
        value = v19
    }, v18.children);
end;
return {
    HardwareSafeAreaInsets = v7, 
    useDeviceInsets = v8, 
    Keys = v2.Enum, 
    Input = v6.Enum, 
    BreakpointConfig = v2, 
    DefaultKey = v0.DefaultKey, 
    ContainerRef = v3, 
    ResponsiveProvider = ResponsiveProvider, 
    ResponsiveContainerFrame = function(v20) --[[ Line: 38 ]] --[[ Name: ResponsiveContainerFrame ]]
        -- upvalues: v1 (copy), v3 (copy)
        local v21 = v1.useContext(v3);
        return v1.createElement("Frame", {
            ZIndex = if v20 and v20.ZIndex then v20.ZIndex else -100, 
            Size = if v20 and v20.Size then v20.Size else UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            Visible = false, 
            ref = v21
        });
    end, 
    FindFirstAncestorWithTag = v4, 
    useBreakpointX = v5, 
    useBreakpointXOrLarger = function(v22) --[[ Line: 61 ]] --[[ Name: useBreakpointXOrLarger ]]
        -- upvalues: v5 (copy)
        return v5(function(v23) --[[ Line: 62 ]]
            -- upvalues: v22 (copy)
            return breakpointCompare(v23, v22);
        end, nil);
    end, 
    useBreakpointXOrSmaller = function(v24) --[[ Line: 66 ]] --[[ Name: useBreakpointXOrSmaller ]]
        -- upvalues: v5 (copy)
        return v5(function(v25) --[[ Line: 67 ]]
            -- upvalues: v24 (copy)
            return breakpointCompare(v24, v25);
        end, nil);
    end, 
    useBreakpointY = function() --[[ Line: 71 ]] --[[ Name: useBreakpointY ]]
        -- upvalues: v5 (copy)
        return v5(nil, nil, "Y");
    end, 
    useBreakpointYOrLarger = function(v26) --[[ Line: 74 ]] --[[ Name: useBreakpointYOrLarger ]]
        -- upvalues: v5 (copy)
        return v5(function(v27) --[[ Line: 75 ]]
            -- upvalues: v26 (copy)
            return breakpointCompare(v27, v26);
        end, nil, "Y");
    end, 
    useBreakpointYOrSmaller = function(v28) --[[ Line: 79 ]] --[[ Name: useBreakpointYOrSmaller ]]
        -- upvalues: v5 (copy)
        return v5(function(v29) --[[ Line: 80 ]]
            -- upvalues: v28 (copy)
            return breakpointCompare(v28, v29);
        end, nil, "Y");
    end, 
    useOrientation = function() --[[ Line: 84 ]] --[[ Name: useOrientation ]]
        -- upvalues: v5 (copy)
        return v5(nil, nil, "Orientation");
    end, 
    useResponsive = function(v30) --[[ Line: 87 ]] --[[ Name: useResponsive ]]
        -- upvalues: v5 (copy)
        return v5(nil, v30);
    end, 
    usePreferredInput = v13, 
    useLastInput = v12, 
    useIsInFullScreen = v10, 
    useIsSpatial = v11, 
    bindContainer = v0.bindContainer, 
    ["jest.config"] = script["jest.config"], 
    getVirtualResolutionScale = v14, 
    GetInputModeStore = v9
};