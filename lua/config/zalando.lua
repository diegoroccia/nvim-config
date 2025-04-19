local function time_ago(date_str)
    -- Expects date_str in "YYYY-MM-DD" format
    local pattern = "(%d+)%-(%d+)%-(%d+)"
    local year, month, day = date_str:match(pattern)

    if not year or not month or not day then
        return "Invalid date"
    end

    local target_time = os.time({
        year = tonumber(year),
        month = tonumber(month),
        day = tonumber(day),
        hour = 0,
        min = 0,
        sec = 0
    })

    local current_time = os.time()
    local diff = os.difftime(current_time, target_time)
    local days = math.floor(diff / (60 * 60 * 24))

    if days < 0 then
        return "in the future"
    elseif days == 0 then
        return "today"
    elseif days == 1 then
        return "1 day ago"
    elseif days < 7 then
        return days .. " days ago"
    elseif days < 30 then
        local weeks = math.floor(days / 7)
        return weeks .. (weeks == 1 and " week ago" or " weeks ago")
    elseif days < 365 then
        local months = math.floor(days / 30)
        return months .. (months == 1 and " month ago" or " months ago")
    else
        local years = math.floor(days / 365)
        return years .. (years == 1 and " year ago" or " years ago")
    end
end

local M = {}

M.opts = {
    basedir = "~/code",
    org = "zalando-build",
    topic = "linus",
}

M.cache = {}

M.refresh_cache = function()
    -- if #M.cache > 0 and not force then
    --     vim.print(M.cache)
    --     return M.cache
    -- end

    local Job = require "plenary.job"

    local jobdef = {
        command = "gh",
        args = { "repo", "list", "--no-archived", "--limit", "1000", "--source", "--json",
            "name,owner,description,repositoryTopics,updatedAt,url,viewerHasStarred,sshUrl,issues,pullRequests,stargazerCount,updatedAt",
            M.opts.org, "--topic", M.opts.topic },
        on_exit = function(job)
            local result = job:result()
            local ok, items = pcall(vim.json.decode, table.concat(result, ""))

            if not ok then
                vim.notify("Failed to parse gh results", vim.log.levels.ERROR)
                return
            end

            for _, item in ipairs(items) do
                item.text = item.name
                table.insert(M.cache, item)
            end
        end
    }

    Job:new(jobdef):start()
end

M.finder = function()
    -- repeat vim.loop.sleep(1) until #M.cache > 0
    return M.cache
end


M.setup = function(user_opts)
    if user_opts ~= nil then
        M.opts = vim.tbl_deep_extend("force", M.opts, user_opts)
    end

    M.refresh_cache()

    vim.keymap.set("n", "<leader>gh", function()
        Snacks.picker.pick(M.picker())
    end, { desc = "Zalando Github Projects" })
end

M.picker = function()
    local basedir_expanded = vim.fn.expand(M.opts.basedir)

    local zalandoGithubPicker = {

        title = "Zalando Github Projects",
        finder = M.finder,
        -- items = M.cache,
        format = "text",
        prompt = "   ",

        preview = function(ctx)
            local item = ctx.item

            local tags = {}
            for _, topic in ipairs(item.repositoryTopics) do
                table.insert(tags, " " .. topic.name)
            end

            local lines = {
                "**" .. item.owner.login .. "/" .. item.name .. "**",
                "",
                item.description,
                "",
                "**Stats:** " ..
                table.concat({ "  " .. time_ago(item.updatedAt),
                    "  " .. item.issues.totalCount,
                    "  " .. item.pullRequests.totalCount,
                    "  " .. item.stargazerCount }, " | "),
                "",
                "**Topics:** " .. table.concat(tags, " "),
                "",
                "[link to the repository](" .. item.url .. ")",
                "",
                "Press <C-b> to open in the browser",
            }

            ctx.preview:set_lines(lines)
            ctx.preview:highlight({ ft = "markdown" })
        end,

        confirm = function(picker, item)
            picker:close()
            local path = table.concat({ basedir_expanded, M.opts.org, M.opts.topic, item.name }, "/")
            if vim.fn.isdirectory(path) == 1 then
                Snacks.picker.files({ cwd = path })
            else
                Snacks.input.input({
                    prompt = "The path does not exist, create it?",
                }, function(confirm)
                    if confirm then
                        local parentpath = table.concat({ basedir_expanded, M.opts.org, M.opts.topic }, "/")
                        vim.fn.mkdir(parentpath, "p")
                        vim.system({ "gh", "repo", "clone", item.url }, { cwd = parentpath }):wait()
                        Snacks.picker.files({ cwd = path })
                    else
                        Snacks.notify("Aborting")
                        return
                    end
                end)
            end
        end,

        actions = {
            refresh_cache = {
                name = "refresh_cache",
                action = function()
                    M.refresh_cache()
                end,
            },
            browse = {
                name = "browse",
                action = function(self, item)
                    if not item then return end
                    self:close()
                    Snacks.notify("Opening in the browser")
                    vim.system({ "xdg-open", item.url })
                end,
            }
        },

        win = {
            preview = {
                wo = {
                    wrap = true,
                    conceallevel = 2,
                    number = false,
                    concealcursor = "nvc",
                },
            },
            list = {
                keys = {
                    ["<c-r>"] = {
                        "cache_refresh",
                        mode = { "n", "v", "x", "s", "o", "i", "c", "t" },
                    },
                }
            },
            input = {
                keys = {
                    ["<c-b>"] = {
                        "browse",
                        mode = { "n", "v", "x", "s", "o", "i", "c", "t" },
                    },
                    ["<c-r>"] = {
                        "cache_refresh",
                        mode = { "n", "v", "x", "s", "o", "i", "c", "t" },
                    },
                }
            },
        }
    }

    return zalandoGithubPicker
end

return M
