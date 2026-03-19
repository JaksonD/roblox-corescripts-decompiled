local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppTopBanner");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useTokens_0 = v3.Hooks.useTokens;
local v7 = require(l_script_FirstAncestor_0.Enums.AppTopBannerType);
local v8 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusRoot_0 = v8.FocusRoot;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v8.FocusNavigableSurfaceIdentifierEnum;
local v11 = {
    contentMaps = {}, 
    deviceStatusBarHeight = 0
};
return v4.memo(function(v12) --[[ Line: 28 ]] --[[ Name: AppTopBanner ]]
    -- upvalues: v2 (copy), v11 (copy), l_useTokens_0 (copy), v4 (copy), l_useSelector_0 (copy), v7 (copy), v3 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    v12 = v2.Dictionary.join(v11, v12);
    local v13 = l_useTokens_0();
    local v14, v15 = v4.useState(0);
    local v17 = v4.useCallback(function(v16) --[[ Line: 38 ]]
        if v16.AppTopBanner then
            return v16.AppTopBanner.expanded;
        else
            return false;
        end;
    end, {});
    local v18 = l_useSelector_0(v17);
    local v20 = v4.useCallback(function(v19) --[[ Line: 42 ]]
        return v19.AppTopBanner and v19.AppTopBanner.appTopBannerContentProps;
    end, {});
    local v21 = l_useSelector_0(v20);
    local v23 = v4.useCallback(function(v22) --[[ Line: 46 ]]
        return v22.AppTopBanner and v22.AppTopBanner.onAppTopBannerClick;
    end, {});
    local v24 = l_useSelector_0(v23);
    local v26 = v4.useCallback(function(v25) --[[ Line: 50 ]]
        return v25.AppTopBanner and v25.AppTopBanner.appTopBannerContentHeight;
    end, {});
    local v27 = l_useSelector_0(v26);
    local v29 = v4.useCallback(function(v28) --[[ Line: 54 ]]
        if v28.AppTopBanner then
            return v28.AppTopBanner.isDisabled;
        else
            return false;
        end;
    end, {});
    local v30 = l_useSelector_0(v29);
    v4.useEffect(function() --[[ Line: 61 ]]
        -- upvalues: v18 (copy), v30 (copy), v15 (copy), v27 (copy), v12 (ref)
        if v18 and not v30 then
            v15(v27 + v12.deviceStatusBarHeight);
            return;
        else
            v15(0);
            return;
        end;
    end, {
        v27, 
        v18, 
        v12.deviceStatusBarHeight, 
        v30
    });
    local v32 = v4.useCallback(function(v31) --[[ Line: 77 ]]
        -- upvalues: v7 (ref)
        if v31.AppTopBanner then
            return v31.AppTopBanner.appTopBannerType;
        else
            return v7.None;
        end;
    end, {});
    local v33 = l_useSelector_0(v32);
    local v34 = v12.contentMaps[v33];
    local v35 = v4.createElement(v3.View, {
        Size = UDim2.new(1, 0, 0, v14), 
        backgroundStyle = v13.Color.Extended.Green.Green_800, 
        onActivated = v24, 
        padding = {
            left = UDim.new(0, v13.Padding.XLarge), 
            right = UDim.new(0, v13.Padding.XLarge), 
            top = UDim.new(0, v12.deviceStatusBarHeight)
        }
    }, {
        content = if v34 then v4.createElement(v34, v21) else nil
    });
    return if not (v14 > 0) or v30 then nil else v4.createElement(l_FocusRoot_0, {
        surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.Auxiliary
    }, v35);
end);