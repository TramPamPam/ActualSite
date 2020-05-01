//
//  File.swift
//  
//
//  Created by Oleksandr on 22.04.2020.
//

import Publish
import Plot

extension Node where Context == HTML.BodyContext {
    static func wrapper(_ nodes: Node...) -> Node {
        .div(.class("wrapper"), .group(nodes))
    }

    static func itemList<T: Website>(for items: [Item<T>], on site: T) -> Node {
        .ul(
            .class("item-list"),
            .forEach(items) { item in
                .li(.article(
                    .h1(.a(
                        .href(item.path),
                        .text(item.title)
                    )),
                    .p(.text(item.description))
                ))
            }
        )
    }

    static func customHeader<Site: Website>(
        for context: PublishingContext<Site>,
        selectedSection: Site.SectionID?
    ) -> Node {
        let sectionIDs = Site.SectionID.allCases

        return .header(
            .wrapper(
                .nav(
                    .class("site-name"),
                    .a(.href("/"), .text(context.site.name))
                ),
                .br(),
                .br(),
                .if(sectionIDs.count > 1,
                    .nav(
                        .ul(.forEach(sectionIDs) { section in
                            .li(.a(
                                .class(section == selectedSection ? "selected" : ""),
                                .href(context.sections[section].path),
                                .text(context.sections[section].title)
                            ))
                        })
                    )
                )

            )
        )
    }

    static func catFooter<T: Website>(for site: T) -> Node {
        var randomDimension: Int {
            [Int](100...300).randomElement() ?? 200
        }

        return .footer(
            .wrapper(
               .text("Random cat \(randomDimension)x\(randomDimension) : "),
               .br(),
               .img(.src(Path("https://placekitten.com/\(randomDimension)/\(randomDimension)")) ),
               .br(),
               .br(),
               .p(
                   .text("Generated using "),
                   .a(
                       .text("Publish"),
                       .href("https://github.com/johnsundell/publish")
                   )
               )
            ) // wrapper
        ) // footer
    }

}
