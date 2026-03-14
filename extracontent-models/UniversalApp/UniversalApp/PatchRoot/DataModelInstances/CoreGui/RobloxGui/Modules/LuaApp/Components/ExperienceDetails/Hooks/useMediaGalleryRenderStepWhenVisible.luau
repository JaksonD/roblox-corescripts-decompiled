local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_CorePackages_0.Packages.React);
local l_getIsInstanceVisible_0 = require(l_CorePackages_0.Workspace.Packages.VideoUtils).getIsInstanceVisible;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_FFlagLuaAppEdpMediaGalleryRedesign_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesign;
local l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignIxp;
local l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview;
local l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreviewIxp;
local l_FFlagLuaAppEdpMediaGalleryFullScreen_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen;
local l_FIntLuaAppEdpMediaGalleryItemVisiblePercent_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FIntLuaAppEdpMediaGalleryItemVisiblePercent;
return function(v11, v12, v13, v14, v15, v16, v17, v18) --[[ Line: 26 ]] --[[ Name: useMediaGalleryRenderStepWhenVisible ]]
    -- upvalues: l_FFlagLuaAppEdpMediaGalleryRedesign_0 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (copy), l_useSelector_0 (copy), v2 (copy), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (copy), l_getIsInstanceVisible_0 (copy), l_FIntLuaAppEdpMediaGalleryItemVisiblePercent_0 (copy), l_RunService_0 (copy)
    local v19 = if l_FFlagLuaAppEdpMediaGalleryRedesign_0 then not l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 or v17 else nil;
    local v20 = if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then not l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 or v18 else nil;
    local v22 = l_useSelector_0(function(v21) --[[ Line: 44 ]]
        return v21.ScreenSize;
    end);
    local v24 = l_useSelector_0(function(v23) --[[ Line: 48 ]]
        return v23.TopBar.topBarHeight;
    end);
    local v26 = l_useSelector_0(function(v25) --[[ Line: 52 ]]
        return v25.GlobalGuiInset;
    end);
    local v27 = v2.useMemo(function() --[[ Line: 56 ]]
        -- upvalues: v24 (copy), v22 (copy), v26 (copy)
        return {
            min = Vector2.new(0, v24), 
            max = Vector2.new(v22.X, v22.Y - v26.bottom)
        };
    end, {
        v22, 
        v24, 
        v26
    });
    local v28 = v2.useRef(nil);
    local v29 = v2.useRef(nil);
    v2.useEffect(function() --[[ Line: 67 ]]
        -- upvalues: v19 (copy), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (ref), v11 (copy), v12 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (ref), v20 (copy), v13 (copy), v14 (copy), l_getIsInstanceVisible_0 (ref), v27 (copy), l_FIntLuaAppEdpMediaGalleryItemVisiblePercent_0 (ref), v28 (copy), l_RunService_0 (ref), v15 (copy), v16 (copy), v29 (copy)
        if not v19 or l_FFlagLuaAppEdpMediaGalleryFullScreen_0 and (v11 or v12) or l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 and v20 and v13 then
            return nil;
        else
            local v30 = {};
            if v14.current ~= nil then
                local l_current_0 = v14.current;
                local v32 = nil;
                local v33 = nil;
                do
                    local l_v32_0, l_v33_0 = v32, v33;
                    local function v36() --[[ Line: 83 ]] --[[ Name: connectRenderStepIfVisible ]]
                        -- upvalues: l_v32_0 (ref), l_getIsInstanceVisible_0 (ref), l_current_0 (copy), v27 (ref), l_FIntLuaAppEdpMediaGalleryItemVisiblePercent_0 (ref), v28 (ref), l_RunService_0 (ref), v15 (ref), v16 (ref)
                        l_v32_0 = tick();
                        if l_getIsInstanceVisible_0(l_current_0, v27, l_FIntLuaAppEdpMediaGalleryItemVisiblePercent_0) then
                            if not v28.current then
                                v28.current = l_RunService_0.RenderStepped:Connect(v15);
                                return;
                            end;
                        elseif v28.current then
                            v28.current:Disconnect();
                            v28.current = nil;
                            if v16 then
                                v16();
                            end;
                        end;
                    end;
                    local function v38() --[[ Line: 108 ]] --[[ Name: onScrollingFrameLayoutChange ]]
                        -- upvalues: l_v33_0 (ref), l_v32_0 (ref), v36 (copy), v29 (ref)
                        if l_v33_0 ~= nil then
                            return;
                        else
                            local v37 = 0;
                            if l_v32_0 ~= nil then
                                l_v33_0 = l_v32_0 + 0.5;
                                v37 = l_v33_0 - tick();
                            end;
                            if v37 > 0 then
                                v29.current = task.delay(v37, function() --[[ Line: 121 ]]
                                    -- upvalues: l_v33_0 (ref), v36 (ref)
                                    l_v33_0 = nil;
                                    v36();
                                end);
                                return;
                            else
                                l_v33_0 = nil;
                                v36();
                                return;
                            end;
                        end;
                    end;
                    v36();
                    v30 = {
                        l_current_0:GetPropertyChangedSignal("AbsolutePosition"):Connect(v38), 
                        l_current_0:GetPropertyChangedSignal("AbsoluteSize"):Connect(v38)
                    };
                end;
            end;
            return function() --[[ Line: 141 ]]
                -- upvalues: v30 (ref), v28 (ref), v16 (ref), v29 (ref)
                for _, v40 in v30 do
                    v40:Disconnect();
                end;
                if v28.current then
                    v28.current:Disconnect();
                    v28.current = nil;
                    if v16 then
                        v16();
                    end;
                end;
                if v29.current then
                    task.cancel(v29.current);
                    v29.current = nil;
                end;
            end;
        end;
    end, {
        if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v11 else nil, 
        if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v12 else nil, 
        if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 and v20 then v13 else nil, 
        v14, 
        v15, 
        v16, 
        if l_FFlagLuaAppEdpMediaGalleryRedesign_0 then v19 else nil, 
        if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then v20 else nil, 
        v27
    });
end;