local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Misc.createSignal);
local v2 = require(l_Parent_0.strict);
local function _(v3, v4) --[[ Line: 7 ]] --[[ Name: makeImageData ]]
    return {
        Path = "rbxasset://textures/" .. v3, 
        SliceCenter = v4
    };
end;
local v6 = {
    __tostring = function() --[[ Line: 15 ]]
        return "Service(LayoutValues)";
    end
};
v6.new = function(v7) --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy), v1 (copy)
    local v8 = {};
    setmetatable(v8, {
        __index = v6
    });
    v8.signal = v1();
    v8.layout = v8:generate(v7);
    return v8;
end;
v6.update = function(v9, v10) --[[ Line: 31 ]] --[[ Name: update ]]
    v9.layout = v9:generate(v10);
    v9.signal:fire(v9.layout);
end;
v6.generate = function(_, v12) --[[ Line: 36 ]] --[[ Name: generate ]]
    -- upvalues: v2 (copy)
    local v13 = false;
    local v14 = false;
    local v15 = false;
    local v16 = false;
    local v17 = false;
    local v18 = false;
    local v19 = false;
    local v20 = false;
    local v21 = v12 and 3 or 1;
    local v22 = 44 * v21;
    local v23 = 30 * v21;
    local v24 = 6 * v21;
    local v25 = 16 * v21;
    local v26 = 18 * v21;
    local v27 = 210 * v21;
    local v28 = 106 * v21;
    local v29 = 96 * v21;
    local v30 = 20 * v21;
    local v31 = 25 * v21;
    local v32 = 2 * v21;
    local v33 = 64 * v21;
    local v34 = 64 * v21;
    local v35 = 3 * v21;
    local v36 = 2 * v21;
    local v37 = v33 + 2 * v32;
    local v38 = v34 + 2 * v32;
    local v39 = v37 + 2 * v31;
    local v40 = v38 + 2 * v31;
    local v41 = {
        AdditionalDetailsLabel = UDim2.new(1, 0, 0, v23), 
        ItemPreview = UDim2.new(0, v33, 0, v34), 
        ItemPreviewWhiteFrame = UDim2.new(0, v37, 0, v38), 
        ItemPreviewContainerFrame = UDim2.new(0, v39, 0, v40), 
        HorizontalPadding = v31, 
        ProductDescription = UDim2.new(0, v27, 0, v28), 
        ProductDescriptionPaddingTop = v26, 
        RobuxIconContainerFrame = UDim2.new(0, v25 + v24, 0, v25 + 2 * v24), 
        RobuxIcon = UDim2.new(0, v25, 0, v25), 
        PriceTextLabel = UDim2.new(0, v27 - (v25 + v24), 0, v25), 
        PurchasingAnimation = UDim2.new(0, v29, 0, v30), 
        ButtonIconPadding = v35, 
        ButtonIconYOffset = v36, 
        ButtonHeight = v22, 
        Dialog = UDim2.new(0, v39 + v27, 0, math.max(v40, v28) + v23 + v22)
    };
    local v42 = {
        Default = 18 * v21, 
        ProductDescription = 18 * v21, 
        Button = 24 * v21, 
        AdditionalDetails = 14 * v21, 
        Purchasing = 36 * v21
    };
    local v43 = {
        PriceLabel = Color3.new(1, 1, 1)
    };
    local v44 = {};
    local v45, v46;
    if v12 then
        v45 = Rect.new(17, 17, 19, 19);
        v46 = {
            Path = "rbxasset://textures/ui/PurchasePrompt/PurchasePromptBG@2x.png", 
            SliceCenter = v45
        };
        v13 = v46;
    end;
    if not v13 then
        v45 = Rect.new(8, 9, 10, 10);
        v46 = {
            Path = "rbxasset://textures/ui/PurchasePrompt/PurchasePromptBG.png", 
            SliceCenter = v45
        };
    end;
    v13 = false;
    v44.PromptBackground = v46;
    if v12 then
        v45 = Rect.new(17, 17, 19, 19);
        v46 = {
            Path = "rbxasset://textures/ui/PurchasePrompt/LoadingBG@2x.png", 
            SliceCenter = v45
        };
        v14 = v46;
    end;
    if not v14 then
        v45 = Rect.new(9, 9, 11, 11);
        v46 = {
            Path = "rbxasset://textures/ui/PurchasePrompt/LoadingBG.png", 
            SliceCenter = v45
        };
    end;
    v14 = false;
    v44.InProgressBackground = v46;
    if v12 then
        v45 = Rect.new(18, 5, 20, 7);
        v46 = {
            Path = "rbxasset://textures/ui/PurchasePrompt/LeftButton@2x.png", 
            SliceCenter = v45
        };
        v15 = v46;
    end;
    if not v15 then
        v45 = Rect.new(8, 3, 10, 4);
        v46 = {
            Path = "rbxasset://textures/ui/PurchasePrompt/LeftButton.png", 
            SliceCenter = v45
        };
    end;
    v15 = false;
    v44.ButtonUpLeft = v46;
    if v12 then
        v45 = Rect.new(18, 5, 20, 7);
        v46 = {
            Path = "rbxasset://textures/ui/PurchasePrompt/LeftButtonDown@2x.png", 
            SliceCenter = v45
        };
        v16 = v46;
    end;
    if not v16 then
        v45 = Rect.new(8, 3, 10, 4);
        v46 = {
            Path = "rbxasset://textures/ui/PurchasePrompt/LeftButtonDown.png", 
            SliceCenter = v45
        };
    end;
    v16 = false;
    v44.ButtonDownLeft = v46;
    if v12 then
        v45 = Rect.new(3, 5, 5, 7);
        v46 = {
            Path = "rbxasset://textures/ui/PurchasePrompt/RightButton@2x.png", 
            SliceCenter = v45
        };
        v17 = v46;
    end;
    if not v17 then
        v45 = Rect.new(2, 3, 3, 4);
        v46 = {
            Path = "rbxasset://textures/ui/PurchasePrompt/RightButton.png", 
            SliceCenter = v45
        };
    end;
    v17 = false;
    v44.ButtonUpRight = v46;
    if v12 then
        v45 = Rect.new(3, 5, 5, 7);
        v46 = {
            Path = "rbxasset://textures/ui/PurchasePrompt/RightButtonDown@2x.png", 
            SliceCenter = v45
        };
        v18 = v46;
    end;
    if not v18 then
        v45 = Rect.new(2, 3, 3, 4);
        v46 = {
            Path = "rbxasset://textures/ui/PurchasePrompt/RightButtonDown.png", 
            SliceCenter = v45
        };
    end;
    v18 = false;
    v44.ButtonDownRight = v46;
    if v12 then
        v45 = Rect.new(18, 5, 20, 7);
        v46 = {
            Path = "rbxasset://textures/ui/PurchasePrompt/SingleButton@2x.png", 
            SliceCenter = v45
        };
        v19 = v46;
    end;
    if not v19 then
        v45 = Rect.new(8, 3, 10, 4);
        v46 = {
            Path = "rbxasset://textures/ui/PurchasePrompt/SingleButton.png", 
            SliceCenter = v45
        };
    end;
    v19 = false;
    v44.ButtonUp = v46;
    if v12 then
        v45 = Rect.new(18, 5, 20, 7);
        v46 = {
            Path = "rbxasset://textures/ui/PurchasePrompt/SingleButtonDown@2x.png", 
            SliceCenter = v45
        };
        v20 = v46;
    end;
    if not v20 then
        v45 = Rect.new(8, 3, 10, 4);
        v46 = {
            Path = "rbxasset://textures/ui/PurchasePrompt/SingleButtonDown.png", 
            SliceCenter = v45
        };
    end;
    v20 = false;
    v44.ButtonDown = v46;
    v44.PremiumIcon = {
        Path = "rbxasset://textures/ui/PurchasePrompt/Premium.png", 
        SliceCenter = nil
    };
    v44.RobuxIcon = v12 and {
        Path = "rbxasset://textures/ui/common/robux_small@2x.png", 
        SliceCenter = nil
    } or {
        Path = "rbxasset://textures/ui/common/robux_small.png", 
        SliceCenter = nil
    };
    v44.ErrorIcon = v12 and {
        Path = "rbxasset://textures/ui/ErrorIcon.png", 
        SliceCenter = nil
    } or {
        Path = "rbxasset://textures/ui/ErrorIcon.png", 
        SliceCenter = nil
    };
    v44.ButtonA = v12 and {
        Path = "rbxasset://textures/ui/Settings/Help/AButtonDark@2x.png", 
        SliceCenter = nil
    } or {
        Path = "rbxasset://textures/ui/Settings/Help/AButtonDark.png", 
        SliceCenter = nil
    };
    v44.ButtonB = v12 and {
        Path = "rbxasset://textures/ui/Settings/Help/BButtonDark@2x.png", 
        SliceCenter = nil
    } or {
        Path = "rbxasset://textures/ui/Settings/Help/BButtonDark.png", 
        SliceCenter = nil
    };
    return (v2({
        Size = v2(v41, "LayoutValues.Size"), 
        TextSize = v2(v42, "LayoutValues.TextSize"), 
        TextColor = v2(v43, "LayoutValues.TextColor"), 
        Image = v2(v44, "LayoutValues.Image")
    }, "LayoutValues"));
end;
return v6;