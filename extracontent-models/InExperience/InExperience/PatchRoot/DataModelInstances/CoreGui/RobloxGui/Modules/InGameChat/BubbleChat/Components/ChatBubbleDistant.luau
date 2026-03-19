local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Otter);
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local l_Parent_0 = script.Parent.Parent;
local v6 = require(l_Parent_0.Types);
local v7 = require(l_Parent_0.Helpers.getSizeSpringFromSettings);
local v8 = require(l_Parent_0.Helpers.getTransparencySpringFromSettings);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v11 = v2.PureComponent:extend("ChatBubbleDistant");
v11.validateProps = v3.strictInterface({
    width = v3.optional(v3.number), 
    height = v3.optional(v3.number), 
    fadingOut = v3.optional(v3.boolean), 
    onFadeOut = v3.optional(v3.callback), 
    chatSettings = v6.IChatSettings, 
    renderInsert = v3.optional(v3.callback), 
    insertSize = v3.optional(v3.Vector2)
});
v11.defaultProps = {
    width = 32, 
    height = 16
};
local function _(v12) --[[ Line: 41 ]] --[[ Name: getFullHeight ]]
    local l_height_0 = v12.height;
    if v12.renderInsert then
        l_height_0 = math.max(l_height_0, v12.insertSize.Y);
    end;
    return l_height_0 + v12.chatSettings.Padding * 2;
end;
v11.init = function(v15, v16) --[[ Line: 50 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v17, v18 = v2.createBinding(0);
    v15.width = v17;
    v15.updateWidth = v18;
    v15.widthMotor = v1.createSingleMotor(0);
    v15.widthMotor:onStep(function(v19) --[[ Line: 53 ]]
        -- upvalues: v15 (copy)
        v15.updateWidth((math.round(v19)));
    end);
    v17 = v2.createBinding;
    local l_height_1 = v16.height;
    if v16.renderInsert then
        l_height_1 = math.max(l_height_1, v16.insertSize.Y);
    end;
    v17, v18 = v17(l_height_1 + v16.chatSettings.Padding * 2);
    v15.height = v17;
    v15.updateHeight = v18;
    v15.frameSize = v2.joinBindings({
        v15.width, 
        v15.height
    }):map(function(v21) --[[ Line: 59 ]]
        return UDim2.fromOffset(v21[1], v21[2]);
    end);
    v17, v18 = v2.createBinding(1);
    v15.transparency = v17;
    v15.updateTransparency = v18;
    v15.transparencyMotor = v1.createSingleMotor(1);
    v15.transparencyMotor:onStep(v15.updateTransparency);
    if v16.fadingOut then
        v15:fadeOut();
    end;
end;
v11.getDerivedStateFromProps = function(v22, v23) --[[ Line: 74 ]] --[[ Name: getDerivedStateFromProps ]]
    local l_chatSettings_0 = v22.chatSettings;
    local v25 = nil;
    v25 = if v22.renderInsert then v22.width + v22.insertSize.X + l_chatSettings_0.Padding * 2 else v22.width + l_chatSettings_0.Padding * 2;
    local l_height_2 = v22.height;
    if v22.renderInsert then
        l_height_2 = math.max(l_height_2, v22.insertSize.Y);
    end;
    local v27 = l_height_2 + v22.chatSettings.Padding * 2;
    if v25 ~= v23.fullWidth or v27 ~= v23.fullHeight then
        return {
            fullWidth = v25, 
            fullHeight = v27
        };
    else
        return nil;
    end;
end;
v11.render = function(v28) --[[ Line: 96 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v4 (copy), l_AppFonts_0 (copy)
    local l_chatSettings_1 = v28.props.chatSettings;
    local l_BackgroundImage_0 = l_chatSettings_1.BackgroundImage;
    local l_BackgroundGradient_0 = l_chatSettings_1.BackgroundGradient;
    local v32 = v28.props.renderInsert and v28.props.insertSize.X or 0;
    return v2.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 1), 
        Size = UDim2.fromOffset(v28.state.fullWidth, v28.state.fullHeight), 
        Position = UDim2.new(0.5, 0, 1, -8), 
        Transparency = 1
    }, {
        Scale = v2.createElement("UIScale", {
            Scale = 0.75
        }), 
        Carat = l_chatSettings_1.TailVisible and v2.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0.5, 0, 1, -1), 
            Size = UDim2.fromOffset(12, 8), 
            Image = "rbxasset://textures/ui/InGameChat/Caret.png", 
            ImageColor3 = l_chatSettings_1.BackgroundColor3, 
            ImageTransparency = v28.transparency
        }), 
        RoundedFrame = v2.createElement("ImageLabel", v4.Dictionary.join(l_BackgroundImage_0, {
            Size = v28.frameSize, 
            BackgroundColor3 = l_chatSettings_1.BackgroundColor3, 
            BackgroundTransparency = l_BackgroundImage_0.Image == "" and v28.transparency or 1, 
            BorderSizePixel = 0, 
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            ClipsDescendants = true, 
            ImageTransparency = v28.transparency
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
                UIListLayout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Insert = v28.props.renderInsert and v28.props.renderInsert(), 
                Ellipsis = v2.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Text = "\226\128\166", 
                    TextColor3 = l_chatSettings_1.TextColor3, 
                    TextTransparency = v28.transparency, 
                    Font = l_AppFonts_0.default:getBlack(), 
                    TextScaled = true, 
                    Size = UDim2.new(1, -v32, 1, 0), 
                    LayoutOrder = 2
                })
            }), 
            Gradient = l_BackgroundGradient_0.Enabled and v2.createElement("UIGradient", l_BackgroundGradient_0)
        })
    });
end;
v11.fadeOut = function(v33) --[[ Line: 175 ]] --[[ Name: fadeOut ]]
    -- upvalues: v8 (copy)
    if not v33.isFadingOut then
        v33.isFadingOut = true;
        v33.transparencyMotor:onComplete(function() --[[ Line: 179 ]]
            -- upvalues: v33 (copy)
            if v33.props.onFadeOut then
                v33.props.onFadeOut();
            end;
        end);
        local v34 = v8(v33.props.chatSettings);
        v33.transparencyMotor:setGoal(v34(1));
    end;
end;
v11.didUpdate = function(v35, _, v37) --[[ Line: 190 ]] --[[ Name: didUpdate ]]
    -- upvalues: v7 (copy)
    if v35.props.fadingOut then
        v35:fadeOut();
        return;
    else
        if v35.state.fullHeight ~= v37.fullHeight then
            v35.updateHeight(v35.state.fullHeight);
        end;
        if v35.state.fullWidth ~= v37.fullWidth then
            local l_chatSettings_2 = v35.props.chatSettings;
            local v39 = v7(l_chatSettings_2);
            v35.widthMotor:setGoal(v39(v35.state.fullWidth));
        end;
        return;
    end;
end;
v11.didMount = function(v40) --[[ Line: 205 ]] --[[ Name: didMount ]]
    -- upvalues: v7 (copy), v8 (copy)
    if not v40.props.fadingOut then
        local l_chatSettings_3 = v40.props.chatSettings;
        local v42 = v7(l_chatSettings_3);
        local v43 = v8(l_chatSettings_3);
        v40.transparencyMotor:setGoal(v43(v40.props.chatSettings.Transparency));
        v40.widthMotor:setGoal(v42(v40.state.fullWidth));
    end;
end;
v11.willUnmount = function(v44) --[[ Line: 216 ]] --[[ Name: willUnmount ]]
    v44.transparencyMotor:destroy();
    v44.widthMotor:destroy();
end;
return v11;