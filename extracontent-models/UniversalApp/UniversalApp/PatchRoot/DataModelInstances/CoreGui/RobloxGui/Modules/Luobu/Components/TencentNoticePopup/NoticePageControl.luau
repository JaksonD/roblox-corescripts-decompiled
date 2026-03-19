local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.ReactUtils);
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_withStyle_0 = v8.Style.withStyle;
local l_EventConnection_0 = v7.EventConnection;
local v12 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetButton);
local v13 = require(l_Modules_0.LuaApp.Thunks.OpenWebview);
local v14 = require(l_Modules_0.Luobu.Actions.DecrementUnreadTencentNoticeCount);
local v15 = require(l_Modules_0.Luobu.Actions.ReadTencentNoticeId);
local v16 = require(l_Modules_0.Luobu.Components.TencentNoticePopup.NoticePageControlItem);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v18 = require(l_Modules_0.Luobu.Enum.MemStorageKeys);
local v19 = require(l_CorePackages_0.Packages.t);
local v20 = require(l_CorePackages_0.Packages.Otter);
local v21 = {
    dampingRatio = 1, 
    frequency = 10
};
local v22 = v5.PureComponent:extend("NoticePageControl");
v22.validateProps = v19.strictInterface({
    noticeList = v19.table, 
    onActivated = v19.callback, 
    settings = v19.strictInterface({
        widePopupWidth = v19.number, 
        widePopupHeight = v19.number, 
        headerHeight = v19.number, 
        bottomHeight = v19.number, 
        compactHeightToWidthRatio = v19.number
    }), 
    formFactor = v19.string, 
    screenSize = v19.Vector2, 
    openNoticeDetail = v19.callback, 
    decrementUnreadTencentNoticeCount = v19.callback, 
    readTencentNoticeId = v19.callback
});
v22.checkInsidePage = function(v23, v24, v25) --[[ Line: 59 ]] --[[ Name: checkInsidePage ]]
    -- upvalues: l_FormFactor_0 (copy)
    local l_formFactor_0 = v23.props.formFactor;
    local l_X_0 = v23.props.screenSize.X;
    local l_Y_0 = v23.props.screenSize.Y;
    local l_bottomHeight_0 = v23.props.settings.bottomHeight;
    if l_formFactor_0 == l_FormFactor_0.WIDE then
        local v30 = (l_X_0 - v23.props.settings.widePopupWidth) / 2;
        local v31 = (l_Y_0 - v23.props.settings.widePopupWidth) / 2;
        if v24 < v30 or l_X_0 - v30 < v24 then
            return false;
        elseif v25 < v31 or l_Y_0 - v31 - l_bottomHeight_0 < v25 then
            return false;
        end;
    elseif v24 < 24 or l_X_0 - 24 < v24 then
        return false;
    else
        local v32 = (l_Y_0 - v23.topHeight) / 2;
        if v25 < v32 or l_Y_0 - v32 - l_bottomHeight_0 < v25 then
            return false;
        end;
    end;
    return true;
end;
v22.init = function(v33) --[[ Line: 86 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), l_MemStorageService_0 (copy), v18 (copy), l_HttpService_0 (copy), l_FormFactor_0 (copy), v20 (copy), v21 (copy)
    v33.state = {
        selectedValue = 1
    };
    local v34, v35 = v5.createBinding(0);
    v33.positionX = v34;
    v33.updatePositionX = v35;
    v33.touchTapCallback = function(v36) --[[ Line: 91 ]]
        -- upvalues: v33 (copy), l_MemStorageService_0 (ref), v18 (ref), l_HttpService_0 (ref), l_FormFactor_0 (ref), v20 (ref), v21 (ref)
        local v37 = v33.props.noticeList[v33.state.selectedValue];
        if v37.noticeUrl == nil then
            return;
        else
            local l_X_1 = v36[1].X;
            local l_Y_1 = v36[1].Y;
            if v33:checkInsidePage(l_X_1, l_Y_1) == false then
                return;
            else
                local l_title_0 = v33.props.noticeList[v33.state.selectedValue].title;
                v33.props.openNoticeDetail(v37.noticeUrl, l_title_0);
                if v37.hasRead == false then
                    l_MemStorageService_0:Fire(v18.TencentNoticeIdReadStatus, l_HttpService_0:JSONEncode({
                        noticeId = v37.noticeId, 
                        endTime = v37.endTime
                    }));
                end;
                v33.props.decrementUnreadTencentNoticeCount();
                v33.props.readTencentNoticeId(v37.noticeId);
                local l_selectedValue_0 = v33.state.selectedValue;
                if l_selectedValue_0 == #v33.props.noticeList then
                    v33.props.onActivated();
                    return;
                else
                    local l_widePopupWidth_0 = v33.props.settings.widePopupWidth;
                    local v43 = (v33.props.formFactor == l_FormFactor_0.WIDE and l_widePopupWidth_0 or v33.compactWidth) * l_selectedValue_0;
                    v33:setState({
                        selectedValue = l_selectedValue_0 + 1
                    });
                    v33.motor:setGoal(v20.spring(v43, v21));
                    return;
                end;
            end;
        end;
    end;
    v33.goalLocation = 0;
    v33.compactWidth = v33.props.screenSize.X - 48;
    v33.touchMoveCallback = function(v44) --[[ Line: 135 ]]
        -- upvalues: v33 (copy), l_FormFactor_0 (ref), v20 (ref), v21 (ref)
        local l_X_2 = v44.Position.X;
        local l_Y_2 = v44.Position.Y;
        if v33.isMoving or v33:checkInsidePage(l_X_2, l_Y_2) == false then
            return;
        else
            local v47 = v33.props.formFactor == l_FormFactor_0.WIDE;
            local l_widePopupWidth_1 = v33.props.settings.widePopupWidth;
            local v49 = v47 and l_widePopupWidth_1 or v33.compactWidth;
            if math.abs(v44.Delta.X) > 20 then
                local v50 = math.sign(v44.Delta.X);
                local v51 = math.clamp(v33.state.selectedValue - v50, 1, #v33.props.noticeList);
                v33:setState({
                    selectedValue = v51
                });
                local v52 = v49 * (v51 - 1);
                v33.motor:setGoal(v20.spring(v52, v21));
                v33.goalLocation = v52;
                v33.isMoving = true;
            end;
            return;
        end;
    end;
    v33.motor = v20.createSingleMotor(1);
    v33.motor:onStep(function(v53) --[[ Line: 161 ]]
        -- upvalues: v33 (copy)
        local v54 = math.abs(v53 - v33.goalLocation);
        if v54 == 0 then
            return;
        elseif v54 < 1 then
            v33.updatePositionX(v33.goalLocation);
            return;
        else
            v33.updatePositionX(v53);
            return;
        end;
    end);
    v33.motor:onComplete(function() --[[ Line: 172 ]]
        -- upvalues: v33 (copy)
        v33.isMoving = false;
    end);
end;
v22.didMount = function(v55) --[[ Line: 177 ]] --[[ Name: didMount ]]
    if v55.props.onMounted then
        v55.props.onMounted();
    end;
end;
v22.willUnmount = function(v56) --[[ Line: 183 ]] --[[ Name: willUnmount ]]
    if v56.motor then
        v56.motor:destroy();
    end;
end;
v22.render = function(v57) --[[ Line: 189 ]] --[[ Name: render ]]
    -- upvalues: l_FormFactor_0 (copy), v5 (copy), v16 (copy), l_withStyle_0 (copy), l_EventConnection_0 (copy), l_UserInputService_0 (copy), v12 (copy)
    local v58 = v57.props.formFactor == l_FormFactor_0.WIDE;
    local v59 = nil;
    local v60 = nil;
    if v58 then
        v59 = v57.props.settings.widePopupWidth;
        v60 = v57.props.settings.widePopupHeight;
    else
        v59 = v57.compactWidth;
        v60 = v59 * v57.props.settings.compactHeightToWidthRatio;
    end;
    local v61 = #v57.props.noticeList * v59;
    local l_bottomHeight_1 = v57.props.settings.bottomHeight;
    local l_headerHeight_0 = v57.props.settings.headerHeight;
    local v64 = l_headerHeight_0 + v60 + l_bottomHeight_1;
    local v65 = #v57.props.noticeList == 1;
    v57.topHeight = l_headerHeight_0 + v60;
    local v66 = {
        Layout = v5.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        })
    };
    for v67, v68 in ipairs(v57.props.noticeList) do
        v66["NoticePageControlItem" .. v67] = v5.createElement(v16, {
            headerHeight = l_headerHeight_0, 
            contentHeight = v60, 
            width = v59, 
            notice = v68, 
            layoutOrder = v67, 
            hasOneNotice = v65
        });
    end;
    return l_withStyle_0(function(v69) --[[ Line: 222 ]]
        -- upvalues: v5 (ref), v59 (ref), v64 (copy), v57 (copy), l_headerHeight_0 (copy), v60 (ref), l_EventConnection_0 (ref), l_UserInputService_0 (ref), v61 (copy), v66 (copy), l_bottomHeight_1 (copy), v12 (ref)
        local l_Theme_0 = v69.Theme;
        return v5.createElement("ImageLabel", {
            Size = UDim2.fromOffset(v59, v64), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, {
            TopFrame = v5.createElement("Frame", {
                Size = UDim2.fromOffset(v59, v57.topHeight), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 0, 
                ClipsDescendants = true
            }, {
                PageIndicator = v57:renderIndicator(l_Theme_0, v59, l_headerHeight_0, v60), 
                TouchMoved = v5.createElement(l_EventConnection_0, {
                    event = l_UserInputService_0.TouchMoved, 
                    callback = v57.touchMoveCallback
                }), 
                TouchTap = v5.createElement(l_EventConnection_0, {
                    event = l_UserInputService_0.TouchTap, 
                    callback = v57.touchTapCallback, 
                    ZIndex = 2
                }), 
                ScrollingList = v5.createElement("Frame", {
                    BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                    Size = UDim2.fromOffset(v61, l_headerHeight_0 + v60), 
                    Position = v57.positionX:map(function(v71) --[[ Line: 250 ]]
                        return UDim2.fromOffset(-v71, 0);
                    end), 
                    BackgroundTransparency = 1, 
                    ZIndex = 2
                }, v66)
            }), 
            BottomFrame = v5.createElement("Frame", {
                AnchorPoint = Vector2.new(0, 1), 
                Size = UDim2.fromOffset(v59, l_bottomHeight_1), 
                Position = UDim2.new(0, 0, 1, 0), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                CloseButton = v5.createElement(v12, {
                    Size = UDim2.fromOffset(48, 48), 
                    Position = UDim2.new(0.5, -24, 0.5, -24), 
                    Image = "LuaApp/icons/Luobu/close-circle", 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    [v5.Event.Activated] = v57.props.onActivated
                })
            })
        });
    end);
end;
local function v75(v72, v73) --[[ Line: 277 ]] --[[ Name: createIndicator ]]
    -- upvalues: v5 (copy)
    local v74 = v5.createElement("ImageLabel", {
        BackgroundColor3 = v72.Divider.Color, 
        Size = UDim2.new(0.5, 0, 0.5, 0), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = v73, 
        ZIndex = 3, 
        BorderSizePixel = 0
    }, {
        UICorner = v5.createElement("UICorner", {
            CornerRadius = UDim.new(0, 4)
        })
    });
    return v5.createElement("Frame", {
        Size = UDim2.fromOffset(16, 16), 
        Position = UDim2.fromOffset(0.5, 0.5), 
        BackgroundTransparency = 1, 
        ZIndex = 2, 
        BorderSizePixel = 0
    }, v74);
end;
v22.renderIndicator = function(v76, v77, v78, v79, v80) --[[ Line: 300 ]] --[[ Name: renderIndicator ]]
    -- upvalues: v5 (copy), v75 (copy)
    local v81 = #v76.props.noticeList;
    if v81 <= 1 then
        return;
    else
        local v82 = {};
        table.insert(v82, (v5.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        })));
        for v83 = 1, v81 do
            local v84 = 0.7;
            if v83 == v76.state.selectedValue then
                v84 = 0;
            end;
            table.insert(v82, (v75(v77, v84)));
        end;
        return v5.createElement("Frame", {
            Size = UDim2.fromOffset(v78, 48), 
            Position = UDim2.fromOffset(0, v79 + v80 - 48), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            ZIndex = 3
        }, v82);
    end;
end;
return (v6.connect(function(v85) --[[ Line: 330 ]] --[[ Name: mapStateToProps ]]
    return {
        formFactor = v85.FormFactor, 
        screenSize = v85.ScreenSize
    };
end, function(v86) --[[ Line: 337 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v13 (copy), v14 (copy), v15 (copy)
    return {
        openNoticeDetail = function(v87, v88) --[[ Line: 339 ]] --[[ Name: openNoticeDetail ]]
            -- upvalues: v86 (copy), v13 (ref)
            v86(v13(v87, v88));
        end, 
        decrementUnreadTencentNoticeCount = function() --[[ Line: 342 ]] --[[ Name: decrementUnreadTencentNoticeCount ]]
            -- upvalues: v86 (copy), v14 (ref)
            return v86(v14());
        end, 
        readTencentNoticeId = function(v89) --[[ Line: 345 ]] --[[ Name: readTencentNoticeId ]]
            -- upvalues: v86 (copy), v15 (ref)
            return v86(v15(v89));
        end
    };
end)(v22));