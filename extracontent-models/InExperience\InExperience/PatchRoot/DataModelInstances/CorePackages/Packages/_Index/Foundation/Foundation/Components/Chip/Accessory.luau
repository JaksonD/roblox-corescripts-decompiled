local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_uiblox_0 = require(l_Parent_0.BuilderIcons).Migration.uiblox;
local v4 = require(l_script_FirstAncestor_0.Components.Icon);
local v5 = require(l_script_FirstAncestor_0.Components.Image);
local v6 = require(l_script_FirstAncestor_0.Components.View);
local v7 = require(l_script_FirstAncestor_0.Utility.iconMigrationUtils);
local v8 = require(l_script_FirstAncestor_0.Utility.useCumulativeBackground);
local v9 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local l_isMigrated_0 = v7.isMigrated;
local l_isBuilderOrMigratedIcon_0 = v7.isBuilderOrMigratedIcon;
local v12 = require(l_script_FirstAncestor_0.Components.AvatarGroup);
local _ = require(l_script_FirstAncestor_0.Enums.AvatarGroupType);
local l_useBackgroundStyle_0 = require(l_script_FirstAncestor_0.Providers.Style.BackgroundStyleContext).useBackgroundStyle;
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v16 = require(script.Parent.useAccessoryVariants);
local _ = require(l_script_FirstAncestor_0.Enums.ChipSize);
local function v21(v18) --[[ Line: 64 ]] --[[ Name: AvatarGroupWrapper ]]
    -- upvalues: l_useBackgroundStyle_0 (copy), v8 (copy), v2 (copy), v12 (copy)
    local v19 = l_useBackgroundStyle_0();
    local v20 = table.clone(v18.config.props);
    v20.size = v18.size;
    v20.backplateStyle = v8(v19, v18.chipBackgroundStyle);
    return v2.createElement(v12, v20);
end;
return v2.memo(function(v22) --[[ Line: 72 ]] --[[ Name: Accessory ]]
    -- upvalues: v9 (copy), v2 (copy), v16 (copy), v21 (copy), l_isBuilderOrMigratedIcon_0 (copy), v4 (copy), l_isMigrated_0 (copy), l_uiblox_0 (copy), v5 (copy), v6 (copy)
    local v23 = v9();
    local v24 = v2.useMemo(function() --[[ Line: 74 ]]
        -- upvalues: v22 (copy)
        if type(v22.config) == "string" then
            return {
                iconName = v22.config, 
                isCircular = false
            };
        else
            return v22.config;
        end;
    end, {
        v22.config
    });
    local l_v16_0 = v16;
    local l_v23_0 = v23;
    local l_size_0 = v22.size;
    local l_isLeading_0 = v22.isLeading;
    local v29 = true;
    if v24.type ~= "AvatarGroup" then
        v29 = v24.isCircular or false;
    end;
    l_v16_0 = l_v16_0(l_v23_0, l_size_0, l_isLeading_0, v29);
    l_v23_0 = nil;
    l_v23_0 = if v24.type == "AvatarGroup" then v2.createElement(v21, v22) else if l_isBuilderOrMigratedIcon_0(v24.iconName) then v2.createElement(v4, {
        name = if l_isMigrated_0(v24.iconName) then l_uiblox_0[v24.iconName].name else v24.iconName, 
        variant = if l_isMigrated_0(v24.iconName) then l_uiblox_0[v24.iconName].variant else v24.iconVariant, 
        size = l_v16_0.accessory.Size.Y.Offset, 
        style = v22.contentStyle
    }) else v2.createElement(v5, {
        Image = v24.iconName, 
        Size = l_v16_0.accessory.Size, 
        imageStyle = v22.contentStyle
    });
    return v2.createElement(v6, {
        tag = "auto-xy", 
        padding = l_v16_0.accessory.padding, 
        onActivated = v24.onActivated, 
        isDisabled = v22.isDisabled, 
        LayoutOrder = v22.isLeading and 1 or 3, 
        testId = v22.testId
    }, l_v23_0);
end);