local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_script_FirstAncestor_0.dependencies);
local l_dependencyArray_0 = v3.Hooks.dependencyArray;
local l_Foundation_0 = v3.Foundation;
local l_React_0 = v3.React;
local l_useTokens_0 = l_Foundation_0.Hooks.useTokens;
local l_Image_0 = l_Foundation_0.Image;
local l_View_0 = l_Foundation_0.View;
HorizontalFacepileGroup = function(v10) --[[ Line: 26 ]] --[[ Name: HorizontalFacepileGroup ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), l_React_0 (copy), l_dependencyArray_0 (copy), l_Image_0 (copy), l_View_0 (copy)
    local v11 = l_useTokens_0();
    local l_v10_0 = v10;
    local v13 = {
        avatarSize = 0, 
        images = {}, 
        layoutOrder = 1, 
        imageBackgroundStyle = nil, 
        imageBorderStyle = {
            Color = v11.Color.Extended.Green.Green_800.Color3, 
            Transparency = v11.Color.Extended.Green.Green_800.Transparency
        }
    };
    l_v10_0 = v2.Dictionary.union(v13, v10);
    local v17 = l_React_0.useMemo(function() --[[ Line: 44 ]]
        -- upvalues: l_v10_0 (ref)
        local v14 = #l_v10_0.images;
        if v14 <= 0 then
            return 0;
        else
            local l_avatarSize_0 = l_v10_0.avatarSize;
            for _ = 2, v14 do
                l_avatarSize_0 = l_avatarSize_0 + (l_v10_0.avatarSize - 4);
            end;
            return l_avatarSize_0;
        end;
    end, l_dependencyArray_0(#l_v10_0.images, l_v10_0.avatarSize));
    local v23 = l_React_0.useMemo(function() --[[ Line: 59 ]]
        -- upvalues: l_v10_0 (ref), l_React_0 (ref), l_Image_0 (ref), v11 (copy)
        local v18 = #l_v10_0.images;
        local v19 = {};
        for v20, v21 in ipairs(l_v10_0.images) do
            local v22 = v20 == 1 and 0 or 4;
            table.insert(v19, l_React_0.createElement(l_Image_0, {
                Image = v21, 
                backgroundStyle = if l_v10_0.imageBackgroundStyle then l_v10_0.imageBackgroundStyle else nil, 
                Size = UDim2.fromOffset(l_v10_0.avatarSize, l_v10_0.avatarSize), 
                Position = UDim2.new(0, l_v10_0.avatarSize * (v20 - 1) - v22 * (v20 - 1), 0.5, 0), 
                tag = "anchor-center-left bg-surface-100 radius-circle", 
                ZIndex = v18 - v20 + 1
            }, {
                UIStroke = l_React_0.createElement("UIStroke", {
                    Color = if l_v10_0.imageBorderStyle then l_v10_0.imageBorderStyle.Color else v11.Color.Extended.Green.Green_800.Color3, 
                    Transparency = if l_v10_0.imageBorderStyle then l_v10_0.imageBorderStyle.Transparency else v11.Color.Extended.Green.Green_800.Transparency, 
                    Thickness = v11.Stroke.Thick
                })
            }));
        end;
        return v19;
    end, l_dependencyArray_0(l_v10_0.avatarSize, l_v10_0.images, l_v10_0.imageBackgroundStyle, l_v10_0.imageBorderStyle));
    return l_React_0.createElement(l_View_0, {
        Size = UDim2.fromOffset(v17, l_v10_0.avatarSize), 
        BackgroundTransparency = 1, 
        LayoutOrder = if l_v10_0.layoutOrder then l_v10_0.layoutOrder else nil
    }, {
        v23
    });
end;
return HorizontalFacepileGroup;