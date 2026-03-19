local l_script_FirstAncestor_0 = script:FindFirstAncestor("InGameAssetReporting");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local l_ImageSetButton_0 = v4.Core.ImageSet.ImageSetButton;
local l_Images_0 = v4.App.ImageSet.Images;
return function(v7) --[[ Line: 25 ]] --[[ Name: ScreenshotHighlighter ]]
    -- upvalues: l_RobloxGui_0 (copy), v3 (copy), l_ImageSetButton_0 (copy), l_Images_0 (copy)
    local l_AbsoluteSize_0 = l_RobloxGui_0.AbsoluteSize;
    local v9 = (l_AbsoluteSize_0.Y > l_AbsoluteSize_0.X and l_AbsoluteSize_0.X or l_AbsoluteSize_0.Y) / 5;
    local v10, v11 = v3.useState(false);
    local function v17(v12, v13) --[[ Line: 35 ]]
        -- upvalues: v9 (copy), v7 (copy)
        local v14 = (Vector2.new(v13.X, v13.Y) - v12.AbsolutePosition) / v12.AbsoluteSize;
        local v15 = if v12.AbsoluteSize.X > v12.AbsoluteSize.Y then v12.AbsoluteSize.X else v12.AbsoluteSize.Y;
        local v16 = v9 * 0.5 / v15;
        v7.handleNewAnnotationPoint(v14, v16);
    end;
    local function v23(v18, v19) --[[ Line: 45 ]]
        -- upvalues: v7 (copy), v11 (copy), v17 (copy)
        local v20 = v19.UserInputState == Enum.UserInputState.Begin;
        local v21 = v19.UserInputType == Enum.UserInputType.Touch;
        local v22 = v19.UserInputType == Enum.UserInputType.MouseButton1;
        if v20 and (v21 or v22) then
            if #v7.annotationPoints < 5 then
                v11(true);
                v17(v18, v19.Position);
                return;
            else
                v7.onExceedMaxAnnotationLimit();
            end;
        end;
    end;
    local function v26(_, _) --[[ Line: 59 ]]
        -- upvalues: v17 (copy)
    end;
    local function v29(_, _) --[[ Line: 71 ]]
        -- upvalues: v10 (copy), v11 (copy)
        if v10 then
            v11(false);
        end;
    end;
    local v30 = {};
    for v31, v32 in ipairs(v7.annotationPoints) do
        v30["point" .. v31] = v3.createElement("Frame", {
            Position = UDim2.fromScale(v32.X, v32.Y), 
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(v9, v9)
        }, {
            Border = v3.createElement(l_ImageSetButton_0, {
                Size = UDim2.fromOffset(v9, v9), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = l_Images_0["component_assets/circle_49_stroke_1"], 
                ImageColor3 = Color3.fromHex("#3CF3E9"), 
                ImageTransparency = 0, 
                BackgroundTransparency = 1
            }), 
            Background = v3.createElement(l_ImageSetButton_0, {
                Size = UDim2.fromOffset(v9, v9), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = l_Images_0["component_assets/circle_49"], 
                ImageColor3 = Color3.fromHex("#3CF3E9"), 
                ImageTransparency = 0.6, 
                BackgroundTransparency = 1
            })
        });
    end;
    return v3.createElement("Frame", {
        Active = false, 
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        [v3.Event.InputBegan] = v23, 
        [v3.Event.InputChanged] = v26, 
        [v3.Event.InputEnded] = v29, 
        ZIndex = 3
    }, v30);
end;