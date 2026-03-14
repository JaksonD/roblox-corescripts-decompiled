local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local v3 = require(l_CorePackages_0.Packages.React);
local l_Parent_0 = script.Parent.Parent.Parent;
local v5 = require(l_Parent_0.Flags.GetFIntRAMaxAnnotationCount);
local l_ImageSetButton_0 = v2.Core.ImageSet.ImageSetButton;
local l_Images_0 = v2.App.ImageSet.Images;
return function(v8) --[[ Line: 24 ]] --[[ Name: ScreenshotHighlighter ]]
    -- upvalues: l_RobloxGui_0 (copy), v3 (copy), v5 (copy), l_ImageSetButton_0 (copy), l_Images_0 (copy)
    local l_AbsoluteSize_0 = l_RobloxGui_0.AbsoluteSize;
    local v10 = (l_AbsoluteSize_0.Y > l_AbsoluteSize_0.X and l_AbsoluteSize_0.X or l_AbsoluteSize_0.Y) / 5;
    local v11, v12 = v3.useState(false);
    local function v17(v13, v14) --[[ Line: 34 ]]
        -- upvalues: v8 (copy), v10 (copy)
        local v15 = (Vector2.new(v14.X, v14.Y) - v13.AbsolutePosition) / v13.AbsoluteSize;
        table.insert(v8.annotationPoints, v15);
        local v16 = if v13.AbsoluteSize.X > v13.AbsoluteSize.Y then v13.AbsoluteSize.X else v13.AbsoluteSize.Y;
        v8.setAnnotationCircleRadius(v10 * 0.5 / v16);
        v8.setAspectRatioDimensions(v13.AbsoluteSize.X, v13.AbsoluteSize.Y);
        v8.handleAnnotationPoints(v8.annotationPoints);
    end;
    local function v23(v18, v19) --[[ Line: 46 ]]
        -- upvalues: v8 (copy), v5 (ref), v12 (copy), v17 (copy)
        local v20 = v19.UserInputState == Enum.UserInputState.Begin;
        local v21 = v19.UserInputType == Enum.UserInputType.Touch;
        local v22 = v19.UserInputType == Enum.UserInputType.MouseButton1;
        if v20 and (v21 or v22) and #v8.annotationPoints < v5() then
            v12(true);
            v17(v18, v19.Position);
        end;
    end;
    local function v26(_, _) --[[ Line: 56 ]]
        -- upvalues: v17 (copy)
    end;
    local function v29(_, _) --[[ Line: 68 ]]
        -- upvalues: v11 (copy), v12 (copy)
        if v11 then
            v12(false);
        end;
    end;
    local v30 = {};
    for v31, v32 in ipairs(v8.annotationPoints) do
        v30["point" .. v31] = v3.createElement("Frame", {
            Position = UDim2.fromScale(v32.X, v32.Y), 
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(v10, v10)
        }, {
            Border = v3.createElement(l_ImageSetButton_0, {
                Size = UDim2.fromOffset(v10, v10), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = l_Images_0["component_assets/circle_49_stroke_1"], 
                ImageColor3 = Color3.fromHex("#3CF3E9"), 
                ImageTransparency = 0, 
                BackgroundTransparency = 1
            }), 
            Background = v3.createElement(l_ImageSetButton_0, {
                Size = UDim2.fromOffset(v10, v10), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = l_Images_0["component_assets/circle_49"], 
                ImageColor3 = Color3.fromHex("#3CF3E9"), 
                ImageTransparency = 0.6, 
                BackgroundTransparency = 1
            })
        });
    end;
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        [v3.Event.InputBegan] = v23, 
        [v3.Event.InputChanged] = v26, 
        [v3.Event.InputEnded] = v29, 
        ZIndex = 3
    }, v30);
end;