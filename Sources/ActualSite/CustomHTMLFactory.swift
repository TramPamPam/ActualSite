//
//  CustomHTMLFactory.swift
//  
//
//  Created by Oleksandr on 22.04.2020.
//

import Publish
import Plot
import SplashPublishPlugin

struct CustomHTMLFactory<Site: Website>: HTMLFactory {
    func makeIndexHTML(for index: Index, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .head(for: index, on: context.site),
            .body(
                .customHeader(for: context, selectedSection: nil),
                .wrapper(
                    .ul(
                        .class("item-list"),
                        .forEach(context.allItems(sortedBy: \.date, order: .descending)) {
                            .li(
                                .article(
                                    .h1(
                                        .a(.href($0.path), .text($0.title))
                                    ),
                                    .p(.text($0.description))
                                )
                            )
                        }
                    )
                ),
                .catFooter(for: context.site)
            )
        )
    }

    func makeSectionHTML(for section: Section<Site>, context: PublishingContext<Site>) throws -> HTML {
        switch section.id as! ActualSite.SectionID {
        case .faq:
            return HTML(
                    .lang(context.site.language),
                    .head(for: section, on: context.site),
                    .body(
                        .customHeader(for: context, selectedSection: section.id),
                        .wrapper(
                            section.content.body.node
                        ),
                        .catFooter(for: context.site)
                    )
                )
        default:
            return HTML(
                .lang(context.site.language),
                .head(for: section, on: context.site),
                .body(
                    .customHeader(for: context, selectedSection: section.id),
                    .wrapper(
                        .h1(.text(section.title)),
                        .itemList(for: section.items, on: context.site)
                    ),
                    .catFooter(for: context.site)
                )
            )
        }
    }

    func makeItemHTML(for item: Item<Site>, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .head(for: item, on: context.site),
            .body(
                .customHeader(for: context, selectedSection: nil),
                .wrapper(
                    .article(
                        .class("content"),
                        .contentBody(item.body)
                    )
                ),
                .footer(
                    .text("Hello")
                )
            )
        )
    }

    func makePageHTML(for page: Page, context: PublishingContext<Site>) throws -> HTML {
        try makeIndexHTML(for: context.index, context: context)
    }

    func makeTagListHTML(for page: TagListPage, context: PublishingContext<Site>) throws -> HTML? {
        nil
    }

    func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<Site>) throws -> HTML? {
        nil
    }


}
