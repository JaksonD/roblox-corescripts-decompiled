local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local v7 = {
    GuiBase2d = {
        "AbsolutePosition", 
        "AbsoluteRotation", 
        "AbsoluteSize", 
        "AutoLocalize", 
        "ClippedRect", 
        "IsNotOccluded", 
        "RawRect2D", 
        "ReplicatedInsertionOrder", 
        "RootLocalizationTable", 
        "SelectionBehaviorDown", 
        "SelectionBehaviorLeft", 
        "SelectionBehaviorRight", 
        "SelectionBehaviorUp", 
        "SelectionGroup", 
        "TotalGroupScale"
    }, 
    GuiObject = {
        "Active", 
        "AnchorPoint", 
        "AutomaticSize", 
        "BackgroundColor", 
        "BackgroundColor3", 
        "BackgroundTransparency", 
        "BorderColor", 
        "BorderColor3", 
        "BorderMode", 
        "BorderSizePixel", 
        "ClipsDescendants", 
        "Draggable", 
        "GuiState", 
        "Interactable", 
        "LayoutOrder", 
        "NextSelectionDown", 
        "NextSelectionLeft", 
        "NextSelectionRight", 
        "NextSelectionUp", 
        "Position", 
        "Rotation", 
        "Selectable", 
        "SelectionImageObject", 
        "SelectionOrder", 
        "SelectionRect2D", 
        "Size", 
        "SizeConstraint", 
        "Transparency", 
        "Visible", 
        "ZIndex"
    }, 
    TextLabel = {
        "Confidential", 
        "ContentText", 
        "Font", 
        "FontFace", 
        "LineHeight", 
        "LocalizationMatchIdentifier", 
        "LocalizationMatchedSourceText", 
        "LocalizedText", 
        "MaxVisibleGraphemes", 
        "OpenTypeFeatures", 
        "OpenTypeFeaturesError", 
        "RichText", 
        "Text", 
        "TextBounds", 
        "TextColor3", 
        "TextDirection", 
        "TextFits", 
        "TextScaled", 
        "TextSize", 
        "TextStrokeColor3", 
        "TextStrokeTransparency", 
        "TextTransparency", 
        "TextTruncate", 
        "TextWrapped", 
        "TextXAlignment", 
        "TextYAlignment"
    }, 
    TextButton = {
        "Confidential", 
        "ContentText", 
        "Font", 
        "FontFace", 
        "LineHeight", 
        "LocalizationMatchIdentifier", 
        "LocalizationMatchedSourceText", 
        "LocalizedText", 
        "MaxVisibleGraphemes", 
        "OpenTypeFeatures", 
        "OpenTypeFeaturesError", 
        "RichText", 
        "Text", 
        "TextBounds", 
        "TextColor3", 
        "TextDirection", 
        "TextFits", 
        "TextScaled", 
        "TextSize", 
        "TextStrokeColor3", 
        "TextStrokeTransparency", 
        "TextTransparency", 
        "TextTruncate", 
        "TextWrapped", 
        "TextXAlignment", 
        "TextYAlignment"
    }, 
    TextBox = {
        "ClearTextOnFocus", 
        "Confidential", 
        "ContentText", 
        "CursorPosition", 
        "Font", 
        "FontFace", 
        "LineHeight", 
        "LocalizationMatchIdentifier", 
        "LocalizationMatchedSourceText", 
        "LocalizedText", 
        "ManualFocusRelease", 
        "MaxVisibleGraphemes", 
        "MultiLine", 
        "OpenTypeFeatures", 
        "OpenTypeFeaturesError", 
        "OverlayNativeInput", 
        "PlaceholderColor3", 
        "PlaceholderText", 
        "ReturnKeyType", 
        "RichText", 
        "SelectionStart", 
        "ShouldEmitReturnEvents", 
        "ShouldEmitUpAndDownArrowEvents", 
        "ShowNativeInput", 
        "Text", 
        "TextBounds", 
        "TextColor3", 
        "TextDirection", 
        "TextEditable", 
        "TextFits", 
        "TextInputType", 
        "TextScaled", 
        "TextSize", 
        "TextStrokeColor3", 
        "TextStrokeTransparency", 
        "TextTransparency", 
        "TextTruncate", 
        "TextWrapped", 
        "TextXAlignment", 
        "TextYAlignment"
    }, 
    ImageLabel = {
        "BackgroundTransparency", 
        "ContentImageSize", 
        "Image", 
        "ImageColor3", 
        "ImageRectOffset", 
        "ImageRectSize", 
        "ImageTransparency", 
        "IsLoaded", 
        "ResampleMode", 
        "ScaleType", 
        "SliceCenter", 
        "SliceScale", 
        "TileSize"
    }, 
    ImageButton = {
        "BackgroundTransparency", 
        "ContentImageSize", 
        "HoverImage", 
        "Image", 
        "ImageColor3", 
        "ImageRectOffset", 
        "ImageRectSize", 
        "ImageTransparency", 
        "IsLoaded", 
        "PressedImage", 
        "ResampleMode", 
        "ScaleType", 
        "SliceCenter", 
        "SliceScale", 
        "TileSize"
    }, 
    Frame = {
        "BackgroundTransparency", 
        "Style"
    }, 
    ScrollingFrame = {
        "AbsoluteCanvasSize", 
        "AbsoluteWindowSize", 
        "AutomaticCanvasSize", 
        "BottomImage", 
        "CanvasPosition", 
        "CanvasSize", 
        "DraggingScrollBar", 
        "ElasticBehavior", 
        "HorizontalScrollBarInset", 
        "HorizontalScrollBarPosition", 
        "MidImage", 
        "ScrollBarImageColor3", 
        "ScrollBarImageTransparency", 
        "ScrollBarThickness", 
        "ScrollRate", 
        "ScrollVelocity", 
        "ScrollingDirection", 
        "ScrollingEnabled", 
        "SmoothScroll", 
        "TopImage", 
        "VerticalScrollBarInset", 
        "VerticalScrollBarPosition"
    }, 
    LayerCollector = {
        "Enabled", 
        "ResetOnSpawn", 
        "ZIndexBehavior"
    }
};
local function v35(v8, v9) --[[ Line: 217 ]] --[[ Name: getProperty ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 218 ]]
        -- upvalues: v8 (copy), v9 (copy)
        return v8[v9];
    end);
    if not l_status_0 or l_result_0 == nil then
        return nil;
    else
        local function _(v12) --[[ Line: 226 ]] --[[ Name: handleInf ]]
            if v12 == 1e999 then
                return "inf";
            elseif v12 == -1e999 then
                return "-inf";
            else
                return v12;
            end;
        end;
        if typeof(l_result_0) == "Vector2" then
            local v14 = {};
            local l_X_0 = l_result_0.X;
            local v16 = l_X_0 == 1e999 and "inf" or l_X_0 == -1e999 and "-inf" or l_X_0;
            local l_Y_0 = l_result_0.Y;
            l_X_0 = l_Y_0 == 1e999 and "inf" or l_Y_0 == -1e999 and "-inf" or l_Y_0;
            v6(v14, 1, v16, l_X_0);
            return v14;
        elseif typeof(l_result_0) == "Vector3" then
            local v18 = {};
            local l_X_1 = l_result_0.X;
            local v20 = l_X_1 == 1e999 and "inf" or l_X_1 == -1e999 and "-inf" or l_X_1;
            local l_Y_1 = l_result_0.Y;
            l_X_1 = l_Y_1 == 1e999 and "inf" or l_Y_1 == -1e999 and "-inf" or l_Y_1;
            local l_Z_0 = l_result_0.Z;
            l_Y_1 = l_Z_0 == 1e999 and "inf" or l_Z_0 == -1e999 and "-inf" or l_Z_0;
            v6(v18, 1, v20, l_X_1, l_Y_1);
            return v18;
        elseif typeof(l_result_0) == "Color3" then
            return {
                l_result_0.R, 
                l_result_0.G, 
                l_result_0.B
            };
        elseif typeof(l_result_0) == "UDim2" then
            local v23 = {};
            local l_Scale_0 = l_result_0.X.Scale;
            local v25 = l_Scale_0 == 1e999 and "inf" or l_Scale_0 == -1e999 and "-inf" or l_Scale_0;
            local l_Offset_0 = l_result_0.X.Offset;
            l_Scale_0 = l_Offset_0 == 1e999 and "inf" or l_Offset_0 == -1e999 and "-inf" or l_Offset_0;
            local l_Scale_1 = l_result_0.Y.Scale;
            l_Offset_0 = l_Scale_1 == 1e999 and "inf" or l_Scale_1 == -1e999 and "-inf" or l_Scale_1;
            local l_Offset_1 = l_result_0.Y.Offset;
            l_Scale_1 = l_Offset_1 == 1e999 and "inf" or l_Offset_1 == -1e999 and "-inf" or l_Offset_1;
            v6(v23, 1, v25, l_Scale_0, l_Offset_0, l_Scale_1);
            return v23;
        elseif typeof(l_result_0) == "Rect" then
            local v29 = {};
            local l_X_2 = l_result_0.Min.X;
            local v31 = l_X_2 == 1e999 and "inf" or l_X_2 == -1e999 and "-inf" or l_X_2;
            local l_Y_2 = l_result_0.Min.Y;
            l_X_2 = l_Y_2 == 1e999 and "inf" or l_Y_2 == -1e999 and "-inf" or l_Y_2;
            local l_X_3 = l_result_0.Max.X;
            l_Y_2 = l_X_3 == 1e999 and "inf" or l_X_3 == -1e999 and "-inf" or l_X_3;
            local l_Y_3 = l_result_0.Max.Y;
            l_X_3 = l_Y_3 == 1e999 and "inf" or l_Y_3 == -1e999 and "-inf" or l_Y_3;
            v6(v29, 1, v31, l_X_2, l_Y_2, l_X_3);
            return v29;
        elseif typeof(l_result_0) == "number" or typeof(l_result_0) == "boolean" then
            return l_result_0;
        else
            return (tostring(l_result_0));
        end;
    end;
end;
return function(v36, v37) --[[ Line: 273 ]] --[[ Name: getInstanceProperties ]]
    -- upvalues: v7 (copy), v35 (copy)
    if not v36 then
        return {};
    else
        local v38 = {
            ClassName = v36.ClassName, 
            Name = v36.Name
        };
        for v39, v40 in v7 do
            if v36:IsA(v39) then
                for _, v42 in v40 do
                    if v37 == nil or table.find(v37, v42) then
                        local v43 = v35(v36, v42);
                        if v43 ~= nil then
                            v38[v42] = v43;
                        end;
                    end;
                end;
            end;
        end;
        for _, v45 in (v36:GetTags()) do
            if string.sub(v45, 1, 12) == "data-testid=" then
                v38.TestId = string.sub(v45, 13);
            end;
        end;
        return v38;
    end;
end;