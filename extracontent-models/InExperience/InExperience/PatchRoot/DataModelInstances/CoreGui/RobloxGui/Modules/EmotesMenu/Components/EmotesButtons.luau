local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Parent_0 = script.Parent.Parent;
local l_Actions_0 = l_Parent_0.Actions;
local l_Thunks_0 = l_Parent_0.Thunks;
local l_Utility_0 = l_Parent_0.Utility;
local v7 = require(l_Parent_0.Constants);
local v8 = require(l_Utility_0.GetSegmentFromPosition);
local v9 = require(l_Actions_0.FocusSegment);
local v10 = require(l_Actions_0.HideMenu);
local v11 = require(l_Thunks_0.PlayEmote);
local v12 = v1.PureComponent:extend("EmotesButtons");
local function _(v13, v14) --[[ Line: 24 ]] --[[ Name: positionInsideOuterCircle ]]
    -- upvalues: v7 (copy)
    local v15 = v13.AbsoluteSize.X / 2;
    local v16 = v15 * v7.InnerCircleSizeRatio;
    local v17 = false;
    if v16 < v14.Magnitude then
        v17 = v14.Magnitude < v15;
    end;
    return v17;
end;
local function v26(v19, v20) --[[ Line: 31 ]] --[[ Name: getSegmentFromInput ]]
    -- upvalues: v7 (copy), v8 (copy)
    local v21 = Vector2.new(v20.Position.X, v20.Position.Y) - v19.AbsolutePosition - v19.AbsoluteSize / 2;
    v21 = Vector2.new(v21.X, -v21.Y);
    local l_v21_0 = v21;
    local v23 = v19.AbsoluteSize.X / 2;
    local v24 = v23 * v7.InnerCircleSizeRatio;
    local v25 = false;
    if v24 < l_v21_0.Magnitude then
        v25 = l_v21_0.Magnitude < v23;
    end;
    if not v25 then
        return 0;
    else
        return v8(v21);
    end;
end;
local function _(v27) --[[ Line: 47 ]] --[[ Name: getRandomAssetId ]]
    if #v27 == 0 then
        return;
    else
        return v27[math.random(1, #v27)];
    end;
end;
local function _(v29) --[[ Line: 56 ]] --[[ Name: getEmoteImage ]]
    -- upvalues: v7 (copy)
    return v7.EmotesImage:format(v29);
end;
v12.render = function(v31) --[[ Line: 60 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v1 (copy), v26 (copy)
    local l_currentEmotes_0 = v31.props.emotesPage.currentEmotes;
    local l_emotesInfo_0 = v31.props.emotesPage.emotesInfo;
    local v34 = {};
    for v35, v36 in pairs(l_currentEmotes_0) do
        local v37 = l_emotesInfo_0[v36];
        if v7.EmotesPerPage < v35 then
            warn("EmotesMenu: Number of emotes in page exceeds max emotes per page");
            break;
        else
            local v38 = 360 / v7.EmotesPerPage * (v35 - 1) + v7.SegmentsStartRotation;
            local v39 = v7.InnerCircleSizeRatio / 2;
            local v40 = (1 - v7.InnerCircleSizeRatio) / 2 - v7.SlotNumberSize - v7.ImageOutsidePadding;
            local v41 = v40 / 2 + v7.SlotNumberSize - v7.ImageOutsidePadding / 2;
            local v42 = math.cos((math.rad(v38)));
            local v43 = v39 * v42;
            local v44 = v41 * v42;
            local v45 = 0.5 + v43 + v44;
            local v46 = math.sin((math.rad(v38)));
            local v47 = v39 * v46;
            local v48 = v41 * v46;
            local v49 = 0.5 + v47 + v48;
            local v50 = if #v37 == 0 then nil else v37[math.random(1, #v37)];
            local v51 = v7.EmotesImage:format(v50);
            v34[v35] = v1.createElement("ImageLabel", {
                Image = v51, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(v45, 0, v49, 0), 
                Size = UDim2.new(v40, 0, v40, 0), 
                BackgroundTransparency = 1, 
                ZIndex = 2
            }, {
                AsspectRatioConstraint = v1.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                })
            });
        end;
    end;
    return v1.createElement("TextButton", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        BackgroundTransparency = 1, 
        Text = "", 
        [v1.Event.InputChanged] = function(v52, v53) --[[ Line: 117 ]]
            -- upvalues: v26 (ref), v31 (copy)
            local l_UserInputType_0 = v53.UserInputType;
            if l_UserInputType_0 == Enum.UserInputType.MouseMovement or l_UserInputType_0 == Enum.UserInputType.Touch then
                local v55 = v26(v52, v53);
                if v55 == v31.props.emotesWheel.focusedSegmentIndex then
                    return;
                elseif v31.props.emotesPage.currentEmotes[v55] then
                    v31.props.focusSegment(v55);
                    return;
                else
                    v31.props.focusSegment(0);
                end;
            end;
        end, 
        [v1.Event.Activated] = function(v56, v57) --[[ Line: 135 ]]
            -- upvalues: v26 (ref), v31 (copy)
            local v58 = v26(v56, v57);
            if v58 == 0 then
                v31.props.hideMenu();
                return;
            else
                local v59 = v31.props.emotesPage.currentEmotes[v58];
                if not v59 then
                    return;
                else
                    local v60 = v31.props.emotesPage.emotesInfo[v59];
                    if not v60 then
                        return;
                    else
                        local v61 = if #v60 == 0 then nil else v60[math.random(1, #v60)];
                        v31.props.playEmote(v59, v58, v61);
                        return;
                    end;
                end;
            end;
        end, 
        [v1.Event.MouseLeave] = function() --[[ Line: 156 ]]
            -- upvalues: v31 (copy)
            v31.props.focusSegment(0);
        end
    }, v34);
end;
return v2.connect(function(v62) --[[ Line: 162 ]] --[[ Name: mapStateToProps ]]
    return {
        displayOptions = v62.displayOptions, 
        emotesPage = v62.emotesPage, 
        emotesWheel = v62.emotesWheel
    };
end, function(v63) --[[ Line: 170 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v11 (copy), v9 (copy), v10 (copy)
    return {
        playEmote = function(v64, v65, v66) --[[ Line: 172 ]] --[[ Name: playEmote ]]
            -- upvalues: v63 (copy), v11 (ref)
            return v63(v11(v64, v65, v66));
        end, 
        focusSegment = function(v67) --[[ Line: 176 ]] --[[ Name: focusSegment ]]
            -- upvalues: v63 (copy), v9 (ref)
            return v63(v9(v67));
        end, 
        hideMenu = function() --[[ Line: 180 ]] --[[ Name: hideMenu ]]
            -- upvalues: v63 (copy), v10 (ref)
            return v63(v10());
        end
    };
end)(v12);