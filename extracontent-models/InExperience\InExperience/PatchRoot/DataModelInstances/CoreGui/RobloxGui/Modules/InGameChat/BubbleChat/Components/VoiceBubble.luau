local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Otter);
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local l_Parent_0 = script.Parent.Parent;
local v6 = require(l_Parent_0.Types);
local v7 = require(l_Parent_0.Helpers.getSizeSpringFromSettings);
local v8 = require(l_Parent_0.Helpers.getTransparencySpringFromSettings);
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v10 = v2.PureComponent:extend("VoiceBubble");
v10.validateProps = v3.strictInterface({
    fadingOut = v3.optional(v3.boolean), 
    onFadeOut = v3.optional(v3.callback), 
    chatSettings = v6.IChatSettings, 
    renderInsert = v3.optional(v3.callback), 
    insertSize = v3.optional(v3.Vector2), 
    isDistant = v3.optional(v3.boolean)
});
v10.init = function(v11, v12) --[[ Line: 33 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v13, v14 = v2.createBinding(0);
    v11.width = v13;
    v11.updateWidth = v14;
    v11.widthMotor = v1.createSingleMotor(0);
    v11.widthMotor:onStep(function(v15) --[[ Line: 36 ]]
        -- upvalues: v11 (copy)
        v11.updateWidth((math.round(v15)));
    end);
    v11.frameSize = v11.width:map(function(v16) --[[ Line: 40 ]]
        -- upvalues: v11 (copy)
        if v11.props.insertSize then
            return UDim2.fromOffset(v16, v11.props.insertSize.Y + v11.props.chatSettings.Padding * 2);
        else
            return UDim2.fromOffset(v16, 0);
        end;
    end);
    v13, v14 = v2.createBinding(1);
    v11.transparency = v13;
    v11.updateTransparency = v14;
    v11.transparencyMotor = v1.createSingleMotor(1);
    v11.transparencyMotor:onStep(v11.updateTransparency);
    if v12.fadingOut then
        v11:fadeOut();
    end;
end;
v10.getDerivedStateFromProps = function(v17, v18) --[[ Line: 59 ]] --[[ Name: getDerivedStateFromProps ]]
    local l_chatSettings_0 = v17.chatSettings;
    local v20 = 0;
    if v17.insertSize then
        v20 = v17.insertSize.X + l_chatSettings_0.Padding * 2;
    end;
    if v20 ~= v18.fullWidth then
        return {
            fullWidth = v20
        };
    else
        return nil;
    end;
end;
v10.render = function(v21) --[[ Line: 76 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v4 (copy)
    local l_chatSettings_1 = v21.props.chatSettings;
    local l_BackgroundImage_0 = l_chatSettings_1.BackgroundImage;
    local l_BackgroundGradient_0 = l_chatSettings_1.BackgroundGradient;
    local v25 = 0;
    if v21.props.insertSize then
        v25 = v21.props.insertSize.Y + l_chatSettings_1.Padding * 2;
    end;
    return v2.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 1), 
        Size = UDim2.fromOffset(v21.state.fullWidth, v25), 
        Position = UDim2.new(0.5, 0, 1, -8), 
        Transparency = 1
    }, {
        Scale = v2.createElement("UIScale", {
            Scale = v21.props.isDistant and 0.75 or 1
        }), 
        Carat = l_chatSettings_1.TailVisible and v2.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0.5, 0, 1, -1), 
            Size = UDim2.fromOffset(12, 8), 
            Image = "rbxasset://textures/ui/InGameChat/Caret.png", 
            ImageColor3 = l_chatSettings_1.BackgroundColor3, 
            ImageTransparency = v21.transparency
        }), 
        RoundedFrame = v2.createElement("ImageLabel", v4.Dictionary.join(l_BackgroundImage_0, {
            Size = v21.frameSize, 
            BackgroundColor3 = l_chatSettings_1.BackgroundColor3, 
            BackgroundTransparency = l_BackgroundImage_0.Image == "" and v21.transparency or 1, 
            BorderSizePixel = 0, 
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            ClipsDescendants = true, 
            ImageTransparency = v21.transparency
        }), {
            UICorner = l_chatSettings_1.CornerEnabled and v2.createElement("UICorner", {
                CornerRadius = l_chatSettings_1.CornerRadius
            }), 
            Contents = v2.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, l_chatSettings_1.Padding), 
                    PaddingRight = UDim.new(0, l_chatSettings_1.Padding), 
                    PaddingBottom = UDim.new(0, l_chatSettings_1.Padding), 
                    PaddingLeft = UDim.new(0, l_chatSettings_1.Padding)
                }), 
                Insert = v21.props.renderInsert and v21.props.renderInsert()
            }), 
            Gradient = l_BackgroundGradient_0.Enabled and v2.createElement("UIGradient", l_BackgroundGradient_0)
        })
    });
end;
v10.fadeOut = function(v26) --[[ Line: 142 ]] --[[ Name: fadeOut ]]
    -- upvalues: v8 (copy)
    if not v26.isFadingOut then
        v26.isFadingOut = true;
        v26.transparencyMotor:onComplete(function() --[[ Line: 146 ]]
            -- upvalues: v26 (copy)
            if v26.props.onFadeOut then
                v26.props.onFadeOut();
            end;
        end);
        local v27 = v8(v26.props.chatSettings);
        v26.transparencyMotor:setGoal(v27(1));
    end;
end;
v10.didUpdate = function(v28, _, v30) --[[ Line: 157 ]] --[[ Name: didUpdate ]]
    -- upvalues: v7 (copy)
    if v28.props.fadingOut then
        v28:fadeOut();
        return;
    else
        if v28.state.fullWidth ~= v30.fullWidth then
            local l_chatSettings_2 = v28.props.chatSettings;
            local v32 = v7(l_chatSettings_2);
            v28.widthMotor:setGoal(v32(v28.state.fullWidth));
        end;
        return;
    end;
end;
v10.didMount = function(v33) --[[ Line: 167 ]] --[[ Name: didMount ]]
    -- upvalues: v7 (copy), v8 (copy)
    if not v33.props.fadingOut then
        local l_chatSettings_3 = v33.props.chatSettings;
        local v35 = v7(l_chatSettings_3);
        local v36 = v8(l_chatSettings_3);
        v33.transparencyMotor:setGoal(v36(v33.props.chatSettings.Transparency));
        v33.widthMotor:setGoal(v35(v33.state.fullWidth));
    end;
end;
v10.willUnmount = function(v37) --[[ Line: 178 ]] --[[ Name: willUnmount ]]
    v37.transparencyMotor:destroy();
    v37.widthMotor:destroy();
end;
return v10;