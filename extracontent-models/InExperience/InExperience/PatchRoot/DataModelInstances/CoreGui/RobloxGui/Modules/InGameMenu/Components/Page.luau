local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_UIBlox_0 = v1.UIBlox;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_Parent_0 = script.Parent.Parent;
local v9 = require(l_Parent_0.Thunks.NavigateUp);
local v10 = require(l_Parent_0.Resources.Assets);
local v11 = require(l_Parent_0.Resources.Constants);
local v12 = require(l_Parent_0.Components.ZonePortal);
local v13 = require(l_Parent_0.Enums.Direction);
local l_ImageSetButton_0 = l_UIBlox_0.Core.ImageSet.ImageSetButton;
local v15 = require(script.Parent.ThemedTextLabel);
local function v20(v16, v17) --[[ Line: 28 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: l_withStyle_0 (copy), l_Roact_0 (copy), l_ImageSetButton_0 (copy), v10 (copy), l_CursorKind_0 (copy), v15 (copy), v11 (copy), v12 (copy), v13 (copy)
    return l_withStyle_0(function(v18) --[[ Line: 29 ]]
        -- upvalues: v16 (copy), l_Roact_0 (ref), l_ImageSetButton_0 (ref), v10 (ref), v17 (copy), l_CursorKind_0 (ref), v15 (ref), v11 (ref), v12 (ref), v13 (ref)
        local v19 = {
            ExtraChildren = v16.titleChildren, 
            BackButton = l_Roact_0.createElement(l_ImageSetButton_0, {
                BackgroundTransparency = 1, 
                Image = v10.Images.NavigateBack, 
                AnchorPoint = Vector2.new(0, 0.5), 
                ImageColor3 = v18.Theme.IconEmphasis.Color, 
                ImageTransparency = v18.Theme.IconEmphasis.Transparency, 
                Position = UDim2.new(0, 4, 0.5, 0), 
                Size = UDim2.new(0, 36, 0, 36), 
                NextSelectionDown = v16.NextSelectionDown, 
                [l_Roact_0.Event.Activated] = v16.navigateUp, 
                [l_Roact_0.Ref] = v16.buttonRef, 
                SelectionImageObject = v17(l_CursorKind_0.RoundedRect)
            })
        };
        return l_Roact_0.createElement("TextButton", {
            AutoButtonColor = false, 
            Text = "", 
            BackgroundColor3 = v18.Theme.BackgroundContrast.Color, 
            BackgroundTransparency = v18.Theme.BackgroundContrast.Transparency, 
            BorderSizePixel = 0, 
            Position = v16.position, 
            Size = UDim2.new(1, 0, 1, 0), 
            Visible = v16.visible and not v16.pageIsModal, 
            ZIndex = v16.zIndex, 
            Selectable = false
        }, {
            PageTitle = l_Roact_0.createElement(v15, {
                fontKey = "Header1", 
                themeKey = "TextEmphasis", 
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.new(0.5, 0, 0, 28), 
                Size = UDim2.new(1, -48, 0, 28), 
                Text = v16.pageTitle
            }, v19), 
            PageContainer = l_Roact_0.createElement("Frame", {
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, v11.Zone.ContentOffset, 1, 0), 
                Size = UDim2.new(1, -v11.Zone.ContentOffset, 1, -68)
            }, v16[l_Roact_0.Children]), 
            ZonePortal = l_Roact_0.createElement(v12, {
                targetZone = 0, 
                direction = v13.Left
            })
        });
    end);
end;
return l_RoactRodux_0.UNSTABLE_connect2(nil, function(v21) --[[ Line: 88 ]]
    -- upvalues: v9 (copy)
    return {
        navigateUp = function() --[[ Line: 90 ]] --[[ Name: navigateUp ]]
            -- upvalues: v21 (copy), v9 (ref)
            v21(v9);
        end
    };
end)(function(v22) --[[ Line: 82 ]] --[[ Name: Page ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy), v20 (copy)
    return l_withSelectionCursorProvider_0(function(v23) --[[ Line: 83 ]]
        -- upvalues: v20 (ref), v22 (copy)
        return v20(v22, v23);
    end);
end);