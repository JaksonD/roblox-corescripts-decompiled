local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_Parent_0.Roact);
local v9 = require(l_Parent_0.UIBlox);
local l_Images_0 = v9.App.ImageSet.Images;
local l_ImageSetLabel_0 = v9.Core.ImageSet.ImageSetLabel;
local l_Interactable_0 = v9.Core.Control.Interactable;
local v13 = require(l_Parent_0.RobloxTranslator);
local v14 = v13:FormatByKey("CoreScripts.Ads.Label.WhyThisAd");
local v15 = v13:FormatByKey("CoreScripts.Ads.Label.ReportAd");
local v16 = l_Images_0["icons/actions/info"];
local v17 = l_Images_0["icons/actions/feedback"];
local v18 = require(script.Parent.Flags).GetAdGuiInteractivityPixelsPerStud() / 50;
local function _(v19) --[[ Line: 20 ]] --[[ Name: applyScalingUDim ]]
    -- upvalues: v18 (copy)
    return UDim.new(v19.Scale, v19.Offset * v18);
end;
local function _(v21) --[[ Line: 24 ]] --[[ Name: applyScalingUDim2 ]]
    -- upvalues: v18 (copy)
    return UDim2.new(v21.X.Scale, v21.X.Offset * v18, v21.Y.Scale, v21.Y.Offset * v18);
end;
local function _(v23) --[[ Line: 28 ]] --[[ Name: applyScalingNumber ]]
    -- upvalues: v18 (copy)
    return v23 * v18;
end;
local function v34(v25) --[[ Line: 41 ]] --[[ Name: WhyThisAdRow ]]
    -- upvalues: v8 (copy), l_Interactable_0 (copy), v18 (copy), l_ImageSetLabel_0 (copy), v16 (copy), v14 (copy)
    local l_createElement_0 = v8.createElement;
    local l_l_Interactable_0_0 = l_Interactable_0;
    local v28 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        [v8.Event.Activated] = v25.onWhyThisAdActivated, 
        onStateChanged = function() --[[ Line: 46 ]] --[[ Name: onStateChanged ]]

        end
    };
    local v29 = {};
    local l_createElement_1 = v8.createElement;
    local v31 = "UICorner";
    local v32 = {};
    local v33 = UDim.new(0, 10);
    v32.CornerRadius = UDim.new(v33.Scale, v33.Offset * v18);
    v29.UICorner = l_createElement_1(v31, v32);
    l_createElement_1 = v8.createElement;
    v31 = "UIPadding";
    v32 = {};
    v33 = UDim.new(0, 16);
    v32.PaddingTop = UDim.new(v33.Scale, v33.Offset * v18);
    v33 = UDim.new(0, 8);
    v32.PaddingBottom = UDim.new(v33.Scale, v33.Offset * v18);
    v33 = UDim.new(0, 16);
    v32.PaddingLeft = UDim.new(v33.Scale, v33.Offset * v18);
    v33 = UDim.new(0, 48);
    v32.PaddingRight = UDim.new(v33.Scale, v33.Offset * v18);
    v29.UIPadding = l_createElement_1(v31, v32);
    l_createElement_1 = v8.createElement;
    v31 = "UIListLayout";
    v32 = {
        FillDirection = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    };
    v33 = UDim.new(0, 16);
    v32.Padding = UDim.new(v33.Scale, v33.Offset * v18);
    v29.UIListLayout = l_createElement_1(v31, v32);
    l_createElement_1 = v8.createElement;
    v31 = l_ImageSetLabel_0;
    v32 = {
        Image = v16
    };
    v33 = UDim2.fromOffset(24, 24);
    v32.Size = UDim2.new(v33.X.Scale, v33.X.Offset * v18, v33.Y.Scale, v33.Y.Offset * v18);
    v32.BackgroundTransparency = 1;
    v29.Icon = l_createElement_1(v31, v32);
    v29.TextLabel = v8.createElement("TextLabel", {
        Text = v14, 
        TextColor3 = Color3.new(1, 1, 1), 
        BackgroundTransparency = 1, 
        Font = Enum.Font.GothamMedium, 
        TextSize = 24 * v18, 
        TextScaled = false, 
        TextWrapped = true, 
        AutomaticSize = Enum.AutomaticSize.XY
    });
    return l_createElement_0(l_l_Interactable_0_0, v28, v29);
end;
local function v44(v35) --[[ Line: 81 ]] --[[ Name: ReportAdRow ]]
    -- upvalues: v8 (copy), l_Interactable_0 (copy), v18 (copy), l_ImageSetLabel_0 (copy), v17 (copy), v15 (copy)
    local l_createElement_2 = v8.createElement;
    local l_l_Interactable_0_1 = l_Interactable_0;
    local v38 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        [v8.Event.Activated] = v35.onReportAdActivated, 
        onStateChanged = function() --[[ Line: 86 ]] --[[ Name: onStateChanged ]]

        end
    };
    local v39 = {};
    local l_createElement_3 = v8.createElement;
    local v41 = "UICorner";
    local v42 = {};
    local v43 = UDim.new(0, 10);
    v42.CornerRadius = UDim.new(v43.Scale, v43.Offset * v18);
    v39.UICorner = l_createElement_3(v41, v42);
    l_createElement_3 = v8.createElement;
    v41 = "UIPadding";
    v42 = {};
    v43 = UDim.new(0, 8);
    v42.PaddingTop = UDim.new(v43.Scale, v43.Offset * v18);
    v43 = UDim.new(0, 16);
    v42.PaddingBottom = UDim.new(v43.Scale, v43.Offset * v18);
    v43 = UDim.new(0, 16);
    v42.PaddingLeft = UDim.new(v43.Scale, v43.Offset * v18);
    v43 = UDim.new(0, 48);
    v42.PaddingRight = UDim.new(v43.Scale, v43.Offset * v18);
    v39.UIPadding = l_createElement_3(v41, v42);
    l_createElement_3 = v8.createElement;
    v41 = "UIListLayout";
    v42 = {
        FillDirection = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    };
    v43 = UDim.new(0, 16);
    v42.Padding = UDim.new(v43.Scale, v43.Offset * v18);
    v39.UIListLayout = l_createElement_3(v41, v42);
    l_createElement_3 = v8.createElement;
    v41 = l_ImageSetLabel_0;
    v42 = {
        Image = v17
    };
    v43 = UDim2.fromOffset(24, 24);
    v42.Size = UDim2.new(v43.X.Scale, v43.X.Offset * v18, v43.Y.Scale, v43.Y.Offset * v18);
    v42.BackgroundTransparency = 1;
    v39.Icon = l_createElement_3(v41, v42);
    v39.TextLabel = v8.createElement("TextLabel", {
        Text = v15, 
        TextColor3 = Color3.new(1, 1, 1), 
        BackgroundTransparency = 1, 
        Font = Enum.Font.GothamMedium, 
        TextSize = 24 * v18, 
        TextScaled = false, 
        TextWrapped = true, 
        AutomaticSize = Enum.AutomaticSize.XY
    });
    return l_createElement_2(l_l_Interactable_0_1, v38, v39);
end;
AdDropdownMenu = function(v45) --[[ Line: 121 ]] --[[ Name: AdDropdownMenu ]]
    -- upvalues: v8 (copy), v18 (copy), v34 (copy), v44 (copy)
    local l_createElement_4 = v8.createElement;
    local v47 = "Frame";
    local v48 = {
        Visible = v45.showDropDownMenu, 
        Position = v45.Position or UDim2.new(0.5, 0, 0.5, 0), 
        BackgroundColor3 = Color3.new(0, 0, 0), 
        BackgroundTransparency = v45.transparency, 
        AnchorPoint = v45.AnchorPoint or Vector2.new(0.5, 0.5)
    };
    local v49 = UDim2.new(0.24, 0, 0.12, 0);
    v48.Size = UDim2.new(v49.X.Scale, v49.X.Offset * v18, v49.Y.Scale, v49.Y.Offset * v18);
    v48.AutomaticSize = Enum.AutomaticSize.XY;
    local v50 = {};
    local l_createElement_5 = v8.createElement;
    local v52 = "UICorner";
    local v53 = {};
    local v54 = UDim.new(0, 10);
    v53.CornerRadius = UDim.new(v54.Scale, v54.Offset * v18);
    v50.UICorner = l_createElement_5(v52, v53);
    v50.UIListLayout = v8.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    });
    v49 = v34(v45);
    v6(v50, 1, v49, v44(v45));
    return l_createElement_4(v47, v48, v50);
end;
return AdDropdownMenu;