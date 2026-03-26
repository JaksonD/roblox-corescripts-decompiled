local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local l_Core_0 = l_Parent_2.Core;
local v5 = require(l_Parent_3.Foundation);
local l_ButtonVariant_0 = v5.Enums.ButtonVariant;
local l_InputSize_0 = v5.Enums.InputSize;
local l_Flags_0 = require(l_Parent_3.FoundationImages).Flags;
local l_uiblox_0 = require(l_Parent_3.BuilderIcons).Migration.uiblox;
local v10 = require(l_Parent_0.Enum.ButtonType);
local v11 = require(l_Core_0.Button.Enum.StandardButtonSize);
local v12 = require(l_Parent_1.ImageSet.ImagesInverse);
local v13 = {
    [v10.Alert] = l_ButtonVariant_0.Alert, 
    [v10.PrimaryContextual] = l_ButtonVariant_0.Emphasis, 
    [v10.PrimarySystem] = l_ButtonVariant_0.SubEmphasis, 
    [v10.Secondary] = l_ButtonVariant_0.Subtle
};
local v14 = {
    [v11.Regular] = l_InputSize_0.Large, 
    [v11.Small] = l_InputSize_0.Small, 
    [v11.XSmall] = l_InputSize_0.XSmall
};
local v15 = {
    [v11.Regular] = false, 
    [v11.Small] = false, 
    [v11.XSmall] = true
};
return {
    buttonMapping = v13, 
    sizeMapping = v14, 
    findIcon = function(v16) --[[ Line: 40 ]] --[[ Name: findIcon ]]
        -- upvalues: l_Flags_0 (copy), l_uiblox_0 (copy), v12 (copy)
        if not v16 then
            return nil;
        else
            local v17 = if l_Flags_0.FoundationImagesRemoveDeprecatedIconAssets and v16.Image and l_uiblox_0[v16.Image] ~= nil then v16.Image else v12[v16];
            if v17 == nil then
                warn("Icon not found");
            end;
            return v17;
        end;
    end, 
    getSizeMapping = function(v18, v19, v20) --[[ Line: 56 ]] --[[ Name: getSizeMapping ]]
        -- upvalues: v14 (copy), l_InputSize_0 (copy)
        if v18 then
            return v14[v18];
        elseif v19 then
            if v19.Y.Offset >= v20.Size.Size_1200 then
                return l_InputSize_0.Large;
            elseif v19.Y.Scale > 0 then
                return l_InputSize_0.Medium;
            elseif v19.Y.Offset >= v20.Size.Size_1000 then
                return l_InputSize_0.Medium;
            elseif v19.Y.Offset >= v20.Size.Size_800 then
                return l_InputSize_0.Small;
            else
                return l_InputSize_0.XSmall;
            end;
        else
            return nil;
        end;
    end, 
    getWidth = function(v21, v22, v23) --[[ Line: 75 ]] --[[ Name: getWidth ]]
        -- upvalues: v15 (copy)
        if v21 then
            local v24 = v15[v21];
            if v23 == nil then
                v23 = v24;
            end;
            if v23 then
                return nil;
            else
                return UDim.new(1, 0);
            end;
        elseif v22 then
            return v22.X;
        elseif v23 then
            return nil;
        else
            return UDim.new(1, 0);
        end;
    end, 
    getMaxWidth = function(v25, v26) --[[ Line: 96 ]] --[[ Name: getMaxWidth ]]
        if v25 == nil then
            return nil;
        elseif v26 == nil then
            return 640;
        else
            return v26;
        end;
    end, 
    getTestId = function(v27) --[[ Line: 104 ]] --[[ Name: getTestId ]]
        if not v27 or #v27 == 0 then
            return nil;
        else
            return v27:match("data%-testid=([^%s]+)");
        end;
    end
};