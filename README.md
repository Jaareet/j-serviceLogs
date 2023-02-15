# FiveM Job Service Logs

>Requirements: [es_extended](https://github.com/esx-framework/esx_core/tree/main/%5Bcore%5D/es_extended)

## Installation

1. Extract the `j-serviceLogs` folder to your resources folder
2. Rename the folder to `j-serviceLogs`
3. In our `server.cfg` file, add the followed lines:

```cfg
ensure j-serviceLogs
```

4. Configure and enjoy!

## Features

- [x] Logs for [Discord](https://discord.com/)
- [x] Clean Code
- [x] Easy to use
- [x] Easy to install
- [x] Easy to configure
- [x] Now you can set an hexadecimal color code and convert it to decimal with convertHexToDecimal function, example:

```lua
-- Path: server/main.lua (Insert into JOB_LOGS table)
---@param color: string
['example_job_name'] = { -- In your SQL `jobs` table, get the name.
    webhook = 'https://discord.com/api/webhooks/...', -- Here your webhook link
    color = convertHexToDecimal('#000'), -- Here your color code: color introduced: black.
    title = 'Fichajes de los EMS', -- Your title here
    message = 'El usuario %s ha fichado su %s', -- Recomended message format.
},
```

## Support

If you need support, you can contact me on my [Discord](https://jaareet.es/discord) server.


* All rights reserved to [Jaareet](https://jaareet.es/github)
* Hope you like it!