function readAPI(f)

errAPIS = {}
for _, v in ipairs(fs.list("/.APIS")) do
    if not os.loadAPI("/.APIS/" .. v) then
        errAPIS[#errAPIS + 1] = v
    end
end
