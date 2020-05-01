//
//  Theme+CustomTheme.swift
//  
//
//  Created by Oleksandr on 22.04.2020.
//

import Publish

extension Theme {
    static var customTheme: Theme {
        Theme(htmlFactory: CustomHTMLFactory(),
              resourcePaths: ["Resources/CustomTheme/styles.css"])
    }
}
