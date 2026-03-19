local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local v3 = require(l_CorePackages_0.Packages.t);
local l_InteractiveAlert_0 = require(l_CorePackages_0.Packages.UIBlox).App.Dialog.Alert.InteractiveAlert;
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v7 = require(l_Parent_0.HumanoidViewport);
local v8 = require(l_Parent_1.GetConformedHumanoidDescription);
local v9 = v1.PureComponent:extend("PromptWithAvatarViewport");
v9.validateProps = v3.strictInterface({
    humanoidDescription = v3.instanceOf("HumanoidDescription"), 
    rigType = v3.enum(Enum.HumanoidRigType), 
    title = v3.string, 
    bodyText = v3.optional(v3.string), 
    buttonStackInfo = v3.table, 
    screenSize = v3.Vector2
});
v9.init = function(v10) --[[ Line: 41 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v10.mounted = false;
    v10.middleContentRef = v1.createRef();
    local v11, v12 = v1.createBinding(UDim2.new(1, 0, 0, 200));
    v10.contentSize = v11;
    v10.updateContentSize = v12;
    v10:setState({
        conformedHumanoidDescription = nil, 
        getConformedDescriptionFailed = false
    });
    v10.onAlertSizeChanged = function(v13) --[[ Line: 52 ]]
        -- upvalues: v10 (copy)
        local l_AbsoluteSize_0 = v13.AbsoluteSize;
        if not v10.middleContentRef:getValue() then
            return;
        else
            local l_Y_0 = v10.middleContentRef:getValue().AbsoluteSize.Y;
            local v16 = l_AbsoluteSize_0.Y - l_Y_0;
            local v17 = v10.props.screenSize.Y - 60 - v16;
            local v18 = v10.middleContentRef:getValue().AbsoluteSize.X - 20;
            if v18 < v17 then
                v17 = v18;
            end;
            if l_Y_0 ~= v17 then
                v10.updateContentSize(UDim2.new(1, 0, 0, v17));
            end;
            return;
        end;
    end;
    v10.retryLoadDescription = function() --[[ Line: 74 ]]
        -- upvalues: v10 (copy)
        v10:setState({
            getConformedDescriptionFailed = false
        });
        v10:getConformedHumanoidDescription();
    end;
end;
v9.renderAlertMiddleContent = function(v19) --[[ Line: 83 ]] --[[ Name: renderAlertMiddleContent ]]
    -- upvalues: v1 (copy), v7 (copy)
    local l_conformedHumanoidDescription_0 = v19.state.conformedHumanoidDescription;
    local l_getConformedDescriptionFailed_0 = v19.state.getConformedDescriptionFailed;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = v19.contentSize, 
        [v1.Ref] = v19.middleContentRef
    }, {
        HumanoidViewport = v1.createElement(v7, {
            humanoidDescription = l_conformedHumanoidDescription_0, 
            loadingFailed = l_getConformedDescriptionFailed_0, 
            retryLoadDescription = v19.retryLoadDescription, 
            rigType = v19.props.rigType
        })
    });
end;
v9.render = function(v22) --[[ Line: 102 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_InteractiveAlert_0 (copy)
    return v1.createElement(l_InteractiveAlert_0, {
        title = v22.props.title, 
        bodyText = v22.props.bodyText, 
        buttonStackInfo = v22.props.buttonStackInfo, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = v22.props.screenSize, 
        middleContent = function() --[[ Line: 109 ]] --[[ Name: middleContent ]]
            -- upvalues: v22 (copy)
            return v22:renderAlertMiddleContent();
        end, 
        onAbsoluteSizeChanged = v22.onAlertSizeChanged, 
        isMiddleContentFocusable = false
    });
end;
v9.getConformedHumanoidDescription = function(v23, v24) --[[ Line: 117 ]] --[[ Name: getConformedHumanoidDescription ]]
    -- upvalues: v8 (copy)
    v8(v24, true):andThen(function(v25) --[[ Line: 119 ]]
        -- upvalues: v23 (copy)
        if not v23.mounted then
            return;
        else
            v23:setState({
                conformedHumanoidDescription = v25
            });
            return;
        end;
    end, function(_) --[[ Line: 127 ]]
        -- upvalues: v23 (copy)
        if not v23.mounted then
            return;
        else
            v23:setState({
                getConformedDescriptionFailed = true
            });
            return;
        end;
    end);
end;
v9.didMount = function(v27) --[[ Line: 138 ]] --[[ Name: didMount ]]
    v27.mounted = true;
    v27:getConformedHumanoidDescription(v27.props.humanoidDescription);
end;
v9.didUpdate = function(v28, v29, _) --[[ Line: 144 ]] --[[ Name: didUpdate ]]
    -- upvalues: v1 (copy)
    if v29.humanoidDescription ~= v28.props.humanoidDescription then
        v28:setState({
            conformedHumanoidDescription = v1.None, 
            getConformedDescriptionFailed = false
        });
        v28:getConformedHumanoidDescription(v28.props.humanoidDescription);
    end;
end;
v9.willUnmount = function(v31) --[[ Line: 155 ]] --[[ Name: willUnmount ]]
    v31.mounted = false;
end;
return (v2.connect(function(v32) --[[ Line: 159 ]] --[[ Name: mapStateToProps ]]
    return {
        screenSize = v32.screenSize
    };
end, nil)(v9));