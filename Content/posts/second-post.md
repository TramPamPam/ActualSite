
---
date: 2020-06-08 19:38
description: Custom body and title for GMail sharing
tags: first, article
---
# UIActivityItemSource example


```
class MailItemSource: NSObject, UIActivityItemSource {
    private let subject: String
    private let body: String

    init(subject: String, body: String) {
        self.subject = subject
        self.body = body
        super.init()
    }

    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        body
    }

    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        if activityType?.rawValue == "com.google.Gmail.ShareExtension" {
            return "\(subject) \n\n \(body)"
        }
        return body
    }

    func activityViewController(_ activityViewController: UIActivityViewController, subjectForActivityType activityType: UIActivity.ActivityType?) -> String {
        subject
    }
}
```

Usage:

```
 let source = MailItemSource(subject: title, body: text)
 let sharingScreen = UIActivityViewController(activityItems: [source], applicationActivities: [])
 <viewController>.present(sharingScreen, animated: true)
```
