local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.SellPage.AvailableToSellRow);
local v6 = v3.PureComponent:extend("AvailableToSellLimitedUniqueRow");
v6.render = function(v7) --[[ Line: 22 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v5 (copy)
    local l_userAssetInfo_0 = v7.props.userAssetInfo;
    if not l_userAssetInfo_0 or l_userAssetInfo_0 and not l_userAssetInfo_0.serialNumber then
        return;
    else
        local v9 = "# " .. l_userAssetInfo_0.serialNumber;
        local l_forwardRef_0 = v7.props.forwardRef;
        return v3.createElement(v5, {
            LayoutOrder = v7.props.LayoutOrder, 
            onActivated = v7.props.onActivated, 
            horizontalPadding = v7.props.horizontalPadding, 
            Position = v7.props.Position, 
            Size = v7.props.Size, 
            Text = v9, 
            NextSelectionLeft = v7.props.NextSelectionLeft, 
            NextSelectionRight = v7.props.NextSelectionRight, 
            NextSelectionUp = v7.props.NextSelectionUp, 
            NextSelectionDown = v7.props.NextSelectionDown, 
            [v3.Ref] = l_forwardRef_0
        });
    end;
end;
v6 = v4.connect(function(v11, v12) --[[ Line: 48 ]]
    return {
        userAssetInfo = v11.AvatarExperience.Catalog.UserAssets[v12.userAssetId]
    };
end)(v6);
return v3.forwardRef(function(v13, v14) --[[ Line: 55 ]]
    -- upvalues: v3 (copy), v6 (ref), v2 (copy)
    return v3.createElement(v6, v2.Dictionary.join(v13, {
        forwardRef = v14
    }));
end);