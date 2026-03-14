local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local v3 = require(l_CorePackages_0.Packages.Roact);
local l_ImageSetButton_0 = v2.Core.ImageSet.ImageSetButton;
local l_FlexLayout_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Components.FlexLayout;
local l_Images_0 = v2.App.ImageSet.Images;
local v7 = l_Images_0["icons/navigation/close"];
local v8 = l_Images_0["icons/actions/truncationExpand"];
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Components.RobuxBalance);
local v10 = game:DefineFastFlag("AXReduceLookDetailsTryOnChevronDownSize", false);
return function(v11) --[[ Line: 18 ]]
    -- upvalues: v10 (copy), v3 (copy), l_FlexLayout_0 (copy), l_ImageSetButton_0 (copy), v7 (copy), v8 (copy), v9 (copy)
    local l_stylePalette_0 = v11.stylePalette;
    local l_showDropDownButton_0 = v11.showDropDownButton;
    local l_navigateBack_0 = v11.navigateBack;
    local l_onCloseButtonPressed_0 = v11.onCloseButtonPressed;
    local l_robuxBalanceRef_0 = v11.robuxBalanceRef;
    local v17 = if v10 then l_stylePalette_0.Tokens.Global.Size_400 else l_stylePalette_0.Tokens.Global.Size_600;
    local v18 = if v10 then l_stylePalette_0.Tokens.Global.Size_400 else l_stylePalette_0.Tokens.Global.Size_600;
    local l_Space_200_0 = l_stylePalette_0.Tokens.Global.Space_200;
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        AnchorPoint = Vector2.new(0, 1), 
        Position = UDim2.new(0, 0, 1, 0)
    }, {
        FlexLayout = v3.createElement(l_FlexLayout_0, {
            flexSlot = v3.createElement("Frame", {
                BorderSizePixel = 0, 
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                UIListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, l_Space_200_0)
                }), 
                UIPadding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, l_Space_200_0)
                }), 
                CloseButton = not l_showDropDownButton_0 and v3.createElement("Frame", {
                    AnchorPoint = Vector2.new(0, 0.5), 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, v17, 0, v18)
                }, {
                    CloseButtonIcon = v3.createElement(l_ImageSetButton_0, {
                        AnchorPoint = Vector2.new(0, 0.5), 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, if v10 then v18 else l_stylePalette_0.Tokens.Global.Size_500, 0, if v10 then v18 else l_stylePalette_0.Tokens.Global.Size_500), 
                        Image = v7, 
                        ImageColor3 = l_stylePalette_0.Theme.SystemPrimaryDefault.Color, 
                        Position = UDim2.new(0, 0, 0.5, 0), 
                        [v3.Event.Activated] = l_navigateBack_0
                    })
                }) or nil, 
                DropDownButton = l_showDropDownButton_0 and v3.createElement(l_ImageSetButton_0, {
                    AnchorPoint = Vector2.new(0, 1), 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, v17, 0, v18), 
                    Image = v8, 
                    ImageColor3 = l_stylePalette_0.Theme.SystemPrimaryDefault.Color, 
                    [v3.Event.Activated] = l_onCloseButtonPressed_0
                }) or nil
            }), 
            rigidSlot = v3.createElement("Frame", {
                Size = UDim2.new(0, 0, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                UIPadding = v3.createElement("UIPadding", {
                    PaddingRight = UDim.new(0, l_Space_200_0)
                }), 
                RobuxBalanceContainer = v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(0, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0, 0.5), 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    RobuxBalance = v3.createElement(v9, {
                        [v3.Ref] = l_robuxBalanceRef_0
                    })
                })
            }) or nil
        })
    });
end;