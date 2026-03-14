local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local l_Core_0 = l_Parent_2.Core;
local v5 = require(l_Parent_3.Foundation);
local l_ButtonVariant_0 = v5.Enums.ButtonVariant;
local l_InputSize_0 = v5.Enums.InputSize;
local v8 = require(l_Parent_0.Enum.ButtonType);
local v9 = require(l_Core_0.Button.Enum.StandardButtonSize);
local v10 = require(l_Parent_1.ImageSet.ImagesInverse);
local v11 = {
    [v8.Alert] = l_ButtonVariant_0.Alert, 
    [v8.PrimaryContextual] = l_ButtonVariant_0.Emphasis, 
    [v8.PrimarySystem] = l_ButtonVariant_0.SubEmphasis, 
    [v8.Secondary] = l_ButtonVariant_0.Subtle
};
local v12 = {
    [v9.Regular] = l_InputSize_0.Large, 
    [v9.Small] = l_InputSize_0.Small, 
    [v9.XSmall] = l_InputSize_0.XSmall
};
local v13 = {
    [v9.Regular] = false, 
    [v9.Small] = false, 
    [v9.XSmall] = true
};
return {
    buttonMapping = v11, 
    sizeMapping = v12, 
    findIcon = function(v14) --[[ Line: 35 ]] --[[ Name: findIcon ]]
        -- upvalues: v10 (copy)
        if not v14 then
            return nil;
        else
            local v15 = v10[v14];
            if v15 == nil then
                warn("Icon not found");
            end;
            return v15;
        end;
    end, 
    getSizeMapping = function(v16, v17, v18) --[[ Line: 46 ]] --[[ Name: getSizeMapping ]]
        -- upvalues: v12 (copy), l_InputSize_0 (copy)
        if v16 then
            return v12[v16];
        elseif v17 then
            if v17.Y.Offset >= v18.Size.Size_1200 then
                return l_InputSize_0.Large;
            elseif v17.Y.Scale > 0 then
                return l_InputSize_0.Medium;
            elseif v17.Y.Offset >= v18.Size.Size_1000 then
                return l_InputSize_0.Medium;
            elseif v17.Y.Offset >= v18.Size.Size_800 then
                return l_InputSize_0.Small;
            else
                return l_InputSize_0.XSmall;
            end;
        else
            return nil;
        end;
    end, 
    getWidth = function(v19, v20, v21) --[[ Line: 65 ]] --[[ Name: getWidth ]]
        -- upvalues: v13 (copy)
        if v19 then
            local v22 = v13[v19];
            if v21 == nil then
                v21 = v22;
            end;
            if v21 then
                return nil;
            else
                return UDim.new(1, 0);
            end;
        elseif v20 then
            return v20.X;
        elseif v21 then
            return nil;
        else
            return UDim.new(1, 0);
        end;
    end, 
    getMaxWidth = function(v23, v24) --[[ Line: 86 ]] --[[ Name: getMaxWidth ]]
        if v23 == nil then
            return nil;
        elseif v24 == nil then
            return 640;
        else
            return v24;
        end;
    end, 
    getTestId = function(v25) --[[ Line: 94 ]] --[[ Name: getTestId ]]
        if not v25 or #v25 == 0 then
            return nil;
        else
            return v25:match("data%-testid=([^%s]+)");
        end;
    end
};