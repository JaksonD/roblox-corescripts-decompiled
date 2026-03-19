local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.LuaApp.Components.ShimmerAnimation);
local v4 = require(l_Modules_0.LuaApp.ThemeContext_DEPRECATED);
local l_Decal_0 = Instance.new("Decal");
local v6 = {};
local v7 = v2.PureComponent:extend("LoadableImage");
v7.defaultProps = {
    useShimmerAnimationWhileLoading = false, 
    ScaleType = Enum.ScaleType.Stretch
};
v7.init = function(v8) --[[ Line: 27 ]] --[[ Name: init ]]
    -- upvalues: v6 (copy)
    v8.state = {
        loaded = v6[v8.props.Image]
    };
    v8._isMounted = false;
end;
v7.render = function(v9) --[[ Line: 35 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy)
    local l_Size_0 = v9.props.Size;
    local l_Position_0 = v9.props.Position;
    local l_BorderSizePixel_0 = v9.props.BorderSizePixel;
    local l_BackgroundColor3_0 = v9.props.BackgroundColor3;
    local l_BackgroundTransparency_0 = v9.props.BackgroundTransparency;
    local l_ImageTransparency_0 = v9.props.ImageTransparency;
    local l_ScaleType_0 = v9.props.ScaleType;
    local l_ZIndex_0 = v9.props.ZIndex;
    local l_Image_0 = v9.props.Image;
    local l_loadingImage_0 = v9.props.loadingImage;
    local l_useShimmerAnimationWhileLoading_0 = v9.props.useShimmerAnimationWhileLoading;
    local l_loaded_0 = v9.state.loaded;
    if not l_loaded_0 and l_useShimmerAnimationWhileLoading_0 then
        return v2.createElement(v4.Consumer, {
            render = function(v22) --[[ Line: 51 ]] --[[ Name: render ]]
                -- upvalues: v2 (ref), l_Position_0 (copy), l_BorderSizePixel_0 (copy), l_ZIndex_0 (copy), l_Size_0 (copy), v3 (ref)
                local l_ShimmerPanel_0 = v22.ShimmerPanel;
                return v2.createElement("Frame", {
                    Position = l_Position_0, 
                    BorderSizePixel = l_BorderSizePixel_0, 
                    BackgroundColor3 = l_ShimmerPanel_0.Color, 
                    BackgroundTransparency = l_ShimmerPanel_0.Transparency, 
                    ZIndex = l_ZIndex_0, 
                    Size = l_Size_0
                }, {
                    Shimmer = v2.createElement(v3, {
                        Size = UDim2.new(1, 0, 1, 0)
                    })
                });
            end
        });
    else
        return v2.createElement("ImageLabel", {
            Position = l_Position_0, 
            BorderSizePixel = l_BorderSizePixel_0, 
            BackgroundColor3 = l_BackgroundColor3_0, 
            BackgroundTransparency = l_BackgroundTransparency_0, 
            ImageTransparency = l_ImageTransparency_0, 
            ScaleType = l_ScaleType_0, 
            ZIndex = l_ZIndex_0, 
            Size = l_Size_0, 
            Image = l_loaded_0 and l_Image_0 or l_loadingImage_0
        });
    end;
end;
v7.shouldLoadImage = function(_, v25) --[[ Line: 83 ]] --[[ Name: shouldLoadImage ]]
    -- upvalues: v6 (copy)
    local v26 = false;
    if v25 ~= nil then
        v26 = false;
        if v25 ~= "" then
            v26 = not v6[v25];
        end;
    end;
    return v26;
end;
v7.didUpdate = function(v27, v28) --[[ Line: 87 ]] --[[ Name: didUpdate ]]
    if v28.Image ~= v27.props.Image then
        v27:_loadImage();
    end;
end;
v7.didMount = function(v29) --[[ Line: 94 ]] --[[ Name: didMount ]]
    v29._isMounted = true;
    v29:_loadImage();
end;
v7.willUnmount = function(v30) --[[ Line: 100 ]] --[[ Name: willUnmount ]]
    v30._isMounted = false;
end;
v7._loadImage = function(v31) --[[ Line: 104 ]] --[[ Name: _loadImage ]]
    -- upvalues: v6 (copy), l_Decal_0 (copy), l_ContentProvider_0 (copy)
    local l_Image_1 = v31.props.Image;
    if v31:shouldLoadImage(l_Image_1) then
        if v31.state.loaded then
            v31:setState({
                loaded = false
            });
        end;
        spawn(function() --[[ Line: 124 ]]
            -- upvalues: l_Decal_0 (ref), l_Image_1 (copy), l_ContentProvider_0 (ref), v6 (ref), v31 (copy)
            l_Decal_0.Texture = l_Image_1;
            l_ContentProvider_0:PreloadAsync({
                l_Decal_0
            });
            v6[l_Image_1] = true;
            if v31._isMounted then
                v31:setState({
                    loaded = true
                });
                if v31.props.onLoaded then
                    v31.props.onLoaded();
                end;
            end;
        end);
        return;
    else
        if v6[l_Image_1] and not v31.state.loaded then
            v31:setState({
                loaded = true
            });
        end;
        return;
    end;
end;
v7._mockPreloadDone = function(v33) --[[ Line: 142 ]] --[[ Name: _mockPreloadDone ]]
    -- upvalues: v6 (copy)
    v6[v33] = true;
end;
v7.isLoaded = function(v34) --[[ Line: 146 ]] --[[ Name: isLoaded ]]
    -- upvalues: v2 (copy), v6 (copy)
    if v34 == v2.None or v34 == nil or v34 == "" then
        return false;
    else
        return v6[v34] ~= nil;
    end;
end;
return v7;