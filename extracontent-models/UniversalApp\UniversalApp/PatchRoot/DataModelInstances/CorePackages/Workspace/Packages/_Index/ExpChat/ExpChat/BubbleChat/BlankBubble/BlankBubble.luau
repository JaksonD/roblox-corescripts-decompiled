local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_Parent_0.Otter);
local v5 = require(l_script_FirstAncestor_0.Config);
local l_script_FirstAncestor_1 = script:FindFirstAncestor("BubbleChat");
local v7 = require(l_script_FirstAncestor_1.Helpers.getSpringFromSettings);
local v8 = require(l_script_FirstAncestor_0.ClientSettings.ClientSettingsUtility);
local v9 = v3.PureComponent:extend("BlankBubble");
v9.init = function(v10, v11) --[[ Line: 23 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v4 (copy)
    v10.state = {};
    local v12, v13 = v3.createBinding(0);
    v10.width = v12;
    v10.updateWidth = v13;
    v10.widthMotor = v4.createSingleMotor(0);
    v10.widthMotor:onStep(function(v14) --[[ Line: 27 ]]
        -- upvalues: v10 (copy)
        v10.updateWidth((math.round(v14)));
    end);
    v10.frameSize = v10.width:map(function(v15) --[[ Line: 31 ]]
        -- upvalues: v10 (copy)
        if v10.props.insertSize then
            return UDim2.fromOffset(v15, v10.props.insertSize.Y + v10.props.chatSettings.Padding * 2);
        else
            return UDim2.fromOffset(v15, 0);
        end;
    end);
    v12, v13 = v3.createBinding(1);
    v10.transparency = v12;
    v10.updateTransparency = v13;
    v10.transparencyMotor = v4.createSingleMotor(1);
    v10.transparencyMotor:onStep(v10.updateTransparency);
    v12, v13 = v3.createBinding(1);
    v10.backgroundTransparency = v12;
    v10.updateBackgroundTransparency = v13;
    v10.backgroundTransparencyMotor = v4.createSingleMotor(1);
    v10.backgroundTransparencyMotor:onStep(v10.updateBackgroundTransparency);
    if v11.fadingOut then
        v10:fadeOut();
    end;
end;
v9.getDerivedStateFromProps = function(v16, v17) --[[ Line: 54 ]] --[[ Name: getDerivedStateFromProps ]]
    local v18 = 0;
    if v16.insertSize then
        v18 = v16.insertSize.X + v16.chatSettings.Padding * 2;
    end;
    if v18 ~= v17.fullWidth then
        return {
            fullWidth = v18
        };
    else
        return nil;
    end;
end;
v9.render = function(v19) --[[ Line: 69 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v3 (copy), l_Dictionary_0 (copy)
    local l_chatSettings_0 = v19.props.chatSettings;
    local l_ImageLabel_0 = l_chatSettings_0.ImageLabel;
    local l_UIGradient_0 = l_chatSettings_0.UIGradient;
    local l_UICorner_0 = l_chatSettings_0.UICorner;
    local l_CornerRadius_0 = v5.DefaultBubbleChatChildrenCustomizationProperties.UICorner.CornerRadius;
    local v25 = 0;
    if v19.props.insertSize then
        v25 = v19.props.insertSize.Y + v19.props.chatSettings.Padding * 2;
    end;
    local l_createElement_0 = v3.createElement;
    local v27 = "Frame";
    local v28 = {
        AnchorPoint = Vector2.new(0.5, 1), 
        Size = UDim2.fromOffset(v19.state.fullWidth, v25), 
        Position = UDim2.new(0.5, 0, 1, -8), 
        Transparency = 1
    };
    local v29 = {
        Scale = v3.createElement("UIScale", {
            Scale = v19.props.isDistant and 0.75 or 1
        })
    };
    local l_TailVisible_0 = v19.props.chatSettings.TailVisible;
    if l_TailVisible_0 then
        l_TailVisible_0 = v3.createElement;
        local v31 = "ImageLabel";
        local v32 = {
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0.5, 0, 1, -1), 
            Size = UDim2.fromOffset(12, 8), 
            Image = "rbxasset://textures/ui/InGameChat/Caret.png", 
            ImageColor3 = l_chatSettings_0.BackgroundColor3, 
            ImageTransparency = v19.backgroundTransparency
        };
        local v33 = {};
        local v34 = false;
        if l_UIGradient_0 ~= nil then
            v34 = v3.createElement("UIGradient", l_UIGradient_0);
        end;
        v33.Gradient = v34;
        l_TailVisible_0 = l_TailVisible_0(v31, v32, v33);
    end;
    v29.Caret = l_TailVisible_0;
    l_TailVisible_0 = v3.createElement;
    local v35 = "ImageLabel";
    local v36 = l_Dictionary_0.join(l_ImageLabel_0, {
        Size = v19.frameSize, 
        BackgroundColor3 = l_chatSettings_0.BackgroundColor3, 
        BackgroundTransparency = l_ImageLabel_0 and l_ImageLabel_0.Image ~= "" and 1 or v19.backgroundTransparency or v19.transparency, 
        BorderSizePixel = 0, 
        AnchorPoint = Vector2.new(0.5, 0), 
        Position = UDim2.new(0.5, 0, 0, 0), 
        ClipsDescendants = true, 
        ImageTransparency = v19.backgroundTransparency or v19.transparency, 
        Image = l_ImageLabel_0 and l_ImageLabel_0.Image or ""
    });
    local v37 = {
        UICorner = l_UICorner_0 and v3.createElement("UICorner", {
            CornerRadius = l_UICorner_0.CornerRadius
        }) or v3.createElement("UICorner", {
            CornerRadius = l_CornerRadius_0
        }), 
        Contents = v3.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1
        }, {
            Padding = v3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v19.props.chatSettings.Padding), 
                PaddingRight = UDim.new(0, v19.props.chatSettings.Padding), 
                PaddingBottom = UDim.new(0, v19.props.chatSettings.Padding), 
                PaddingLeft = UDim.new(0, v19.props.chatSettings.Padding)
            }), 
            Insert = v19.props.renderInsert and v19.props.renderInsert()
        })
    };
    local v38 = false;
    if l_UIGradient_0 ~= nil then
        v38 = v3.createElement("UIGradient", l_UIGradient_0);
    end;
    v37.Gradient = v38;
    v29.RoundedFrame = l_TailVisible_0(v35, v36, v37);
    return l_createElement_0(v27, v28, v29);
end;
v9.fadeIn = function(v39) --[[ Line: 143 ]] --[[ Name: fadeIn ]]
    -- upvalues: v7 (copy), v8 (copy)
    local v40 = v7(v39.props.chatSettings, "transparency");
    v39.transparencyMotor:setGoal(v40(v39.props.chatSettings.Transparency));
    local v41 = v8.getBackgroundTransparency(v39.props.chatSettings, v39.props.clientSettings);
    v39.backgroundTransparencyMotor:setGoal(v40(v41));
    local v42 = v7(v39.props.chatSettings, "size");
    v39.widthMotor:setGoal(v42(v39.state.fullWidth));
end;
v9.fadeOut = function(v43) --[[ Line: 157 ]] --[[ Name: fadeOut ]]
    -- upvalues: v7 (copy)
    v43.transparencyMotor:onComplete(function() --[[ Line: 158 ]]
        -- upvalues: v43 (copy)
        if v43.props.onFadeOut then
            v43.props.onFadeOut();
        end;
    end);
    local v44 = v7(v43.props.chatSettings, "transparency");
    v43.transparencyMotor:setGoal(v44(1));
    v43.backgroundTransparencyMotor:setGoal(v44(1));
end;
v9.didUpdate = function(v45, v46, v47) --[[ Line: 169 ]] --[[ Name: didUpdate ]]
    -- upvalues: v7 (copy)
    if v46.fadingOut ~= v45.props.fadingOut then
        if v45.props.fadingOut then
            v45:fadeOut();
        else
            v45:fadeIn();
        end;
    end;
    if v45.state.fullWidth ~= v47.fullWidth then
        local v48 = v7(v45.props.chatSettings, "size");
        v45.widthMotor:setGoal(v48(v45.state.fullWidth));
    end;
end;
v9.didMount = function(v49) --[[ Line: 183 ]] --[[ Name: didMount ]]
    -- upvalues: v7 (copy), v8 (copy)
    if not v49.props.fadingOut then
        local v50 = v7(v49.props.chatSettings, "size");
        local v51 = v7(v49.props.chatSettings, "transparency");
        v49.transparencyMotor:setGoal(v51(v49.props.chatSettings.Transparency));
        local v52 = v8.getBackgroundTransparency(v49.props.chatSettings, v49.props.clientSettings);
        v49.backgroundTransparencyMotor:setGoal(v51(v52));
        v49.widthMotor:setGoal(v50(v49.state.fullWidth));
    end;
end;
v9.willUnmount = function(v53) --[[ Line: 199 ]] --[[ Name: willUnmount ]]
    v53.transparencyMotor:destroy();
    v53.backgroundTransparencyMotor:destroy();
    v53.widthMotor:destroy();
end;
return v9;