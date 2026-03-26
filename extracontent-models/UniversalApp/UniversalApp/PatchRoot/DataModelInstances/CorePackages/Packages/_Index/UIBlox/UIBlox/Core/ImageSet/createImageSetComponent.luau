local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local l_uiblox_0 = require(l_Parent_2.BuilderIcons).Migration.uiblox;
local v5 = require(l_Parent_2.Foundation);
local l_useTokens_0 = v5.Hooks.useTokens;
local l_useTextSizeOffset_0 = v5.Hooks.useTextSizeOffset;
local v8 = require(l_Parent_1.App.ImageSet.scaleSliceToResolution);
local v9 = require(l_Parent_1.App.ImageSet.ImagesInverse);
local v10 = require(l_Parent_0.getBuilderIconElement);
local l_Flags_0 = require(l_Parent_2.FoundationImages).Flags;
return function(v12, v13) --[[ Line: 18 ]]
    -- upvalues: v3 (copy), l_Flags_0 (copy), l_uiblox_0 (copy), l_useTokens_0 (copy), l_useTextSizeOffset_0 (copy), v9 (copy), v10 (copy), v8 (copy)
    assert(v13 > 0, "resolutionScale for ImageSet must be greater than 0! got " .. tostring(v13));
    return v3.forwardRef(function(v14, v15) --[[ Line: 24 ]]
        -- upvalues: v3 (ref), l_Flags_0 (ref), l_uiblox_0 (ref), l_useTokens_0 (ref), l_useTextSizeOffset_0 (ref), v9 (ref), v10 (ref), v12 (copy), v13 (copy), v8 (ref)
        local v16 = {
            [v3.Ref] = v15, 
            [v3.Children] = v14[v3.Children]
        };
        local v17 = nil;
        local v18 = nil;
        local v19 = false;
        local v20 = false;
        for v21, v22 in pairs(v14) do
            if v21 == "Image" and typeof(v22) == "table" then
                if l_Flags_0.FoundationImagesRemoveDeprecatedIconAssets and l_uiblox_0[v22.Image] then
                    v20 = true;
                    v18 = v22.Image;
                else
                    v19 = true;
                    v17 = v22;
                end;
            else
                v16[v21] = v22;
            end;
        end;
        local v23 = l_useTokens_0();
        local v24 = l_useTextSizeOffset_0();
        if v19 or v20 then
            local v25 = if v20 then v18 else v9[v17];
            if v25 and l_uiblox_0[v25] then
                if not v23.Stroke then
                    error((("No StyleProvider in tree for migrated icon ImageSetComponent.\n UIBlox Icon: %*, BuilderIcon: %*"):format(v25, l_uiblox_0[v25])));
                end;
                local l_Standard_0 = v23.Stroke.Standard;
                return v10(v16, v12, l_uiblox_0[v25], v25, v23, v24, l_Standard_0);
            end;
        end;
        if v19 then
            for v27, v28 in pairs(v17) do
                if not v16[v27] then
                    v16[v27] = v28;
                elseif v27 == "ImageRectOffset" then
                    v16[v27] = v28 + v16[v27] * v13;
                elseif v27 == "ImageRectSize" then
                    v16[v27] = v16[v27] * v13;
                end;
            end;
        end;
        if v19 then
            v16 = v8(v16, v13);
        end;
        return v3.createElement(v12, v16);
    end);
end;