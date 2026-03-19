local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local l_Skeleton_0 = require(l_script_FirstAncestor_0.Parent.Foundation).Skeleton;
local l_useLocalization_0 = require(l_script_FirstAncestor_0.Parent.Localization).Hooks.useLocalization;
local l_ExperienceTileV3_0 = v2.App.Tile.ExperienceTileV3;
local l_StyledTextLabel_0 = v2.App.Text.StyledTextLabel;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_useTextSizeOffset_0 = v2.Core.Style.useTextSizeOffset;
local v9 = UDim2.new(0, 150, 0, 210);
return function(v10) --[[ Line: 28 ]] --[[ Name: EventDescription ]]
    -- upvalues: l_useStyle_0 (copy), l_useLocalization_0 (copy), l_useTextSizeOffset_0 (copy), v9 (copy), v1 (copy), l_StyledTextLabel_0 (copy), l_Skeleton_0 (copy), l_ExperienceTileV3_0 (copy)
    local v11 = l_useStyle_0();
    local v12 = l_useLocalization_0({
        header = "Feature.VirtualEvents.DescriptionLabel"
    });
    local v13 = l_useTextSizeOffset_0();
    local v14 = v9 + UDim2.fromOffset(0, v13 * 2);
    return v1.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1
    }, {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 32)
        }), 
        DescriptionHeader = v1.createElement(l_StyledTextLabel_0, {
            layoutOrder = 0, 
            text = v12.header, 
            automaticSize = Enum.AutomaticSize.XY, 
            fontStyle = v11.Font.Header1, 
            colorStyle = v11.Theme.TextEmphasis
        }), 
        Description = if v10.description then v1.createElement(l_StyledTextLabel_0, {
            layoutOrder = 1, 
            text = v10.description, 
            automaticSize = Enum.AutomaticSize.XY, 
            fontStyle = v11.Font.Body, 
            colorStyle = v11.Theme.TextDefault
        }) else v1.createElement(l_Skeleton_0, {
            Size = UDim2.new(1, 0, 0, v11.Font.BaseSize)
        }), 
        ExperienceTileWrapper = v1.createElement("Frame", {
            LayoutOrder = 2, 
            Size = v14, 
            BackgroundTransparency = 1
        }, {
            ExperienceTile = v1.createElement(l_ExperienceTileV3_0, {
                experienceName = v10.experienceName, 
                thumbnail = v10.experienceThumbnail, 
                onActivated = v10.onExperienceTileActivated, 
                styleProps = {
                    overlayColors = {
                        Hover = v11.Theme.BackgroundOnHover
                    }
                }
            })
        })
    });
end;