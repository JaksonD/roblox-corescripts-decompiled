local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local v2 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v2.Roact;
local l_RoactRodux_0 = v2.RoactRodux;
local l_Otter_0 = v2.Otter;
local l_t_0 = v2.t;
local l_Parent_0 = script.Parent.Parent;
local v8 = require(script.Parent.BlurredModalPortal);
local v9 = require(script.Parent.Pages);
local v10 = require(script.Parent.Parent.Resources.Constants);
local v11 = {};
for v12, v13 in pairs(v9.pagesByKey) do
    v11[v12] = require(v13.component);
end;
local v14 = require(l_Parent_0.Localization.withLocalization);
local v15 = l_Roact_0.PureComponent:extend("PageContainer");
v15.validateProps = l_t_0.strictInterface({
    currentPage = l_t_0.string, 
    visible = l_t_0.boolean, 
    controllerBarHeight = l_t_0.number, 
    controllerBarCount = l_t_0.number
});
v15.init = function(v16, v17) --[[ Line: 34 ]] --[[ Name: init ]]
    -- upvalues: l_GuiService_0 (copy), v9 (copy), l_Roact_0 (copy), l_Otter_0 (copy)
    v16.onContainerRendered = function(v18, v19) --[[ Line: 35 ]]
        -- upvalues: v16 (copy), l_GuiService_0 (ref)
        if v18 then
            local v20 = v16.getSelectionParentNameFromKey(v19);
            l_GuiService_0:RemoveSelectionGroup(v20);
            l_GuiService_0:AddSelectionParent(v20, v18);
        end;
    end;
    v16.getSelectionParentNameFromKey = function(v21) --[[ Line: 43 ]]
        return v21 .. "_IGMPageSelectionGroup";
    end;
    local v22 = {};
    local v23 = {};
    local v24 = {};
    v16.pagePositions = {};
    v16.pageVisibilities = {};
    for v25, _ in pairs(v9.pagesByKey) do
        local v27 = v17.currentPage == v25 and 1 or 0;
        local v28, v29 = l_Roact_0.createBinding(v27);
        v22[v25] = v28;
        v23[v25] = v29;
        v24[v25] = v27;
        v16.pagePositions[v25] = v22[v25]:map(function(v30) --[[ Line: 55 ]]
            return UDim2.new(v30 - 1, 0, 0, 0);
        end);
        v16.pageVisibilities[v25] = v22[v25]:map(function(v31) --[[ Line: 60 ]]
            if v31 == 0 or v31 == 1.25 then
                return false;
            else
                return true;
            end;
        end);
    end;
    v16.pageMotor = l_Otter_0.createGroupMotor(v24);
    v16.pageMotor:onStep(function(v32) --[[ Line: 69 ]]
        -- upvalues: v23 (copy)
        for v33, v34 in pairs(v32) do
            v23[v33](v34);
        end;
    end);
end;
v15.render = function(v35) --[[ Line: 76 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), v14 (copy), l_Roact_0 (copy), v11 (copy), v8 (copy), v10 (copy)
    local v36 = {};
    for v37, v38 in pairs(v9.pagesByKey) do
        local v39 = v35.pageVisibilities[v37];
        v36[v37] = v14({
            title = v38.title
        })(function(v40) --[[ Line: 84 ]]
            -- upvalues: v38 (copy), l_Roact_0 (ref), v35 (copy), v37 (copy), v39 (copy), v11 (ref), v8 (ref)
            if not v38.isModal then
                return l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    Position = v35.pagePositions[v37], 
                    BackgroundTransparency = 1, 
                    ZIndex = v38.navigationDepth, 
                    Visible = v39, 
                    [l_Roact_0.Ref] = function(v41) --[[ Line: 92 ]]
                        -- upvalues: v35 (ref), v37 (ref)
                        v35.onContainerRendered(v41, v37);
                    end
                }, {
                    Page = l_Roact_0.createElement(v11[v37], {
                        pageTitle = v38.title and v40.title
                    })
                });
            else
                return l_Roact_0.createElement(v8, {
                    Enabled = v35.props.currentPage == v37
                }, {
                    ModalPageContent = l_Roact_0.createElement(v11[v37], {
                        pageTitle = v40.title
                    })
                });
            end;
        end);
    end;
    local v42 = v35.props.controllerBarCount > 0 and -1 * v10.ControllerBarHeight or nil;
    return l_Roact_0.createElement("Frame", {
        Size = UDim2.new(0, 400, 1, v42), 
        Position = UDim2.new(0, 64, 0, 0), 
        BackgroundTransparency = 1, 
        Visible = v35.props.visible, 
        ClipsDescendants = true
    }, v36);
end;
v15.didUpdate = function(v43, v44, _) --[[ Line: 122 ]] --[[ Name: didUpdate ]]
    -- upvalues: v9 (copy), l_Otter_0 (copy)
    local l_currentPage_0 = v44.currentPage;
    local l_currentPage_1 = v43.props.currentPage;
    if l_currentPage_0 ~= l_currentPage_1 then
        local l_isModal_0 = v9.pagesByKey[l_currentPage_1].isModal;
        local l_isModal_1 = v9.pagesByKey[l_currentPage_0].isModal;
        if l_isModal_0 or l_isModal_1 then
            return;
        else
            if v9.pagesByKey[l_currentPage_0].navigationDepth < v9.pagesByKey[l_currentPage_1].navigationDepth then
                if not l_isModal_0 then
                    v43.pageMotor:setGoal({
                        [l_currentPage_0] = l_Otter_0.spring(1.25, {
                            frequency = 2.5
                        })
                    });
                end;
            elseif v9.pagesByKey[l_currentPage_0].navigationDepth == v9.pagesByKey[l_currentPage_1].navigationDepth then
                v43.pageMotor:setGoal({
                    [l_currentPage_0] = l_Otter_0.spring(0, {
                        frequency = 2.5
                    })
                });
            else
                local v50 = {};
                local l_l_currentPage_0_0 = l_currentPage_0;
                while l_l_currentPage_0_0 ~= nil and l_l_currentPage_0_0 ~= l_currentPage_1 do
                    v50[l_l_currentPage_0_0] = l_Otter_0.spring(0, {
                        frequency = 3.5
                    });
                    l_l_currentPage_0_0 = v9.pagesByKey[l_l_currentPage_0_0].parentPage;
                end;
                v43.pageMotor:setGoal(v50);
            end;
            v43.pageMotor:setGoal({
                [l_currentPage_1] = l_Otter_0.spring(1, {
                    frequency = 2.5
                })
            });
        end;
    end;
end;
v15.willUnmount = function(v52) --[[ Line: 165 ]] --[[ Name: willUnmount ]]
    -- upvalues: v9 (copy), l_GuiService_0 (copy)
    for v53, v54 in pairs(v9.pagesByKey) do
        if not v54.isModal then
            local v55 = v52.getSelectionParentNameFromKey(v53);
            l_GuiService_0:RemoveSelectionGroup(v55);
        end;
    end;
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v56) --[[ Line: 174 ]]
    return {
        currentPage = v56.menuPage, 
        visible = v56.isMenuOpen, 
        controllerBarHeight = v56.controllerBarHeight, 
        controllerBarCount = v56.controllerBarCount
    };
end)(v15);