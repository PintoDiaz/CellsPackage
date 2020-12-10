//
//  ContentView.swift
//  CellPreview
//
//  Created by Pinto Diaz, Roger on 12/10/20.
//

import SwiftUI

public struct Cell: View {
    var title: String
    var amount: String
    var invoiceNumber: String
    var reference: String
    var status: String
    var date: String

    public init(title: String, amount: String, invoiceNumber: String, reference: String, status: String, date: String) {
        self.title = title
        self.amount = amount
        self.invoiceNumber = invoiceNumber
        self.reference = reference
        self.status = status
        self.date = date
    }

    public var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 8, content: {
            HStack(alignment: .firstTextBaseline, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                Text(title)
                    .bold()
                    .truncationMode(.middle)
                Spacer()
                Text(amount)
            })

            HStack(alignment: .firstTextBaseline, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                Text(invoiceNumber)
                Text(reference)
                    .font(.footnote)
                    .lineLimit(1)
                    .truncationMode(.middle)
                Spacer()
            })

            HStack(alignment: .firstTextBaseline, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                Text(status)
                    .bold()
                Spacer()
                Text(date)
                    .font(.footnote)
            })
        }).padding(.horizontal)
    }
}

struct Cell_Previews: PreviewProvider {
    static let localizations = Bundle.main.localizations.map(Locale.init).filter { $0.identifier != "base" }
    static let dynamicTypeSizes: [ContentSizeCategory] = [.extraSmall, .large, .extraExtraExtraLarge]

    static var previews: some View {
        Group {
            ForEach(dynamicTypeSizes, id: \.self) { sizeCategory in
                Cell(
                    title: "Joakim Broden",
                    amount: "5 Pounds",
                    invoiceNumber: "SI-4",
                    reference: "Reference",
                    status: "Outstanding",
                    date: "Dec 10"
                ).environment(\.sizeCategory, sizeCategory)
                .previewDisplayName("\(sizeCategory)")
            }

            Cell(
                title: "Christiane Nüsslein-Volhard",
                amount: "10 euros",
                invoiceNumber: "SI-440",
                reference: "Dies ist ein Satz mit fünfzig Zeichen, der überläuft.",
                status: "Hervorragend",
                date: "Dec 10"
            ).background(Color(.systemBackground))
            .environment(\.colorScheme, .dark)
        }.previewLayout(.sizeThatFits)
    }
}
