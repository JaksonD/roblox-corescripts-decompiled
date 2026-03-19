local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent;
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_Parent_0.Dash);
local v3 = require(script.Parent.Parent.UnifiedEventLogConstants);
local l_FFlagAXAddLookTypeEnumForLogging_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXAddLookTypeEnumForLogging;
local v5 = game:DefineFastFlag("AXConsoleScreenSizeFix", false);
local v6 = {};
local function v7(v8, v9) --[[ Line: 15 ]] --[[ Name: getParentScrollingFrames ]]
    -- upvalues: v7 (copy)
    if not v9 then
        v9 = {};
    end;
    local l_v8_FirstAncestorWhichIsA_0 = v8:FindFirstAncestorWhichIsA("ScrollingFrame");
    if not l_v8_FirstAncestorWhichIsA_0 then
        return v9;
    else
        table.insert(v9, l_v8_FirstAncestorWhichIsA_0);
        return v7(l_v8_FirstAncestorWhichIsA_0, v9);
    end;
end;
v6.getUnifiedLoggingFieldName = function(v11) --[[ Line: 29 ]] --[[ Name: getUnifiedLoggingFieldName ]]
    -- upvalues: v3 (copy)
    return v11:sub(string.len(v3.ATTRIBUTE_PREFIX) + 1, (string.len(v11)));
end;
v6.isUnifiedLoggingAttribute = function(v12) --[[ Line: 34 ]] --[[ Name: isUnifiedLoggingAttribute ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v2.startsWith(v12, v3.ATTRIBUTE_PREFIX);
end;
if l_FFlagAXAddLookTypeEnumForLogging_0 then
    v6.formatLookTypeAttribute = function(v13) --[[ Line: 39 ]] --[[ Name: formatLookTypeAttribute ]]
        return string.upper("LOOK_TYPE_" .. v13);
    end;
end;
v6.getElementSizeAndPosition = function(v14) --[[ Line: 44 ]] --[[ Name: getElementSizeAndPosition ]]
    -- upvalues: v7 (copy)
    local l_X_0 = v14.AbsolutePosition.X;
    local l_Y_0 = v14.AbsolutePosition.Y;
    local v17 = nil or {};
    local l_v14_FirstAncestorWhichIsA_0 = v14:FindFirstAncestorWhichIsA("ScrollingFrame");
    local v19;
    if not l_v14_FirstAncestorWhichIsA_0 then
        v19 = v17;
    else
        table.insert(v17, l_v14_FirstAncestorWhichIsA_0);
        v19 = v7(l_v14_FirstAncestorWhichIsA_0, v17);
    end;
    if v19 then
        for _, v21 in v19 do
            l_X_0 = l_X_0 + v21.CanvasPosition.X;
            l_Y_0 = l_Y_0 + v21.CanvasPosition.Y;
        end;
    end;
    return {
        elementSizeWidth = math.round(v14.AbsoluteSize.X), 
        elementSizeHeight = math.round(v14.AbsoluteSize.Y), 
        elementCoordinatesX = math.round(v14.AbsolutePosition.X), 
        elementCoordinatesY = math.round(v14.AbsolutePosition.Y), 
        elementRelativePositionX = math.round(l_X_0), 
        elementRelativePositionY = math.round(l_Y_0)
    };
end;
v6.getScreenSize = function(v22) --[[ Line: 65 ]] --[[ Name: getScreenSize ]]
    -- upvalues: l_CoreGui_0 (copy), v5 (copy)
    local v23 = nil;
    local l_v22_FirstAncestorOfClass_0 = v22:FindFirstAncestorOfClass("ScreenGui");
    if l_v22_FirstAncestorOfClass_0 and l_v22_FirstAncestorOfClass_0:IsA("ScreenGui") then
        v23 = l_v22_FirstAncestorOfClass_0;
    else
        local l_LuaAppScreenGui_0 = l_CoreGui_0:FindFirstChild("LuaAppScreenGui");
        local v26 = if l_LuaAppScreenGui_0 then l_LuaAppScreenGui_0:FindFirstChild("MainAppScreen_SurfaceGui") else nil;
        if v26 and v26:IsA("SurfaceGui") then
            v23 = v26;
        elseif v5 then
            local l_TenFootUiSurfaceGuiFolder_0 = l_CoreGui_0:FindFirstChild("TenFootUiSurfaceGuiFolder");
            local v28 = if l_TenFootUiSurfaceGuiFolder_0 then l_TenFootUiSurfaceGuiFolder_0:FindFirstChild("RootViewSurface_SurfaceGui") else nil;
            if v28 and v28:IsA("SurfaceGui") then
                v23 = v28;
            end;
        end;
    end;
    return {
        screenSizeWidth = if v23 and v23.AbsoluteSize then math.round(v23.AbsoluteSize.X) else nil, 
        screenSizeHeight = if v23 and v23.AbsoluteSize then math.round(v23.AbsoluteSize.Y) else nil
    };
end;
return v6;