import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import PerfectPostgreSQL

var HTTPport = 8180

var confData: [String:[[String:Any]]] = [
    "servers": [
        [
            "name":"estate_score_swift_server",
            "port":HTTPport,
            "routes":[],
            "filters":[]
        ]
    ]
]

// Load Filters
confData["servers"]?[0]["filters"] = filters()

// Load Routes
confData["servers"]?[0]["routes"] = mainRoutes()

do {
    // Launch the servers based on the configuration data.
    try HTTPServer.launch(configurationData: confData)
} catch {
    // fatal error launching one of the servers
        fatalError("\(error)")
}
