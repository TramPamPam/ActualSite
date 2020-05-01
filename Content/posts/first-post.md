---
date: 2020-04-22 19:38
description: A simple example of networking in Cocoa
tags: first, article
---
# URL Session



Example:

```

import Cocoa

let session = URLSession(configuration: URLSessionConfiguration.default)
var getTask = URLSessionTask()

var request = URLRequest(url: URL(string: "https://itunes.apple.com/search?term=jack+johnson&limit=25")!)
request.httpMethod = "GET"

getTask = session.dataTask(with: request, completionHandler: { (data, response, error) in
    debugPrint("(data \(data != nil), response \(response), error \(response)")
})


getTask.resume()


```
