local utils_module = {}

-- Log to file
function utils_module.printToFile(line, txt)
	local s = "echo \"Line " .. line .. " - " .. txt .."\"  >> /tmp/JwtAuthorizerLogs.txt"
	os.execute(s)
end

-- String split
function utils_module.split(source, delimiters)
   local elements = {}
   local pattern = '([^'..delimiters..']+)'
   string.gsub(source, pattern, function(value) elements[#elements + 1] =     value;  end);
   return elements
end

return utils_module
