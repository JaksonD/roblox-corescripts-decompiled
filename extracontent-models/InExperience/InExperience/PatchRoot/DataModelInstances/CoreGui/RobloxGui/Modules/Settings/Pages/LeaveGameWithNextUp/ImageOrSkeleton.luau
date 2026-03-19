local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_RunService_0 = game:GetService("RunService");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Foundation);
local l_Skeleton_0 = v4.Skeleton;
local l_Image_0 = v4.Image;
local l_View_0 = v4.View;
return function(v8) --[[ Line: 32 ]]
    -- upvalues: v3 (copy), l_ContentProvider_0 (copy), l_RunService_0 (copy), l_View_0 (copy), l_Skeleton_0 (copy), l_Image_0 (copy)
    local v9 = v3.useRef(nil);
    local v10, v11 = v3.useState(false);
    local v12 = v3.useRef(false);
    local v14 = v3.useCallback(function(v13) --[[ Line: 37 ]]
        -- upvalues: v12 (copy), v8 (copy)
        if v13 == v12.current then
            return;
        else
            v12.current = v13;
            if v8.onImageStateChanged then
                v8.onImageStateChanged(v13);
            end;
            return;
        end;
    end, {
        v8.onImageStateChanged
    });
    v3.useEffect(function() --[[ Line: 48 ]]
        -- upvalues: v8 (copy), v11 (copy), v14 (copy), l_ContentProvider_0 (ref), v9 (copy), l_RunService_0 (ref)
        local l_Image_1 = v8.Image;
        if not l_Image_1 then
            v11(false);
            v14(false);
            return;
        else
            local v16 = time();
            local function v23() --[[ Line: 57 ]] --[[ Name: checkImageState ]]
                -- upvalues: l_ContentProvider_0 (ref), l_Image_1 (copy), v16 (copy), v9 (ref), v14 (ref), v11 (ref)
                local l_l_ContentProvider_0_AssetFetchStatus_0 = l_ContentProvider_0:GetAssetFetchStatus(l_Image_1);
                local v18 = time() - v16 >= 1;
                local v19 = true;
                if l_l_ContentProvider_0_AssetFetchStatus_0 ~= Enum.AssetFetchStatus.Success then
                    v19 = v18 and l_l_ContentProvider_0_AssetFetchStatus_0 == Enum.AssetFetchStatus.None;
                end;
                local v20 = (if v9.current then v9.current.IsLoaded else false) or v19;
                v14(v20);
                local v21 = true;
                if l_l_ContentProvider_0_AssetFetchStatus_0 ~= Enum.AssetFetchStatus.Failure then
                    v21 = l_l_ContentProvider_0_AssetFetchStatus_0 == Enum.AssetFetchStatus.TimedOut;
                end;
                local v22 = v20 or v21;
                v11(v22);
                return v22;
            end;
            if v23() then
                return;
            else
                local v24 = nil;
                local _ = function() --[[ Line: 79 ]] --[[ Name: disconnect ]]
                    -- upvalues: v24 (ref)
                    if not v24 then
                        return;
                    else
                        for _, v26 in v24 do
                            v26:Disconnect();
                        end;
                        v24 = nil;
                        return;
                    end;
                end;
                local function v30() --[[ Line: 90 ]] --[[ Name: onStateMayHaveChanged ]]
                    -- upvalues: v23 (copy), v24 (ref)
                    if v23() then
                        if not v24 then
                            return;
                        else
                            for _, v29 in v24 do
                                v29:Disconnect();
                            end;
                            v24 = nil;
                        end;
                    end;
                end;
                v24 = {
                    l_ContentProvider_0:GetAssetFetchStatusChangedSignal(l_Image_1):Connect(v30), 
                    l_RunService_0.RenderStepped:Connect(v30)
                };
                return function() --[[ Line: 101 ]]
                    -- upvalues: v24 (ref)
                    if not v24 then
                        return;
                    else
                        for _, v32 in v24 do
                            v32:Disconnect();
                        end;
                        v24 = nil;
                        return;
                    end;
                end;
            end;
        end;
    end, {
        v8.Image, 
        v14
    });
    return v3.createElement(l_View_0, {
        Size = v8.Size, 
        SizeConstraint = v8.SizeConstraint, 
        LayoutOrder = v8.LayoutOrder
    }, {
        skeleton = if not v10 then v3.createElement(l_Skeleton_0, {
            tag = "size-full-full"
        }) else nil, 
        image = if v8.Image then v3.createElement(l_Image_0, {
            ref = v9, 
            tag = ("size-full-full %*"):format(v8.tag), 
            Image = v8.Image, 
            BackgroundTransparency = 1, 
            ZIndex = 2, 
            onActivated = v8.onActivated
        }) else nil
    });
end;