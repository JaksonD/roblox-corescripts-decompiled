local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_0.App.Loading.Enum.RetrievalStatus);
local v5 = require(l_Parent_0.App.Container.LoadingStatePage);
local v6 = require(l_Parent_0.App.Container.FailedStatePage);
local v7 = v2.PureComponent:extend("LoadingStateContainer");
v7.validateProps = v3.strictInterface({
    dataStatus = v4.isEnumValue, 
    renderOnLoaded = v3.callback, 
    renderOnFailed = v3.optional(v3.callback), 
    onRetry = v3.optional(v3.callback), 
    renderOnLoading = v3.optional(v3.callback), 
    renderOnEmpty = v3.optional(v3.callback)
});
v7.init = function(v8) --[[ Line: 30 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v2 (copy), v5 (copy), v6 (copy)
    v8.statePages = {
        [v4.NotStarted] = function() --[[ Line: 32 ]]
            -- upvalues: v8 (copy), v2 (ref), v5 (ref)
            if v8.props.renderOnEmpty then
                return v8.props.renderOnEmpty();
            elseif v8.props.renderOnLoading then
                return v8.props.renderOnLoading();
            else
                return v2.createElement(v5);
            end;
        end, 
        [v4.Fetching] = function() --[[ Line: 43 ]]
            -- upvalues: v8 (copy), v2 (ref), v5 (ref)
            if v8.props.renderOnLoading then
                return v8.props.renderOnLoading();
            else
                return v2.createElement(v5);
            end;
        end, 
        [v4.Failed] = function() --[[ Line: 50 ]]
            -- upvalues: v8 (copy), v2 (ref), v6 (ref)
            if v8.props.renderOnFailed then
                return v8.props.renderOnFailed();
            else
                return v2.createElement(v6, {
                    onRetry = v8.props.onRetry
                });
            end;
        end, 
        [v4.Done] = function() --[[ Line: 59 ]]
            -- upvalues: v8 (copy)
            return v8.props.renderOnLoaded();
        end
    };
end;
v7.render = function(v9) --[[ Line: 65 ]] --[[ Name: render ]]
    return v9.statePages[v9.props.dataStatus]();
end;
return v7;