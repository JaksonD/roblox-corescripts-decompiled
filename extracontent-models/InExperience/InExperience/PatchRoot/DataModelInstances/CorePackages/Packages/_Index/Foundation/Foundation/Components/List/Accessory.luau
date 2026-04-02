local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_uiblox_0 = require(l_Parent_0.BuilderIcons).Migration.uiblox;
local v4 = require(l_script_FirstAncestor_0.Components.Icon);
local v5 = require(l_script_FirstAncestor_0.Components.Image);
local v6 = require(l_script_FirstAncestor_0.Components.View);
local v7 = require(l_script_FirstAncestor_0.Utility.iconMigrationUtils);
local v8 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local l_isMigrated_0 = v7.isMigrated;
local l_isBuilderOrMigratedIcon_0 = v7.isBuilderOrMigratedIcon;
local v11 = require(l_Parent_0.Foundation.Enums.StateLayerAffordance);
local v12 = require(l_script_FirstAncestor_0.Enums.AccessoryType);
local v13 = require(l_script_FirstAncestor_0.Components.Avatar);
local v14 = require(script.Parent.useAccessoryVariants);
local _ = require(l_script_FirstAncestor_0.Enums.InputSize);
return v2.memo(function(v16) --[[ Line: 52 ]] --[[ Name: Accessory ]]
    -- upvalues: v8 (copy), v2 (copy), v12 (copy), l_isBuilderOrMigratedIcon_0 (copy), v14 (copy), v13 (copy), v4 (copy), l_isMigrated_0 (copy), l_uiblox_0 (copy), v5 (copy), v6 (copy), v11 (copy)
    local v17 = v8();
    local v18 = v2.useMemo(function() --[[ Line: 54 ]]
        -- upvalues: v16 (copy)
        if type(v16.config) == "string" then
            return {
                iconName = v16.config
            };
        else
            return v16.config;
        end;
    end, {
        v16.config
    });
    local v19 = if v18.type == v12.Avatar then v12.Avatar else if not (type(v16.config) ~= "string") or l_isBuilderOrMigratedIcon_0(v18.iconName) then v12.Icon else v12.Media;
    local v20 = v14(v17, v16.size, v19);
    local v21 = nil;
    v21 = if v18.type == v12.Avatar then v2.createElement(v13, {
        userId = v18.userId, 
        size = v16.size
    }) else if l_isBuilderOrMigratedIcon_0(v18.iconName) then v2.createElement(v4, {
        name = if l_isMigrated_0(v18.iconName) then l_uiblox_0[v18.iconName].name else v18.iconName, 
        variant = if l_isMigrated_0(v18.iconName) then l_uiblox_0[v18.iconName].variant else v18.iconVariant, 
        size = v20.accessory.Size.Y.Offset
    }) else v2.createElement(v5, {
        Image = v18.iconName, 
        Size = v20.accessory.Size, 
        cornerRadius = v20.accessory.cornerRadius
    });
    return v2.createElement(v6, {
        Size = v20.container.Size, 
        tag = "align-x-center align-y-center", 
        stateLayer = {
            affordance = v11.None
        }, 
        isDisabled = v16.isDisabled, 
        LayoutOrder = v16.LayoutOrder, 
        testId = v16.testId
    }, v21);
end);