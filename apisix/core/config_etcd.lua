-- ... (existing code)

local function sync_config_from_etcd()
    -- ... (existing code)

    -- Notify all worker processes to update their local cache
    local function notify_workers(conf_version)
        for _, worker in ipairs(ngx.worker.get_workers()) do
            worker:notify("update_config", conf_version)
        end
    end

    -- ... (existing code)

    -- Update the configuration version and notify workers
    local conf_version = etcd:get("conf_version")
    notify_workers(conf_version)
end

-- ... (rest of the file)