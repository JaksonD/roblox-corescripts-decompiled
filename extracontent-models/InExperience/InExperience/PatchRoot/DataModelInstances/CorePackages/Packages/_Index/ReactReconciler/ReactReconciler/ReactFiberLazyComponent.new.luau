return {
    resolveDefaultProps = function(v0, v1) --[[ Line: 14 ]] --[[ Name: resolveDefaultProps ]]
        if v0 and typeof(v0) == "table" and v0.defaultProps then
            local v2 = table.clone(v1);
            local l_defaultProps_0 = v0.defaultProps;
            for v4, _ in l_defaultProps_0 do
                if v2[v4] == nil then
                    v2[v4] = l_defaultProps_0[v4];
                end;
            end;
            return v2;
        else
            return v1;
        end;
    end
};