local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_ImpressionsTagUtility_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).ImpressionsTagUtility;
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_validateImage_0 = v7.Core.ImageSet.Validator.validateImage;
local l_IconSize_0 = v7.App.ImageSet.Enum.IconSize;
local l_getIconSize_0 = v7.App.ImageSet.getIconSize;
local l_IconButton_0 = v7.App.Button.IconButton;
local l_Medium_0 = l_IconSize_0.Medium;
local l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp;
local function v14() --[[ Line: 22 ]]

end;
local v15 = v2.Component:extend("LogoTray");
v15.validateProps = v3.strictInterface({
    itemList = v3.array(v3.strictInterface({
        key = v3.string, 
        logo = l_validateImage_0
    })), 
    layoutOrder = v3.integer, 
    padding = v3.optional(v3.UDim), 
    handleItemClick = v3.optional(v3.callback), 
    designTokens = v3.table, 
    impressionsTag = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then v3.string else nil, 
    onAbsolutePositionChanged = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then v3.optional(v3.callback) else nil, 
    forwardRef = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then v3.optional(v3.table) else nil
});
v15.defaultProps = {
    padding = UDim.new(0, 12), 
    handleItemClick = v14
};
LogoTrayItem = function(v16) --[[ Line: 64 ]] --[[ Name: LogoTrayItem ]]
    -- upvalues: v1 (copy), l_ImpressionsTagUtility_0 (copy), v2 (copy), l_IconButton_0 (copy), v4 (copy)
    local v17 = v1.useRef(nil);
    v1.useEffect(function() --[[ Line: 66 ]]
        -- upvalues: l_ImpressionsTagUtility_0 (ref), v17 (copy), v16 (copy)
        l_ImpressionsTagUtility_0.AddTag(v17, v16.impressionsTag, v16.index);
        return function() --[[ Line: 68 ]]
            -- upvalues: l_ImpressionsTagUtility_0 (ref), v17 (ref), v16 (ref)
            l_ImpressionsTagUtility_0.RemoveTag(v17, v16.impressionsTag, v16.index);
        end;
    end, {
        v17, 
        v16.impressionsTag, 
        v16.index
    });
    return v2.createElement(l_IconButton_0, v4.Dictionary.join(v16.iconButtonProps, {
        buttonRef = v17
    }));
end;
v15.init = function(v18) --[[ Line: 81 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), l_getIconSize_0 (copy), l_Medium_0 (copy), l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 (copy), v2 (copy), l_IconButton_0 (copy)
    v18.getInteractableItemTable = function() --[[ Line: 82 ]]
        -- upvalues: v4 (ref), v18 (copy)
        local v19 = {};
        v4.List.map(v18.props.itemList, function(v20) --[[ Line: 84 ]]
            -- upvalues: v19 (copy)
            assert(v19[v20.key] == nil, "Duplicate logo key is not allowed.");
            v19[v20.key] = v20;
        end);
        return v19;
    end;
    v18.getMeasuredItemSize = function() --[[ Line: 91 ]]
        -- upvalues: l_getIconSize_0 (ref), l_Medium_0 (ref)
        local v21 = l_getIconSize_0(l_Medium_0);
        return UDim2.fromOffset(v21, v21);
    end;
    v18.renderItem = function(v22) --[[ Line: 96 ]]
        -- upvalues: v4 (ref), v18 (copy), l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 (ref), v2 (ref), l_Medium_0 (ref), l_IconButton_0 (ref)
        assert(v22.logo ~= nil, "Invalid icon: " .. v22.key);
        local v23 = v4.List.find(v18.props.itemList, v22);
        if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then
            return (v2.createElement(LogoTrayItem, {
                iconButtonProps = {
                    icon = v22.logo, 
                    size = v18.getMeasuredItemSize(), 
                    iconColor3 = v18.props.designTokens.Semantic.Color.Ui.Emphasis.Color3, 
                    iconSize = l_Medium_0, 
                    onActivated = function() --[[ Line: 106 ]] --[[ Name: onActivated ]]
                        -- upvalues: v18 (ref), v22 (copy)
                        v18.props.handleItemClick(v22.key);
                    end, 
                    layoutOrder = v23
                }, 
                index = v23, 
                impressionsTag = v18.props.impressionsTag
            }));
        else
            return (v2.createElement(l_IconButton_0, {
                icon = v22.logo, 
                size = v18.getMeasuredItemSize(), 
                iconColor3 = v18.props.designTokens.Semantic.Color.Ui.Emphasis.Color3, 
                iconSize = l_Medium_0, 
                onActivated = function() --[[ Line: 121 ]] --[[ Name: onActivated ]]
                    -- upvalues: v18 (ref), v22 (copy)
                    v18.props.handleItemClick(v22.key);
                end, 
                layoutOrder = v23
            }));
        end;
    end;
    v18.renderList = function(_) --[[ Line: 130 ]]
        -- upvalues: v18 (copy), v2 (ref)
        local v25 = {};
        for _, v27 in v18.getInteractableItemTable() do
            local v28 = v18.renderItem(v27);
            v25[v27.key] = v28;
        end;
        v25.Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = v18.props.padding, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        });
        return v25;
    end;
end;
v15.render = function(v29) --[[ Line: 146 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 (copy)
    local v30 = v29.getMeasuredItemSize();
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v30.Y.Offset), 
        LayoutOrder = v29.props.layoutOrder, 
        [v2.Change.AbsolutePosition] = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then v29.props.onAbsolutePositionChanged else nil, 
        [v2.Ref] = if l_FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp_0 then v29.props.forwardRef else nil
    }, v29.renderList(v30));
end;
local l_v15_0 = v15;
return function(v32) --[[ Line: 161 ]]
    -- upvalues: l_useDesignTokens_0 (copy), v4 (copy), v2 (copy), l_v15_0 (copy)
    local v33 = l_useDesignTokens_0();
    local v34 = v4.Dictionary.join(v32, {
        designTokens = v33
    });
    return v2.createElement(l_v15_0, v34);
end;