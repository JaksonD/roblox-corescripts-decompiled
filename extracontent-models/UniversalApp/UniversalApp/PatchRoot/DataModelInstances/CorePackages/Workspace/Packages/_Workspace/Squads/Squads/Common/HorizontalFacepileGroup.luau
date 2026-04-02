local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_script_FirstAncestor_0.dependencies);
local l_FFlagRemoveDependencyArrayAntipattern_0 = v3.SharedFlags.FFlagRemoveDependencyArrayAntipattern;
local l_dependencyArray_0 = v3.Hooks.dependencyArray;
local l_Foundation_0 = v3.Foundation;
local l_React_0 = v3.React;
local l_useTokens_0 = l_Foundation_0.Hooks.useTokens;
local l_Image_0 = l_Foundation_0.Image;
local l_View_0 = l_Foundation_0.View;
HorizontalFacepileGroup = function(v11) --[[ Line: 28 ]] --[[ Name: HorizontalFacepileGroup ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), l_React_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_Image_0 (copy), l_View_0 (copy)
    local v12 = l_useTokens_0();
    local l_v11_0 = v11;
    local v14 = {
        avatarSize = 0, 
        images = {}, 
        layoutOrder = 1, 
        imageBackgroundStyle = nil, 
        imageBorderStyle = {
            Color = v12.Color.Extended.Green.Green_800.Color3, 
            Transparency = v12.Color.Extended.Green.Green_800.Transparency
        }
    };
    l_v11_0 = v2.Dictionary.union(v14, v11);
    local v18 = l_React_0.useMemo(function() --[[ Line: 47 ]]
        -- upvalues: l_v11_0 (ref)
        local v15 = #l_v11_0.images;
        if v15 <= 0 then
            return 0;
        else
            local l_avatarSize_0 = l_v11_0.avatarSize;
            for _ = 2, v15 do
                l_avatarSize_0 = l_avatarSize_0 + (l_v11_0.avatarSize - 4);
            end;
            return l_avatarSize_0;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        #l_v11_0.images, 
        l_v11_0.avatarSize
    } else l_dependencyArray_0(#l_v11_0.images, l_v11_0.avatarSize));
    local v24 = l_React_0.useMemo(function() --[[ Line: 67 ]]
        -- upvalues: l_v11_0 (ref), l_React_0 (ref), l_Image_0 (ref), v12 (copy)
        local v19 = #l_v11_0.images;
        local v20 = {};
        for v21, v22 in ipairs(l_v11_0.images) do
            local v23 = v21 == 1 and 0 or 4;
            table.insert(v20, l_React_0.createElement(l_Image_0, {
                Image = v22, 
                backgroundStyle = if l_v11_0.imageBackgroundStyle then l_v11_0.imageBackgroundStyle else nil, 
                Size = UDim2.fromOffset(l_v11_0.avatarSize, l_v11_0.avatarSize), 
                Position = UDim2.new(0, l_v11_0.avatarSize * (v21 - 1) - v23 * (v21 - 1), 0.5, 0), 
                tag = "anchor-center-left bg-surface-100 radius-circle", 
                ZIndex = v19 - v21 + 1
            }, {
                UIStroke = l_React_0.createElement("UIStroke", {
                    Color = if l_v11_0.imageBorderStyle then l_v11_0.imageBorderStyle.Color else v12.Color.Extended.Green.Green_800.Color3, 
                    Transparency = if l_v11_0.imageBorderStyle then l_v11_0.imageBorderStyle.Transparency else v12.Color.Extended.Green.Green_800.Transparency, 
                    Thickness = v12.Stroke.Thick
                })
            }));
        end;
        return v20;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        l_v11_0.avatarSize, 
        l_v11_0.images, 
        l_v11_0.imageBackgroundStyle, 
        l_v11_0.imageBorderStyle
    } else l_dependencyArray_0(l_v11_0.avatarSize, l_v11_0.images, l_v11_0.imageBackgroundStyle, l_v11_0.imageBorderStyle));
    return l_React_0.createElement(l_View_0, {
        Size = UDim2.fromOffset(v18, l_v11_0.avatarSize), 
        BackgroundTransparency = 1, 
        LayoutOrder = if l_v11_0.layoutOrder then l_v11_0.layoutOrder else nil
    }, {
        v24
    });
end;
return HorizontalFacepileGroup;