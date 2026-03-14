local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Parent_0 = script.Parent.Parent;
local l_Actions_0 = l_Parent_0.Actions;
local v5 = require(l_Actions_0.HideError);
local v6 = require(l_Parent_0.Constants);
local v7 = v1.PureComponent:extend("ErrorMessage");
v7.render = function(v8) --[[ Line: 17 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v1 (copy)
    local v9 = v6.Layouts[v8.props.layout];
    return v1.createElement("Frame", {
        Size = v9.ErrorFrameSize, 
        Position = v9.ErrorFramePosition, 
        BackgroundColor3 = v6.Colors.Black, 
        BackgroundTransparency = v6.ErrorFrameBackgroundTransparency, 
        BorderSizePixel = v6.ErrorFrameBorderSize, 
        Selectable = false, 
        Visible = v8.props.displayOptions.errorVisible, 
        [v1.Event.TouchTap] = function() --[[ Line: 29 ]]
            -- upvalues: v8 (copy)
            v8.props.close();
        end, 
        [v1.Event.InputBegan] = function(_, v11) --[[ Line: 33 ]]
            -- upvalues: v8 (copy)
            if v11.UserInputType == Enum.UserInputType.MouseButton1 then
                v8.props.close();
            end;
        end
    }, {
        AsspectRatioConstraint = v1.createElement("UIAspectRatioConstraint", {
            AspectRatio = v9.ErrorFrameAspectRatio
        }), 
        SizeConstraint = v1.createElement("UISizeConstraint", {
            MinSize = v9.ErrorFrameMinSize, 
            MaxSize = v9.ErrorFrameMaxSize
        }), 
        ErrorIcon = v1.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, v9.ErrorIconOffset, 0.5, 0), 
            Size = UDim2.new(0.2, -v9.ErrorIconOffset * 2, 1, -v9.ErrorIconOffset * 2), 
            Image = v9.ErrorIcon, 
            BackgroundTransparency = 1
        }, {
            AsspectRatioConstraint = v1.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            })
        }), 
        ErrorText = v1.createElement("TextLabel", {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0.2, -v9.ErrorIconOffset, 0.5, 0), 
            Size = UDim2.new(0.8, 0, 1, 0), 
            Text = v8.props.displayOptions.errorText, 
            TextScaled = true, 
            TextSize = v9.ErrorTextSize, 
            TextColor3 = v6.Colors.White, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Font = v9.ErrorTextFont, 
            BackgroundTransparency = 1
        }, {
            SizeConstraint = v1.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(v9.ErrorFrameMaxSize.X, v9.ErrorTextSize + v6.TextPadding)
            }), 
            TextSizeConstraint = v1.createElement("UITextSizeConstraint", {
                MaxTextSize = v9.ErrorTextSize
            })
        })
    });
end;
return v2.connect(function(v12) --[[ Line: 86 ]] --[[ Name: mapStateToProps ]]
    return {
        displayOptions = v12.displayOptions, 
        layout = v12.layout
    };
end, function(v13) --[[ Line: 93 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v5 (copy)
    return {
        close = function() --[[ Line: 95 ]] --[[ Name: close ]]
            -- upvalues: v13 (copy), v5 (ref)
            return v13(v5());
        end
    };
end)(v7);