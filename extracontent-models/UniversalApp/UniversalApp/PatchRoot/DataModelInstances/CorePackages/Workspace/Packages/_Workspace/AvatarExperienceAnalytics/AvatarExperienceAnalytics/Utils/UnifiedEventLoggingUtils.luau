local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent;
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_Parent_0.Dash);
local v3 = require(script.Parent.Parent.UnifiedEventLogConstants);
local v4 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXAddLookTypeEnumForLogging_0 = v4.FFlagAXAddLookTypeEnumForLogging;
local l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 = v4.FFlagAXMISEnableMultiShoppingUnifiedEvents;
local v7 = {};
local function v8(v9, v10) --[[ Line: 15 ]] --[[ Name: getParentScrollingFrames ]]
    -- upvalues: v8 (copy)
    if not v10 then
        v10 = {};
    end;
    local l_v9_FirstAncestorWhichIsA_0 = v9:FindFirstAncestorWhichIsA("ScrollingFrame");
    if not l_v9_FirstAncestorWhichIsA_0 then
        return v10;
    else
        table.insert(v10, l_v9_FirstAncestorWhichIsA_0);
        return v8(l_v9_FirstAncestorWhichIsA_0, v10);
    end;
end;
v7.getUnifiedLoggingFieldName = function(v12) --[[ Line: 29 ]] --[[ Name: getUnifiedLoggingFieldName ]]
    -- upvalues: v3 (copy)
    return v12:sub(string.len(v3.ATTRIBUTE_PREFIX) + 1, (string.len(v12)));
end;
v7.isUnifiedLoggingAttribute = function(v13) --[[ Line: 34 ]] --[[ Name: isUnifiedLoggingAttribute ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v2.startsWith(v13, v3.ATTRIBUTE_PREFIX);
end;
if l_FFlagAXAddLookTypeEnumForLogging_0 then
    v7.formatLookTypeAttribute = function(v14) --[[ Line: 39 ]] --[[ Name: formatLookTypeAttribute ]]
        return string.upper("LOOK_TYPE_" .. v14);
    end;
end;
if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then
    v7.getFieldsToSendFromInstanceAttributes = function(v15) --[[ Line: 45 ]] --[[ Name: getFieldsToSendFromInstanceAttributes ]]
        -- upvalues: v7 (copy)
        local v16 = {};
        if v15 then
            for v17, v18 in v15 do
                if v7.isUnifiedLoggingAttribute(v17) then
                    v16[v7.getUnifiedLoggingFieldName(v17)] = v18;
                end;
            end;
        end;
        return v16;
    end;
end;
v7.getElementSizeAndPosition = function(v19) --[[ Line: 60 ]] --[[ Name: getElementSizeAndPosition ]]
    -- upvalues: v8 (copy)
    local l_X_0 = v19.AbsolutePosition.X;
    local l_Y_0 = v19.AbsolutePosition.Y;
    local v22 = nil or {};
    local l_v19_FirstAncestorWhichIsA_0 = v19:FindFirstAncestorWhichIsA("ScrollingFrame");
    local v24;
    if not l_v19_FirstAncestorWhichIsA_0 then
        v24 = v22;
    else
        table.insert(v22, l_v19_FirstAncestorWhichIsA_0);
        v24 = v8(l_v19_FirstAncestorWhichIsA_0, v22);
    end;
    if v24 then
        for _, v26 in v24 do
            l_X_0 = l_X_0 + v26.CanvasPosition.X;
            l_Y_0 = l_Y_0 + v26.CanvasPosition.Y;
        end;
    end;
    return {
        elementSizeWidth = math.round(v19.AbsoluteSize.X), 
        elementSizeHeight = math.round(v19.AbsoluteSize.Y), 
        elementCoordinatesX = math.round(v19.AbsolutePosition.X), 
        elementCoordinatesY = math.round(v19.AbsolutePosition.Y), 
        elementRelativePositionX = math.round(l_X_0), 
        elementRelativePositionY = math.round(l_Y_0)
    };
end;
v7.getScreenSize = function(v27) --[[ Line: 81 ]] --[[ Name: getScreenSize ]]
    -- upvalues: l_CoreGui_0 (copy)
    local v28 = nil;
    local l_v27_FirstAncestorOfClass_0 = v27:FindFirstAncestorOfClass("ScreenGui");
    if l_v27_FirstAncestorOfClass_0 and l_v27_FirstAncestorOfClass_0:IsA("ScreenGui") then
        v28 = l_v27_FirstAncestorOfClass_0;
    else
        local l_LuaAppScreenGui_0 = l_CoreGui_0:FindFirstChild("LuaAppScreenGui");
        local v31 = if l_LuaAppScreenGui_0 then l_LuaAppScreenGui_0:FindFirstChild("MainAppScreen_SurfaceGui") else nil;
        if v31 and v31:IsA("SurfaceGui") then
            v28 = v31;
        else
            local l_TenFootUiSurfaceGuiFolder_0 = l_CoreGui_0:FindFirstChild("TenFootUiSurfaceGuiFolder");
            local v33 = if l_TenFootUiSurfaceGuiFolder_0 then l_TenFootUiSurfaceGuiFolder_0:FindFirstChild("RootViewSurface_SurfaceGui") else nil;
            if v33 and v33:IsA("SurfaceGui") then
                v28 = v33;
            end;
        end;
    end;
    return {
        screenSizeWidth = if v28 and v28.AbsoluteSize then math.round(v28.AbsoluteSize.X) else nil, 
        screenSizeHeight = if v28 and v28.AbsoluteSize then math.round(v28.AbsoluteSize.Y) else nil
    };
end;
return v7;