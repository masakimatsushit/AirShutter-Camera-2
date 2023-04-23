//
//  widget2.swift
//  widget2
//
//  Created by matsushitamasaki on 2023/04/07.
//


//  wwwidgettt.swift
//  wwwidgettt
//
//  Created by matsushitamasaki on 2023/03/18.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct widget2EntryView : View {
    var entry: Provider.Entry

    var body: some View {
        HStack{
            Image(systemName: "camera")
        Text("2")
        }
        
            
    }
}

struct widget2: Widget {
    let kind: String = "wwwidgettt"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            widget2EntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies(supportedFamilies)
    }
    
    private var supportedFamilies: [WidgetFamily] {
           if #available(iOSApplicationExtension 16.0, *) {
               return [
                   .accessoryCircular,
                   .accessoryRectangular
               ]
           } else {
               return [
                   
               ]
           }
       }
    
}

struct wwwidgettt_Previews: PreviewProvider {
    static var previews: some View {
        widget2EntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
