local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent;
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_Parent_0.Dash);
local v3 = require(script.Parent.Parent.UnifiedEventLogConstants);
local v4 = game:DefineFastFlag("AXConsoleScreenSizeFix", false);
local v5 = {};
local function v6(v7, v8) --[[ Line: 13 ]] --[[ Name: getParentScrollingFrames ]]
    -- upvalues: v6 (copy)
    if not v8 then
        v8 = {};
    end;
    local l_v7_FirstAncestorWhichIsA_0 = v7:FindFirstAncestorWhichIsA("ScrollingFrame");
    if not l_v7_FirstAncestorWhichIsA_0 then
        return v8;
    else
        table.insert(v8, l_v7_FirstAncestorWhichIsA_0);
        return v6(l_v7_FirstAncestorWhichIsA_0, v8);
    end;
end;
v5.getUnifiedLoggingFieldName = function(v10) --[[ Line: 27 ]] --[[ Name: getUnifiedLoggingFieldName ]]
    -- upvalues: v3 (copy)
    return v10:sub(string.len(v3.ATTRIBUTE_PREFIX) + 1, (string.len(v10)));
end;
v5.isUnifiedLoggingAttribute = function(v11) --[[ Line: 32 ]] --[[ Name: isUnifiedLoggingAttribute ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v2.startsWith(v11, v3.ATTRIBUTE_PREFIX);
end;
v5.getElementSizeAndPosition = function(v12) --[[ Line: 36 ]] --[[ Name: getElementSizeAndPosition ]]
    -- upvalues: v6 (copy)
    local l_X_0 = v12.AbsolutePosition.X;
    local l_Y_0 = v12.AbsolutePosition.Y;
    local v15 = nil or {};
    local l_v12_FirstAncestorWhichIsA_0 = v12:FindFirstAncestorWhichIsA("ScrollingFrame");
    local v17;
    if not l_v12_FirstAncestorWhichIsA_0 then
        v17 = v15;
    else
        table.insert(v15, l_v12_FirstAncestorWhichIsA_0);
        v17 = v6(l_v12_FirstAncestorWhichIsA_0, v15);
    end;
    if v17 then
        for _, v19 in v17 do
            l_X_0 = l_X_0 + v19.CanvasPosition.X;
            l_Y_0 = l_Y_0 + v19.CanvasPosition.Y;
        end;
    end;
    return {
        elementSizeWidth = math.round(v12.AbsoluteSize.X), 
        elementSizeHeight = math.round(v12.AbsoluteSize.Y), 
        elementCoordinatesX = math.round(v12.AbsolutePosition.X), 
        elementCoordinatesY = math.round(v12.AbsolutePosition.Y), 
        elementRelativePositionX = math.round(l_X_0), 
        elementRelativePositionY = math.round(l_Y_0)
    };
end;
v5.getScreenSize = function(v20) --[[ Line: 57 ]] --[[ Name: getScreenSize ]]
    -- upvalues: l_CoreGui_0 (copy), v4 (copy)
    local v21 = nil;
    local l_v20_FirstAncestorOfClass_0 = v20:FindFirstAncestorOfClass("ScreenGui");
    if l_v20_FirstAncestorOfClass_0 and l_v20_FirstAncestorOfClass_0:IsA("ScreenGui") then
        v21 = l_v20_FirstAncestorOfClass_0;
    else
        local l_LuaAppScreenGui_0 = l_CoreGui_0:FindFirstChild("LuaAppScreenGui");
        local v24 = if l_LuaAppScreenGui_0 then l_LuaAppScreenGui_0:FindFirstChild("MainAppScreen_SurfaceGui") else nil;
        if v24 and v24:IsA("SurfaceGui") then
            v21 = v24;
        elseif v4 then
            local l_TenFootUiSurfaceGuiFolder_0 = l_CoreGui_0:FindFirstChild("TenFootUiSurfaceGuiFolder");
            local v26 = if l_TenFootUiSurfaceGuiFolder_0 then l_TenFootUiSurfaceGuiFolder_0:FindFirstChild("RootViewSurface_SurfaceGui") else nil;
            if v26 and v26:IsA("SurfaceGui") then
                v21 = v26;
            end;
        end;
    end;
    return {
        screenSizeWidth = if v21 and v21.AbsoluteSize then math.round(v21.AbsoluteSize.X) else nil, 
        screenSizeHeight = if v21 and v21.AbsoluteSize then math.round(v21.AbsoluteSize.Y) else nil
    };
end;
return v5;