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
return function(v11, v12) --[[ Line: 16 ]]
    -- upvalues: v3 (copy), l_useTokens_0 (copy), l_useTextSizeOffset_0 (copy), v9 (copy), l_uiblox_0 (copy), v10 (copy), v8 (copy)
    assert(v12 > 0, "resolutionScale for ImageSet must be greater than 0! got " .. tostring(v12));
    return v3.forwardRef(function(v13, v14) --[[ Line: 22 ]]
        -- upvalues: v3 (ref), l_useTokens_0 (ref), l_useTextSizeOffset_0 (ref), v9 (ref), l_uiblox_0 (ref), v10 (ref), v11 (copy), v12 (copy), v8 (ref)
        local v15 = {
            [v3.Ref] = v14, 
            [v3.Children] = v13[v3.Children]
        };
        local v16 = nil;
        local v17 = false;
        for v18, v19 in pairs(v13) do
            if v18 == "Image" and typeof(v19) == "table" then
                v17 = true;
                v16 = v19;
            else
                v15[v18] = v19;
            end;
        end;
        local v20 = l_useTokens_0();
        local v21 = l_useTextSizeOffset_0();
        if v17 then
            local v22 = v9[v16];
            if v22 and l_uiblox_0[v22] then
                if not v20.Stroke then
                    error((("No StyleProvider in tree for migrated icon ImageSetComponent.\n UIBlox Icon: %*, BuilderIcon: %*"):format(v22, l_uiblox_0[v22])));
                end;
                local l_Standard_0 = v20.Stroke.Standard;
                return v10(v15, v11, l_uiblox_0[v22], v22, v20, v21, l_Standard_0);
            end;
        end;
        if v17 then
            for v24, v25 in pairs(v16) do
                if not v15[v24] then
                    v15[v24] = v25;
                elseif v24 == "ImageRectOffset" then
                    v15[v24] = v25 + v15[v24] * v12;
                elseif v24 == "ImageRectSize" then
                    v15[v24] = v15[v24] * v12;
                end;
            end;
        end;
        if v17 then
            v15 = v8(v15, v12);
        end;
        return v3.createElement(v11, v15);
    end);
end;