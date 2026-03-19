local l_AssetService_0 = game:GetService("AssetService");
local l_Parent_0 = script:FindFirstAncestor("QRCodeDisplay").Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Dash);
local v4 = require(script.Parent.drawImage);
local v5 = {
    backgroundColor3 = Color3.fromRGB(255, 255, 255), 
    backgroundTransparency = 0, 
    pixelColor3 = Color3.fromRGB(0, 0, 0), 
    pixelTransparency = 0, 
    sideLength = 200
};
local function _(v6, v7) --[[ Line: 36 ]] --[[ Name: getQrCodeImageSize ]]
    if not v7 then
        return v6;
    else
        assert(type(v7) == "number", "rotation must be a number");
        if v7 % 90 == 0 then
            return v6;
        else
            local v8 = math.rad(v7);
            return (math.round(v6 / (math.sin(v8) + math.cos(v8))));
        end;
    end;
end;
return function(v10) --[[ Line: 51 ]]
    -- upvalues: v3 (copy), v5 (copy), v2 (copy), l_AssetService_0 (copy), v4 (copy)
    local v11 = v3.join(v5, v10);
    local v12, v13 = v2.useState(nil);
    local v14 = v2.createRef();
    local l_sideLength_0 = v11.sideLength;
    local l_qrCodeRotation_0 = v11.qrCodeRotation;
    local v17;
    if not l_qrCodeRotation_0 then
        v17 = l_sideLength_0;
    else
        assert(type(l_qrCodeRotation_0) == "number", "rotation must be a number");
        if l_qrCodeRotation_0 % 90 == 0 then
            v17 = l_sideLength_0;
        else
            local v18 = math.rad(l_qrCodeRotation_0);
            v17 = math.round(l_sideLength_0 / (math.sin(v18) + math.cos(v18)));
        end;
    end;
    v2.useEffect(function() --[[ Line: 58 ]]
        -- upvalues: v14 (copy), v17 (copy), l_AssetService_0 (ref), v13 (copy), v4 (ref), v11 (copy)
        if not v14.current or v14.current.Size.X ~= v17 then
            v14.current = l_AssetService_0:CreateEditableImage({
                Size = Vector2.new(v17, v17)
            });
            v13(Content.fromObject(v14.current));
        end;
        v4(v14.current, v17, v11.qrCodeMatrix, v11.pixelColor3, v11.pixelTransparency);
    end, {
        v17, 
        v11.qrCodeMatrix, 
        v11.pixelColor3, 
        v11.pixelTransparency
    });
    return v2.createElement("Frame", {
        BackgroundColor3 = v11.backgroundColor3, 
        BackgroundTransparency = v11.backgroundTransparency, 
        BorderSizePixel = 0, 
        Size = UDim2.fromOffset(v11.sideLength, v11.sideLength)
    }, {
        ImageLabel = v2.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            ImageContent = v12, 
            Position = UDim2.fromScale(0.5, 0.5), 
            Rotation = v11.qrCodeRotation, 
            Size = UDim2.fromOffset(v17, v17)
        })
    });
end;