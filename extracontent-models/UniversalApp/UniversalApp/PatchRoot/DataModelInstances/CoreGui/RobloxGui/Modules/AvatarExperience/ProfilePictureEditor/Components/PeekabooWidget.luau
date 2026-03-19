local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_CorePackages_0.Packages.t);
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local v8 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetPeekabooLayoutDetails);
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local l_withNavigation_0 = require(l_CorePackages_0.Packages.RoactNavigation).withNavigation;
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.SharedInteractionFrame);
local v12 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXF10ftFixPeekabooWidget);
local l_withStyle_0 = v9.Style.withStyle;
local v14 = v2.PureComponent:extend("PeekabooWidget");
v14.validateProps = v6.strictInterface({
    viewportYScale = v6.number, 
    viewportXScale = v6.number, 
    topMarginYScale = v6.number, 
    renderBottomContents = v6.callback, 
    renderMiddleContents = v6.callback, 
    panByPixels = v6.optional(v6.callback), 
    rotateByPixels = v6.optional(v6.callback), 
    setAngularVelocityByPixels = v6.optional(v6.callback), 
    zoomToPoint = v6.optional(v6.callback), 
    globalGuiInset = if v12 then nil else v6.strictInterface({
        left = v6.integer, 
        top = v6.integer, 
        right = v6.integer, 
        bottom = v6.integer
    }), 
    screenSize = if v12 then nil else v6.Vector2, 
    containerSize = if v12 then v6.Vector2 else nil, 
    setPeekabooLayoutDetails = v6.callback, 
    navigation = v6.table
});
v14.init = function(v15) --[[ Line: 67 ]] --[[ Name: init ]]
    v15:deriveDetailsFromProps(v15.props);
    v15.panByPixels = function(v16) --[[ Line: 70 ]]
        -- upvalues: v15 (copy)
        if v15.props.panByPixels then
            v15.props.panByPixels(v16);
        end;
    end;
    v15.rotateByPixels = function(v17) --[[ Line: 75 ]]
        -- upvalues: v15 (copy)
        if v15.props.rotateByPixels then
            v15.props.rotateByPixels(v17);
        end;
    end;
    v15.setAngularVelocityByPixels = function(v18) --[[ Line: 80 ]]
        -- upvalues: v15 (copy)
        if v15.props.setAngularVelocityByPixels then
            v15.props.setAngularVelocityByPixels(v18);
        end;
    end;
    v15.zoomToPoint = function(v19, v20) --[[ Line: 85 ]]
        -- upvalues: v15 (copy)
        if v15.props.zoomToPoint then
            v15.props.zoomToPoint(v19, v20);
        end;
    end;
end;
v14.postToRodux = function(v21) --[[ Line: 92 ]] --[[ Name: postToRodux ]]
    local l_routeName_0 = v21.props.navigation.state.routeName;
    v21.props.setPeekabooLayoutDetails(l_routeName_0, v21.safeAreaSize.Y.Offset, v21.topYPix, v21.viewportSizePix);
end;
v14.getFrameDetails = function(v23, v24) --[[ Line: 98 ]] --[[ Name: getFrameDetails ]]
    local v25 = v23.safeAreaSize.X.Offset * v24.viewportXScale;
    local v26 = v23.safeAreaSize.Y.Offset * v24.viewportYScale;
    if v25 < v26 then
        v23.viewportSizePix = math.floor(v25 + 0.5);
    else
        v23.viewportSizePix = math.floor(v26 + 0.5);
    end;
    v23.topYPix = math.floor(v23.safeAreaSize.Y.Offset * v24.topMarginYScale + 0.5);
    v23.sideXPix = math.floor((v23.safeAreaSize.X.Offset - v23.viewportSizePix) / 2 + 0.5);
end;
v14.deriveDetailsFromProps = function(v27, v28) --[[ Line: 111 ]] --[[ Name: deriveDetailsFromProps ]]
    -- upvalues: v12 (copy), l_getSafeAreaSize_0 (copy)
    local l_screenSize_0 = v28.screenSize;
    local l_globalGuiInset_0 = v28.globalGuiInset;
    local l_containerSize_0 = v28.containerSize;
    v27.safeAreaSize = if v12 then UDim2.fromOffset(l_containerSize_0.X, l_containerSize_0.Y) else l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0);
    v27:getFrameDetails(v28);
    v27:postToRodux();
end;
v14.willUpdate = function(v32, v33, _) --[[ Line: 122 ]] --[[ Name: willUpdate ]]
    v32:deriveDetailsFromProps(v33);
end;
v14.renderWithProviders = function(v35, v36) --[[ Line: 126 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v2 (copy), v11 (copy)
    local l_Theme_0 = v36.Theme;
    return v2.createFragment({
        TopFrame = v2.createElement("Frame", {
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            ZIndex = 0, 
            Size = UDim2.new(1, 0, 0, v35.topYPix), 
            Position = UDim2.fromOffset(0, 0)
        }), 
        LeftMiddleFrame = v2.createElement("Frame", {
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            ZIndex = 0, 
            Size = UDim2.new(0, v35.sideXPix, 0, v35.viewportSizePix), 
            Position = UDim2.fromOffset(0, v35.topYPix)
        }), 
        MiddleFrame = v2.createElement(v11, {
            ZIndex = -1, 
            Size = UDim2.new(0, v35.viewportSizePix, 0, v35.viewportSizePix), 
            Position = UDim2.fromOffset(v35.sideXPix, v35.topYPix), 
            panByPixels = v35.panByPixels, 
            rotateByPixels = v35.rotateByPixels, 
            setAngularVelocityByPixels = v35.setAngularVelocityByPixels, 
            zoomToPoint = v35.zoomToPoint
        }, {
            Contents = v35.props.renderMiddleContents()
        }), 
        RightMiddleFrame = v2.createElement("Frame", {
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            ZIndex = 0, 
            AnchorPoint = Vector2.new(1, 0), 
            Size = UDim2.new(0, v35.safeAreaSize.X.Offset - v35.sideXPix - v35.viewportSizePix, 0, v35.viewportSizePix), 
            Position = UDim2.new(1, 0, 0, v35.topYPix)
        }), 
        BottomFrame = v2.createElement("Frame", {
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            AnchorPoint = Vector2.new(0, 1), 
            Size = UDim2.new(1, 0, 0, v35.safeAreaSize.Y.Offset - v35.topYPix - v35.viewportSizePix), 
            Position = UDim2.fromScale(0, 1)
        }, {
            Contents = v35.props.renderBottomContents()
        })
    });
end;
v14.render = function(v38) --[[ Line: 188 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v39) --[[ Line: 189 ]]
        -- upvalues: v38 (copy)
        return v38:renderWithProviders(v39);
    end);
end;
v14 = l_withNavigation_0(v4.connect(if v12 then nil else function(v40, _) --[[ Line: 197 ]]
    return {
        globalGuiInset = v40.GlobalGuiInset, 
        screenSize = v40.ScreenSize
    };
end, function(v42) --[[ Line: 203 ]]
    -- upvalues: v8 (copy)
    return {
        setPeekabooLayoutDetails = function(v43, v44, v45, v46) --[[ Line: 205 ]] --[[ Name: setPeekabooLayoutDetails ]]
            -- upvalues: v42 (copy), v8 (ref)
            v42(v8(v43, v44, v45, v46));
        end
    };
end)(v14), nil);
local function v53(v47) --[[ Line: 214 ]] --[[ Name: PeekabooWidgetWrapper ]]
    -- upvalues: v3 (copy), v14 (ref), v5 (copy)
    local v48, v49 = v3.useState(Vector2.zero);
    local v50 = v3.useRef(nil);
    local v52 = v3.useCallback(function(v51) --[[ Line: 218 ]]
        -- upvalues: v49 (copy)
        v49(v51.AbsoluteSize);
    end, {});
    v3.useLayoutEffect(function() --[[ Line: 222 ]]
        -- upvalues: v52 (copy), v50 (copy)
        v52(v50.current);
    end, {
        v52
    });
    return v3.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        ref = v50, 
        [v3.Change.AbsoluteSize] = v52
    }, {
        PeekabooWidget = v3.createElement(v14, v5.Dictionary.join(v47, {
            containerSize = v48
        }))
    });
end;
return if v12 then v53 else v14;