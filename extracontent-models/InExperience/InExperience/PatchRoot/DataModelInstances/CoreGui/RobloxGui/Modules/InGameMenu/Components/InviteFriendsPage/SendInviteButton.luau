local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v2.Roact;
local l_UIBlox_0 = v2.UIBlox;
local l_t_0 = v2.t;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_Parent_0 = script.Parent.Parent.Parent;
local l_InviteStatus_0 = require(l_Parent_0.Resources.Constants).InviteStatus;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v13 = l_Roact_0.PureComponent:extend("SendInviteButton");
v13.validateProps = l_t_0.strictInterface({
    onActivated = l_t_0.callback, 
    animationBegun = l_t_0.callback, 
    animationEnded = l_t_0.callback, 
    userInviteStatus = l_t_0.optional(l_t_0.string)
});
local function _(v14, v15, v16) --[[ Line: 35 ]] --[[ Name: linearTween ]]
    local v17 = (v16 - v15) / 30;
    return (v14 - v15 / 30) / v17;
end;
local function _(v19, v20, v21) --[[ Line: 40 ]] --[[ Name: isBetweenFrames ]]
    local v22 = false;
    if v20 / 30 <= v19 then
        v22 = v19 <= v21 / 30;
    end;
    return v22;
end;
local v38 = {
    [l_InviteStatus_0.Pending] = function(v24, v25) --[[ Line: 45 ]]
        local v26 = math.sin(6.283185307179586 * v24) * 0.375 + 0.375;
        v25.sendTransparency(v26);
    end, 
    [l_InviteStatus_0.Success] = function(v27, v28, v29) --[[ Line: 54 ]]
        local v30 = false;
        if v27 >= 0 then
            v30 = v27 <= 0.13333333333333333;
        end;
        if v30 then
            v30 = (v27 - 0) / 0.13333333333333333;
            v28.sendTransparency(v30);
            v28.successTransparency(1 - v30);
            local v31 = 0.75 + 0.75 * (1 - v30);
            v28.successSize(v31);
            return;
        else
            v30 = false;
            if v27 >= 0.13333333333333333 then
                v30 = v27 <= 0.3;
            end;
            if v30 then
                v28.sendTransparency(1);
                v28.successTransparency(0);
                local v32 = 0.75 + 0.25 * ((v27 - 0.13333333333333333) / 0.16666666666666666);
                v28.successSize(v32);
                return;
            else
                v28.successSize(1);
                v29();
                return;
            end;
        end;
    end, 
    [l_InviteStatus_0.Failed] = function(v33, v34, v35) --[[ Line: 85 ]]
        local v36 = false;
        if v33 >= 0 then
            v36 = v33 <= 0.06666666666666667;
        end;
        if v36 then
            v36 = (v33 - 0) / 0.13333333333333333;
            v34.sendTransparency(v36);
        else
            v36 = false;
            if v33 >= 0.06666666666666667 then
                v36 = v33 <= 1.7333333333333334;
            end;
            if v36 then
                v34.sendTransparency(1);
            else
                v36 = false;
                if v33 >= 1.7333333333333334 then
                    v36 = v33 <= 1.9;
                end;
                if v36 then
                    v36 = (v33 - 1.7333333333333334) / 0.16666666666666666;
                    v34.sendTransparency(1 - v36);
                else
                    v34.sendTransparency(0);
                    v35();
                end;
            end;
        end;
        v36 = false;
        if v33 >= 0 then
            v36 = v33 <= 0.13333333333333333;
        end;
        if v36 then
            v36 = (v33 - 0) / 0.13333333333333333;
            v34.failTransparency(1 - v36);
            return;
        else
            v36 = false;
            if v33 >= 0.13333333333333333 then
                v36 = v33 <= 1.4;
            end;
            if v36 then
                v34.failTransparency(0);
                v36 = v33 - 0.13333333333333333;
                local v37 = -0.4 * 2.71828182846 ^ (-v36 * 8) * math.sin(v36 * 40);
                v34.failPos(v37);
                return;
            else
                v36 = false;
                if v33 >= 1.4 then
                    v36 = v33 <= 1.5666666666666667;
                end;
                if v36 then
                    v34.failPos(0);
                    v36 = (v33 - 1.4) / 0.16666666666666666;
                    v34.failTransparency(v36);
                    return;
                else
                    v34.failTransparency(1);
                    return;
                end;
            end;
        end;
    end
};
v13.init = function(v39, v40) --[[ Line: 142 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy), l_InviteStatus_0 (copy)
    local v41, v42 = l_Roact_0.createBinding(0);
    local v43, v44 = l_Roact_0.createBinding(1);
    local v45, v46 = l_Roact_0.createBinding(1);
    local v47, v48 = l_Roact_0.createBinding(1);
    local v49, v50 = l_Roact_0.createBinding(0);
    v39.bindings = {
        sendTransparency = v41, 
        successTransparency = v43, 
        failTransparency = v45, 
        successSize = v47:map(function(v51) --[[ Line: 154 ]]
            return UDim2.new(v51, 0, v51, 0);
        end), 
        failPos = v49:map(function(v52) --[[ Line: 157 ]]
            return UDim2.new(v52, 0, 0, 0);
        end)
    };
    v39.updateBindings = {
        sendTransparency = v42, 
        successTransparency = v44, 
        failTransparency = v46, 
        successSize = v48, 
        failPos = v50
    };
    if v40.userInviteStatus == l_InviteStatus_0.Success then
        v44(0);
        v42(1);
    end;
end;
v13.renderWithSelectionCursor = function(v53, v54) --[[ Line: 176 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: l_withStyle_0 (copy), l_Roact_0 (copy), l_CursorKind_0 (copy), l_InviteStatus_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy)
    local l_props_0 = v53.props;
    return l_withStyle_0(function(v56) --[[ Line: 179 ]]
        -- upvalues: l_Roact_0 (ref), v54 (copy), l_CursorKind_0 (ref), l_props_0 (copy), l_InviteStatus_0 (ref), v53 (copy), l_ImageSetLabel_0 (ref), l_Images_0 (ref)
        return l_Roact_0.createElement("TextButton", {
            Selectable = false, 
            Size = UDim2.new(0, 36, 0, 36), 
            BackgroundTransparency = 1, 
            Text = "", 
            SelectionImageObject = v54(l_CursorKind_0.InputFields), 
            [l_Roact_0.Event.Activated] = function() --[[ Line: 187 ]]
                -- upvalues: l_props_0 (ref), l_InviteStatus_0 (ref), v53 (ref)
                local v57 = l_props_0.userInviteStatus == l_InviteStatus_0.Pending;
                local v58 = l_props_0.userInviteStatus == l_InviteStatus_0.Success;
                if not v53.renderSteppedConnection and not v57 and not v58 then
                    l_props_0.onActivated();
                end;
            end
        }, {
            SendLabel = l_Roact_0.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = l_Images_0["icons/actions/friends/friendInvite"], 
                Size = UDim2.new(1, 0, 1, 0), 
                ImageColor3 = v56.Theme.IconEmphasis.Color, 
                ImageTransparency = v53.bindings.sendTransparency
            }), 
            SuccessLabel = l_Roact_0.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = l_Images_0["icons/status/success"], 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                ImageColor3 = v56.Theme.IconEmphasis.Color, 
                ImageTransparency = v53.bindings.successTransparency, 
                Size = v53.bindings.successSize
            }), 
            FailLabel = l_Roact_0.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = l_Images_0["icons/status/alert"], 
                Size = UDim2.new(1, 0, 1, 0), 
                ImageColor3 = v56.Theme.IconEmphasis.Color, 
                ImageTransparency = v53.bindings.failTransparency, 
                Position = v53.bindings.failPos
            })
        });
    end);
end;
v13.render = function(v59) --[[ Line: 226 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy)
    return l_withSelectionCursorProvider_0(function(v60) --[[ Line: 227 ]]
        -- upvalues: v59 (copy)
        return v59:renderWithSelectionCursor(v60);
    end);
end;
v13.didUpdate = function(v61, v62) --[[ Line: 232 ]] --[[ Name: didUpdate ]]
    -- upvalues: v38 (copy)
    if v61.props.userInviteStatus and v61.props.userInviteStatus ~= v62.userInviteStatus then
        v61:playAnimation(v38[v61.props.userInviteStatus]);
    end;
end;
v13.didMount = function(v63) --[[ Line: 238 ]] --[[ Name: didMount ]]
    -- upvalues: v38 (copy)
    if v63.props.userInviteStatus then
        v63:playAnimation(v38[v63.props.userInviteStatus]);
    end;
end;
v13.playAnimation = function(v64, v65) --[[ Line: 244 ]] --[[ Name: playAnimation ]]
    -- upvalues: l_RunService_0 (copy)
    v64.animationStartTime = tick();
    v64.animationFunction = v65;
    if not v64.renderSteppedConnection then
        v64.renderSteppedConnection = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 249 ]]
            -- upvalues: v64 (copy)
            v64.animationFunction(tick() - v64.animationStartTime, v64.updateBindings, function() --[[ Line: 250 ]]
                -- upvalues: v64 (ref)
                v64:stopAnimation();
            end);
        end);
        v64.props.animationBegun();
    end;
end;
v13.stopAnimation = function(v66) --[[ Line: 258 ]] --[[ Name: stopAnimation ]]
    if v66.renderSteppedConnection then
        v66.renderSteppedConnection:Disconnect();
        v66.renderSteppedConnection = nil;
        v66.props.animationEnded();
    end;
end;
v13.willUnmount = function(v67) --[[ Line: 266 ]] --[[ Name: willUnmount ]]
    v67:stopAnimation();
end;
return v13;