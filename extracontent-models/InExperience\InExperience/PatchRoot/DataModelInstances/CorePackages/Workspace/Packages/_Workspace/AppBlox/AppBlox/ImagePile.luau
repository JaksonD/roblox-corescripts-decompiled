local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.Cryo);
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local l_Core_0 = v4.Core;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = l_Core_0.Style.useStyle;
local v8 = l_Logger_0:new(script.Name);
return function(v9) --[[ Line: 22 ]] --[[ Name: ImagePile ]]
    -- upvalues: l_useStyle_0 (copy), v3 (copy), v1 (copy), v8 (copy), l_ImageSetLabel_0 (copy)
    local l_Tokens_0 = l_useStyle_0().Tokens;
    local v11 = v3.useMemo(function() --[[ Line: 26 ]]
        -- upvalues: l_Tokens_0 (copy)
        return {
            imageBorderColor = l_Tokens_0.Global.Color.White.Color3, 
            imageBorderThickness = l_Tokens_0.Global.Stroke_200
        };
    end, {
        l_Tokens_0
    });
    local v12 = v1.Dictionary.union(v11, v9);
    local v13 = v3.useMemo(function() --[[ Line: 35 ]]
        -- upvalues: l_Tokens_0 (copy)
        return {
            [1] = {
                Attribute1 = {
                    AnchorPoint = Vector2.new(0, 0), 
                    Position = UDim2.fromScale(0, 0), 
                    Size = UDim2.fromOffset(l_Tokens_0.Global.Size_500, l_Tokens_0.Global.Size_500), 
                    ZIndex = 1
                }
            }, 
            [2] = {
                Attribute1 = {
                    AnchorPoint = Vector2.new(0, 1), 
                    Position = UDim2.fromScale(0, 1), 
                    Size = UDim2.fromOffset(l_Tokens_0.Global.Size_350, l_Tokens_0.Global.Size_350), 
                    ZIndex = 2
                }, 
                Attribute2 = {
                    AnchorPoint = Vector2.new(1, 0), 
                    Position = UDim2.fromScale(1, 0), 
                    Size = UDim2.fromOffset(l_Tokens_0.Global.Size_350, l_Tokens_0.Global.Size_350), 
                    ZIndex = 1
                }
            }
        };
    end, {
        l_Tokens_0
    });
    local v16 = v3.useCallback(function(v14, v15) --[[ Line: 62 ]]
        -- upvalues: v13 (copy)
        return v13[math.min(v14, 2)]["Attribute" .. v15];
    end, {
        v13
    });
    local v21 = v3.useMemo(function() --[[ Line: 67 ]]
        -- upvalues: v12 (copy), v8 (ref), v16 (copy), v3 (ref), l_ImageSetLabel_0 (ref)
        local v17 = {};
        for v18, v19 in v12.images do
            if v18 > 2 then
                v8:warning("More than 2 images provided but only the first 2 will be shown.");
                return v17;
            else
                local v20 = v16(#v12.images, v18);
                v19.AnchorPoint = v20.AnchorPoint;
                v19.Position = v20.Position;
                v19.Size = v20.Size;
                v19.ZIndex = v20.ZIndex;
                v17[tostring(v18)] = v3.createElement(l_ImageSetLabel_0, v19, {
                    UICorner = v3.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    }), 
                    UIStroke = v3.createElement("UIStroke", {
                        Color = v12.imageBorderColor, 
                        Thickness = v12.imageBorderThickness, 
                        Transparency = 0
                    })
                });
            end;
        end;
        return v17;
    end, {
        v12.images
    });
    if #v12.images == 0 then
        v8:warning("Cannot have empty list of images");
        return nil;
    else
        return v3.createElement("Frame", {
            [v3.Tag] = "data-testid=ImagePile", 
            BackgroundTransparency = 1, 
            Name = "ImagePile", 
            Size = UDim2.fromOffset(l_Tokens_0.Global.Size_500, l_Tokens_0.Global.Size_500)
        }, v21);
    end;
end;