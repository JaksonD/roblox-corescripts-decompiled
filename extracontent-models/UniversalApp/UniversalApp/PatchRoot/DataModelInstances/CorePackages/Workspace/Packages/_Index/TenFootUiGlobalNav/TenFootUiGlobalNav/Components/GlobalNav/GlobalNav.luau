local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiGlobalNav");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.Style);
local v6 = require(l_Parent_0.Responsive);
local v7 = require(l_script_FirstAncestor_0.Components.GlobalNavOptionGroup);
local v8 = require(l_script_FirstAncestor_0.Components.utils.eraseKeys);
local l_IconTabGroup_0 = v4.App.Navigation.PrimaryNavBar.IconTabGroup;
local l_useDesignTokens_0 = v5.useDesignTokens;
local l_getVirtualResolutionScale_0 = v6.getVirtualResolutionScale;
local v15 = v3.forwardRef(function(v12, v13) --[[ Line: 15 ]]
    -- upvalues: v8 (copy), v3 (copy), l_getVirtualResolutionScale_0 (copy), v2 (copy)
    local v14 = v8({
        "children", 
        "GroupTransparency"
    }, v12);
    return v3.createElement("CanvasGroup", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        GroupTransparency = v12.GroupTransparency, 
        ResolutionScale = l_getVirtualResolutionScale_0(), 
        ref = v13
    }, v3.createElement("Frame", v2.Dictionary.join({
        AutomaticSize = Enum.AutomaticSize.XY, 
        Position = UDim2.new(0, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0, 0.5), 
        BackgroundTransparency = 1
    }, v14), v12.children));
end);
return (v3.forwardRef(function(v16, v17) --[[ Line: 69 ]]
    -- upvalues: l_useDesignTokens_0 (copy), v8 (copy), v3 (copy), v15 (copy), l_IconTabGroup_0 (copy), v7 (copy), v2 (copy)
    local v19 = l_useDesignTokens_0(function(v18) --[[ Line: 70 ]]
        return v18.Global.Space_800;
    end);
    local v21 = l_useDesignTokens_0(function(v20) --[[ Line: 73 ]]
        return v20.Global.Size_100;
    end);
    local v22 = v8({
        "optionGroupProps", 
        "tabGroupProps", 
        "animationProps"
    }, v16);
    local v23 = nil;
    local v24 = nil;
    if v16.tabGroupProps then
        v23 = v3.createElement(v15, {
            GroupTransparency = v16.animationProps.tabGroupTransparency, 
            ref = v16.animationProps.tabGroupRef
        }, v3.createElement(l_IconTabGroup_0, v16.tabGroupProps));
    end;
    if v16.optionGroupProps then
        v24 = v3.createElement(v15, {
            Position = UDim2.new(1, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(1, 0.5), 
            GroupTransparency = v16.animationProps.optionGroupTransparency, 
            ref = v16.animationProps.optionGroupRef
        }, v3.createElement(v7, v2.Dictionary.join(v16.optionGroupProps, {
            AnchorPoint = Vector2.new(1, 0), 
            spacing = v21
        })));
    end;
    return v3.createElement("Frame", v2.Dictionary.join({
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ref = v17
    }, v22), v3.createElement("UIPadding", {
        PaddingRight = UDim.new(0, v19), 
        PaddingLeft = UDim.new(0, v19)
    }), {
        TabGroup = v23, 
        OptionGroup = v24
    });
end));