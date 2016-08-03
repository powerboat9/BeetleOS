function parseMetadata(f)
    data = {}
    local f = fs.open(f, "r")
    if !f then
        return false
    end
    while true do
        local line = f.readLine()
        if !line then
            break
        end
        if line:sub(1, 1) ~= "@" then
            break
        end
        

function readAPI(f)
    local data = {}
    if fs.exists(f .. "/pkg.txt") then
        local f = fs.open(f .. "/pkg.txt")
        data = textutils.unserialize(f.readAll())
        f.close()
    else
        return false
    end
    if type(data.name) ~= "string" then
        return false
    end
    if type(data.dependenc

local errAPIS = {}
for _, v in ipairs(fs.list("/.APIS")) do
    if not os.loadAPI("/.APIS/" .. v) then
        errAPIS[#errAPIS + 1] = v
    end
end
