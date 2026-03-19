local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Boolean_0 = v2.Boolean;
local l_Object_0 = v2.Object;
local v5 = {};
local v6 = {
    OS = "roblox"
};
local v7 = require(l_Parent_1.React);
local v8 = require(script.Parent.VirtualizedSectionList);
local _ = require(l_Parent_0.Components.ScrollView.ScrollView);
local v10 = v7.PureComponent:extend("SectionList");
v10.init = function(v11, v12) --[[ Line: 195 ]] --[[ Name: init ]]
    v11.props = v12;
    v11._captureRef = function(v13) --[[ Line: 197 ]]
        -- upvalues: v11 (copy)
        v11._wrapperListRef = v13;
    end;
end;
v10.scrollToLocation = function(v14, v15) --[[ Line: 212 ]] --[[ Name: scrollToLocation ]]
    if v14._wrapperListRef ~= nil then
        v14._wrapperListRef:scrollToLocation(v15);
    end;
end;
v10.recordInteraction = function(v16) --[[ Line: 225 ]] --[[ Name: recordInteraction ]]
    local v17 = if v16._wrapperListRef then v16._wrapperListRef:getListRef() else v16._wrapperListRef;
    if v17 then
        v17:recordInteraction();
    end;
end;
v10.flashScrollIndicators = function(v18) --[[ Line: 237 ]] --[[ Name: flashScrollIndicators ]]
    local v19 = if v18._wrapperListRef then v18._wrapperListRef:getListRef() else v18._wrapperListRef;
    if v19 then
        v19:flashScrollIndicators();
    end;
end;
v10.getScrollResponder = function(v20) --[[ Line: 247 ]] --[[ Name: getScrollResponder ]]
    -- upvalues: l_Boolean_0 (copy)
    local v21 = if v20._wrapperListRef then v20._wrapperListRef:getListRef() else v20._wrapperListRef;
    if l_Boolean_0.toJSBoolean(v21) then
        return v21:getScrollResponder();
    else
        return nil;
    end;
end;
v10.getScrollableNode = function(v22) --[[ Line: 255 ]] --[[ Name: getScrollableNode ]]
    -- upvalues: l_Boolean_0 (copy)
    local v23 = if v22._wrapperListRefthen then v22._wrapperListRef:getListRef() else v22._wrapperListRef;
    if l_Boolean_0.toJSBoolean(v23) then
        return v23:getScrollableNode();
    else
        return nil;
    end;
end;
v10.setNativeProps = function(v24, v25) --[[ Line: 263 ]] --[[ Name: setNativeProps ]]
    -- upvalues: l_Boolean_0 (copy)
    local v26 = if v24._wrapperListRef then v24._wrapperListRef:getListRef() else v24._wrapperListRef;
    if l_Boolean_0.toJSBoolean(v26) then
        v26:setNativeProps(v25);
    end;
end;
v10.render = function(v27) --[[ Line: 270 ]] --[[ Name: render ]]
    -- upvalues: l_Object_0 (copy), v6 (copy), v7 (copy), v8 (copy)
    local l_stickySectionHeadersEnabled_0 = v27.props.stickySectionHeadersEnabled;
    local v29 = l_Object_0.assign({}, v27.props, {
        stickySectionHeadersEnabled = l_Object_0.None
    });
    local v30 = if l_stickySectionHeadersEnabled_0 ~= nil then l_stickySectionHeadersEnabled_0 else v6.OS == "ios";
    return v7.createElement(v8, l_Object_0.assign({}, v29, {
        stickySectionHeadersEnabled = v30, 
        ref = v27._captureRef, 
        getItemCount = function(v31) --[[ Line: 282 ]] --[[ Name: getItemCount ]]
            return #v31;
        end, 
        getItem = function(v32, v33) --[[ Line: 285 ]] --[[ Name: getItem ]]
            return v32[v33];
        end
    }));
end;
v5.default = v10;
return v5;