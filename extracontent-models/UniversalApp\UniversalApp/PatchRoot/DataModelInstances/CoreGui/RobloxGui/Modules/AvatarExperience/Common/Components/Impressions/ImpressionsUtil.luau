return {
    writeItemAttributes = function(v0, v1, v2) --[[ Line: 58 ]] --[[ Name: writeItemAttributes ]]
        if not v0 then
            warn("Impressions schema is nil");
            return;
        else
            for v3, v4 in v0.mapping do
                local v5 = v2[v3];
                if v5 then
                    v1:SetAttribute(v4.attribute, v5);
                end;
            end;
            return;
        end;
    end, 
    buildSchema = function(v6, v7) --[[ Line: 74 ]] --[[ Name: buildSchema ]]
        local v8 = {};
        local l_groupBy_0 = v7.groupBy;
        for _, v11 in v7.mapping do
            local v12 = if l_groupBy_0 then table.find(l_groupBy_0, v11.out) ~= nil else false;
            v8[v11.prop] = {
                attribute = string.format("%s_%s", v6, v11.prop), 
                out = v11.out, 
                isGrouping = v12
            };
        end;
        if l_groupBy_0 then
            for _, v14 in l_groupBy_0 do
                local v15 = false;
                for _, v17 in v7.mapping do
                    if v17.out == v14 then
                        v15 = true;
                    end;
                    if v15 then
                        break;
                    end;
                end;
                if not v15 then
                    error(string.format("Impression schema groupBy field '%s' not specified in output mapping", v14));
                end;
            end;
        end;
        return {
            mapping = v8, 
            enumMap = v7.enumMap, 
            surfaceSpecificAnalyticsMetadata = v7.surfaceSpecificAnalyticsMetadata
        };
    end, 
    packEvents = function(v18, v19) --[[ Line: 116 ]] --[[ Name: packEvents ]]
        if not v18 then
            warn("Impressions schema nil");
            return;
        else
            local v20 = {};
            local v21 = {};
            for v22, v23 in v19 do
                local l_v23_Attributes_0 = v23:GetAttributes();
                local v25 = "";
                for _, v27 in v18.mapping do
                    if v27.isGrouping then
                        v25 = v25 .. (l_v23_Attributes_0[v27.attribute] or "_");
                    end;
                end;
                local v28 = v20[v25] or {};
                v20[v25] = v28;
                for _, v30 in v18.mapping do
                    local v31 = l_v23_Attributes_0[v30.attribute];
                    local l_out_0 = v30.out;
                    if v30.isGrouping then
                        v28[l_out_0] = v31;
                    else
                        local v33 = v28[l_out_0] or {};
                        v28[l_out_0] = v33;
                        v33[v22] = v31 or "";
                        if v18.enumMap and v18.enumMap[l_out_0] then
                            v33[v22] = v18.enumMap[l_out_0][v31];
                        end;
                    end;
                end;
            end;
            for _, v35 in v20 do
                local v36 = {};
                table.insert(v21, v36);
                for _, v38 in v18.mapping do
                    local l_out_1 = v38.out;
                    local v40 = v35[l_out_1];
                    if typeof(v40) == "table" then
                        for _, v42 in v40 do
                            if v36[l_out_1] then
                                v36[l_out_1] = v36[l_out_1] .. "," .. tostring(v42);
                            else
                                v36[l_out_1] = tostring(v42);
                            end;
                        end;
                    else
                        v36[l_out_1] = v40;
                    end;
                end;
            end;
            return v21;
        end;
    end
};