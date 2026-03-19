local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v3 = require(l_Parent_1.Foundation);
local v4 = require(l_Parent_1.React);
local l_Skeleton_0 = v3.Skeleton;
local l_View_0 = v3.View;
local v7 = require(l_Parent_0.Utils.getCropSize);
local v8 = require(l_Parent_0.Utils.getFitSize);
local v9 = require(l_Parent_0.Enums.LoadingState);
local v10 = require(l_Parent_0.Flags.FFlagUseRbxStorageInCapturesCommon);
return function(v11) --[[ Line: 36 ]]
    -- upvalues: v4 (copy), v9 (copy), l_ContentProvider_0 (copy), l_View_0 (copy), v8 (copy), v7 (copy), v10 (copy), l_Skeleton_0 (copy)
    local v12, v13 = v4.useState(Vector2.new(0, 0));
    local v14, v15 = v4.useState(v9.Loading);
    local v16, v17 = v4.useState(Vector2.new(0, 0));
    v4.useEffect(function() --[[ Line: 41 ]]
        -- upvalues: v11 (copy), l_ContentProvider_0 (ref), v15 (copy), v9 (ref)
        if v11.Video == nil or v11.Video == "" then
            return;
        else
            local v19 = l_ContentProvider_0:GetAssetFetchStatusChangedSignal(v11.Video):Connect(function(v18) --[[ Line: 47 ]]
                -- upvalues: v15 (ref), v9 (ref)
                if v18 == Enum.AssetFetchStatus.Failure then
                    v15(v9.Failed);
                end;
            end);
            return function() --[[ Line: 53 ]]
                -- upvalues: v19 (copy), v15 (ref), v9 (ref)
                v19:Disconnect();
                v15(v9.Loading);
            end;
        end;
    end, {
        v11.Video
    });
    local v21 = v4.useCallback(function(v20) --[[ Line: 59 ]]
        -- upvalues: v13 (copy)
        v13(v20.AbsoluteSize);
    end, {
        v13
    });
    local v24 = v4.useCallback(function(v22) --[[ Line: 63 ]]
        -- upvalues: v17 (copy), v11 (copy)
        local l_Resolution_0 = v22.Resolution;
        v17(l_Resolution_0);
        if v11.onResolutionChanged then
            v11.onResolutionChanged(l_Resolution_0);
        end;
    end, {
        v11.onResolutionChanged, 
        v17
    });
    local v26 = v4.useCallback(function(v25) --[[ Line: 72 ]]
        -- upvalues: v14 (copy), v9 (ref), v15 (copy), v11 (copy)
        if v14 == v9.Loading then
            v15(v9.Finished);
        end;
        v11.onLoaded(v25);
    end, {
        v14, 
        v11.onLoaded
    });
    if v14 == v9.Failed then
        return v11.renderOnFailed();
    else
        local l_createElement_0 = v4.createElement;
        local l_l_View_0_0 = l_View_0;
        local v29 = {
            AnchorPoint = v11.AnchorPoint, 
            BackgroundTransparency = v11.BackgroundTransparency, 
            ClipsDescendants = true, 
            isDisabled = true, 
            onAbsoluteSizeChanged = v21, 
            Position = v11.Position, 
            Size = v11.Size, 
            ZIndex = v11.ZIndex
        };
        local v30 = {};
        local l_createElement_1 = v4.createElement;
        local v32 = "VideoFrame";
        local v33 = {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Looped = v11.Looped == nil or v11.Looped, 
            Playing = v11.Playing, 
            Position = UDim2.fromScale(0.5, 0.5), 
            ref = v11.videoRef, 
            Size = if v11.scaleType == Enum.ScaleType.Fit then v8(v12, v16) else if v11.scaleType == Enum.ScaleType.Crop then v7(v12, v16) else UDim2.fromScale(1, 1), 
            Video = v11.Video, 
            VideoContent = if v10 then v11.VideoContent else nil
        };
        local v34 = false;
        if v16.X > 0 then
            v34 = v16.Y > 0;
        end;
        v33.Visible = v34;
        v33[v4.Change.Resolution] = v24;
        v33[v4.Event.Loaded] = v26;
        v30.VideoFrame = l_createElement_1(v32, v33, {
            Corner = if v11.cornerRadius then v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, v11.cornerRadius)
            }) else nil
        });
        v30.Shimmer = if v14 ~= v9.Finished then v4.createElement(l_Skeleton_0, {
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 2
        }) else nil;
        return l_createElement_0(l_l_View_0_0, v29, v30);
    end;
end;