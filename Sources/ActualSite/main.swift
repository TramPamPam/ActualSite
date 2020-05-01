import Foundation
import Publish
import Plot
import SplashPublishPlugin

// This type acts as the configuration for your website.
struct ActualSite: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case posts
        case about
        case FAQ
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://trampampam.github.io")!
    var name = "Hello world!"
    var description = "HI   "
    var language: Language { .english }
    var imagePath: Path? { nil }
}



// This will generate your website using the built-in Foundation theme:
try ActualSite().publish(withTheme: .customTheme, plugins: [.splash(withClassPrefix: "")])

