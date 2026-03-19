local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Enums.NumberInputControlsVariant);
local v2 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v3 = require(l_script_FirstAncestor_0.Utility.Flags);
local v4 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v6 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local function v9(v7) --[[ Line: 20 ]] --[[ Name: computeProps ]]
    -- upvalues: v3 (copy)
    local v8 = if not v3.FoundationNumberInputFixControlSizes or v7.width and v7.horizontalPadding then UDim.new(0, ((if v3.FoundationNumberInputTokenBasedWidth then v7.buttonWidth else v7.width) - v7.horizontalPadding) / 2) else nil;
    return {
        container = {
            width = if v3.FoundationNumberInputTokenBasedWidth then v7.width else nil
        }, 
        button = {
            tag = "size-full fill", 
            width = if v3.FoundationNumberInputTokenBasedWidth then v7.buttonWidth else v7.width, 
            padding = if not v3.FoundationNumberInputFixControlSizes or v8 then {
                left = v8, 
                right = v8
            } else nil
        }, 
        upButton = {
            tag = v7.upButtonTag
        }, 
        downButton = {
            tag = v7.downButtonTag
        }, 
        splitButton = {
            size = v7.splitButtonSize, 
            tag = v7.splitButtonTag
        }, 
        icon = if v3.FoundationNumberInputFixControlSizes then {
            tag = v7.iconTag
        } else {}
    };
end;
local function v14(v10) --[[ Line: 72 ]] --[[ Name: variantsFactory ]]
    -- upvalues: v3 (copy), v2 (copy), v9 (copy), v1 (copy)
    local v11 = {
        upButton = {
            tag = "size-full fill padding-bottom-xsmall"
        }, 
        downButton = {
            tag = "size-full fill padding-top-xsmall"
        }, 
        splitButton = {
            tag = "bg-shift-100"
        }, 
        icon = {
            tag = {
                ["content-default"] = true, 
                ["size-150-100"] = not v3.FoundationNumberInputFixControlSizes
            }
        }
    };
    local v12 = {
        [v2.XSmall] = v9({
            width = if v3.FoundationNumberInputTokenBasedWidth then v10.Size.Size_3000 * 1.1666666666666667 else v10.Size.Size_400, 
            buttonWidth = if v3.FoundationNumberInputTokenBasedWidth then v10.Size.Size_400 else nil, 
            horizontalPadding = v10.Size.Size_150, 
            upButtonTag = "padding-top-xxsmall", 
            downButtonTag = "padding-bottom-xxsmall", 
            splitButtonTag = "radius-small", 
            splitButtonSize = v10.Size.Size_600
        }), 
        [v2.Small] = v9({
            width = if v3.FoundationNumberInputTokenBasedWidth then v10.Size.Size_3000 * 1.3333333333333333 else v10.Size.Size_600, 
            buttonWidth = if v3.FoundationNumberInputTokenBasedWidth then v10.Size.Size_600 else nil, 
            horizontalPadding = v10.Size.Size_150, 
            upButtonTag = "padding-top-xsmall", 
            downButtonTag = "padding-bottom-xsmall", 
            splitButtonTag = "radius-medium", 
            splitButtonSize = v10.Size.Size_800
        }), 
        [v2.Medium] = v9({
            width = if v3.FoundationNumberInputTokenBasedWidth then v10.Size.Size_3000 * 1.5 else v10.Size.Size_600, 
            buttonWidth = if v3.FoundationNumberInputTokenBasedWidth then v10.Size.Size_600 else nil, 
            horizontalPadding = v10.Size.Size_150, 
            upButtonTag = "padding-top-small", 
            downButtonTag = "padding-bottom-small", 
            splitButtonTag = "radius-medium", 
            splitButtonSize = v10.Size.Size_1000
        }), 
        [v2.Large] = v9({
            width = if v3.FoundationNumberInputTokenBasedWidth then v10.Size.Size_3000 * 1.6666666666666667 else v10.Size.Size_800, 
            buttonWidth = if v3.FoundationNumberInputTokenBasedWidth then v10.Size.Size_800 else nil, 
            horizontalPadding = v10.Size.Size_150, 
            upButtonTag = "padding-top-medium", 
            downButtonTag = "padding-bottom-medium", 
            splitButtonTag = "radius-medium", 
            splitButtonSize = v10.Size.Size_1200
        })
    };
    local v13 = if v3.FoundationNumberInputFixControlSizes then {
        [v1.Stacked] = v9({
            iconTag = "size-150-100"
        })
    } else nil;
    return {
        common = v11, 
        sizes = v12, 
        controlVariants = v13
    };
end;
return function(v15, v16, v17) --[[ Line: 149 ]]
    -- upvalues: v6 (copy), v14 (copy), v4 (copy), v3 (copy)
    local v18 = v6.useVariants("NumberInput", v14, v15);
    return v4(v18.common, v18.sizes[v16], if v3.FoundationNumberInputFixControlSizes then v18.controlVariants[v17] else nil);
end;